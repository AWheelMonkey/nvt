##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_trillian_detect.nasl 11279 2018-09-07 09:08:31Z cfischer $
#
# Trillian Version Detection
#
# Authors:
# Sujit Ghosal <sghosal@secpod.com>
#
# Updated By: Thanga Prakash S <tprakash@secpod.com> on 2014-07-02
# Updated to support 32 and 64 bit
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800264");
  script_version("$Revision: 11279 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-07 11:08:31 +0200 (Fri, 07 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-04-07 07:29:53 +0200 (Tue, 07 Apr 2009)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Trillian Version Detection");

  script_tag(name:"summary", value:"Detects the installed version of Trillian on Windows.

The script logs in via smb, searches for Trillian in the registry
and gets the version from the file.");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}

include("smb_nt.inc");
include("secpod_smb_func.inc");
include("cpe.inc");
include("host_details.inc");
include("version_func.inc");

if(!registry_key_exists(key:"SOFTWARE\Clients\IM\Trillian"))
{
  if(!registry_key_exists(key:"SOFTWARE\Wow6432Node\Clients\IM\Trillian")){
    exit(0);
  }
}

os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(0);
}

if("x86" >< os_arch){
  key = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Trillian";
}

## Presently 64bit application is not available
else if("x64" >< os_arch){
  key =  "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Trillian";
}

if(!registry_key_exists(key:key)){
  exit(0);
}

exePath = registry_get_sz(key:key, item:"DisplayIcon");
dllFile = ereg_replace(pattern:"(t|T)rillian.exe", string:exePath, replace:"");

if(dllFile != NULL)
{
  triVer = fetch_file_version(sysPath:dllFile, file_name:"toolkit.dll");

  if(triVer)
  {
    set_kb_item(name:"Trillian/Ver", value:triVer);

    cpe = build_cpe(value:triVer, exp:"^([0-9.]+)", base:"cpe:/a:ceruleanstudios:trillian:");
    if(isnull(cpe))
      cpe = 'cpe:/a:ceruleanstudios:trillian';

    register_product(cpe:cpe, location:dllFile);

    log_message(data: build_detection_report(app: "Trillian",
                                             version: triVer,
                                             install: dllFile,
                                             cpe: cpe,
                                             concluded: triVer));
  }
}
