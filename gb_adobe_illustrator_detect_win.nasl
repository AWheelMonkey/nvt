###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_illustrator_detect_win.nasl 11279 2018-09-07 09:08:31Z cfischer $
#
# Adobe Illustrator Detection (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Updated By: Thanga Prakash S <tprakash@secpod.com> on 2014-06-03
# Updated plugin completely according to CR57 and to support 32 and 64 bit,
# Because logic is not proper and it is not used by any scripts.
#
# Copyright:
# Copyright (C) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802789");
  script_version("$Revision: 11279 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-07 11:08:31 +0200 (Fri, 07 Sep 2018) $");
  script_tag(name:"creation_date", value:"2012-05-16 19:02:06 +0530 (Wed, 16 May 2012)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Adobe Illustrator Detection (Windows)");


  script_tag(name:"summary", value:"Detects the installed version of Adobe
Illustrator on Windows.

The script logs in via smb, searches for Adobe Illustrator in the
registry and gets the version.");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
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

appkey = "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Illustrator.exe";
if(!registry_key_exists(key:appkey))
{
  appkey = "SOFTWARE\Wow6432Node\Windows\CurrentVersion\App Paths\Illustrator.exe";
  if(!registry_key_exists(key:appkey)){
    exit(0);
  }
}

os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(0);
}

if("x86" >< os_arch){
  key = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
}

## 64bit and 32bit applications both installs in Wow6432Node
else if("x64" >< os_arch){
  key = "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\";
}

if(!registry_key_exists(key:key)) {
  exit(0);
}

foreach item (registry_enum_keys(key:key))
{
  ilsName = registry_get_sz(key:key + item, item:"DisplayName");
  ilsPath = registry_get_sz(key:key + item, item:"InstallLocation");

  if("Adobe Illustrator" >< ilsName || ("Adobe" >< ilsPath && "Illustrator" >< ilsPath))
  {
    ilsVer = registry_get_sz(key:key + item, item:"DisplayVersion");

    if(ilsVer)
    {
      set_kb_item(name:"Adobe/Illustrator/Win/Ver", value:ilsVer);

      cpe = build_cpe(value:ilsVer, exp:"^([0-9.]+)", base:"cpe:/a:adobe:illustrator:");
      if(isnull(cpe))
        cpe = "cpe:/a:adobe:illustrator";

      appPath = registry_get_sz(key:appkey, item:"Path");

      if("x64" >< os_arch && "64 Bit" >< appPath)
      {
        set_kb_item(name:"Adobe/Illustrator64/Win/Ver", value:ilsVer);

        cpe = build_cpe(value:ilsVer, exp:"^([0-9.]+)", base:"cpe:/a:adobe:illustrator:x64:");
        if(isnull(cpe))
          cpe = "cpe:/a:adobe:illustrator:x64";
      }
      register_product(cpe:cpe, location:ilsPath);

      log_message(data: build_detection_report(app: ilsName,
                                               version: ilsVer,
                                               install: ilsPath,
                                               cpe: cpe,
                                               concluded: ilsVer));
    }
  }
}
