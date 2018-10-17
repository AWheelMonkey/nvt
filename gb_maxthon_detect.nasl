###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_maxthon_detect.nasl 11015 2018-08-17 06:31:19Z cfischer $
#
# Maxthon Version Detection
#
# Authors:
# Sharath S <sharaths@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.800895");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 11015 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 08:31:19 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2009-09-08 18:25:53 +0200 (Tue, 08 Sep 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Maxthon Version Detection");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  script_tag(name:"summary", value:"This script detects the installed version of Maxthon Browser
  and sets the result in KB.");
  exit(0);
}


include("smb_nt.inc");
include("secpod_smb_func.inc");
include("cpe.inc");
include("host_details.inc");

SCRIPT_DESC = "Maxthon Version Detection";

if(!get_kb_item("SMB/WindowsVersion"))
{
  exit(0);
}

maxthon = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
foreach item (make_list("Maxthon", "Maxthon2", "Maxthon3"))
{
  maxthonName = registry_get_sz(key:maxthon + item, item:"DisplayName");

  if("Maxthon" >< maxthonName)
  {
    maxthonVer = registry_get_sz(key:maxthon + item, item:"DisplayVersion");
    if(isnull(maxthonVer))
    {
      maxthonPath = registry_get_sz(key:maxthon + item, item:"DisplayIcon");
      if("Mx3Uninstall.exe" >< maxthonPath)
      maxthonPath = maxthonPath - "Mx3Uninstall.exe" + "Maxthon.exe";

      share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:maxthonPath);
      mfile = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:maxthonPath);
      maxthonVer = GetVer(file:mfile, share:share);
    }

    if(!isnull(maxthonVer))
    {
      set_kb_item(name:"Maxthon/Ver", value:maxthonVer);
      log_message(data:"Maxthon version " + maxthonVer + " was detected on the host");

      cpe = build_cpe(value:maxthonVer, exp:"^([0-9.]+)", base:"cpe:/a:maxthon:maxthon_browser:");
      if(!isnull(cpe))
         register_host_detail(name:"App", value:cpe, desc:SCRIPT_DESC);

    }
  }
}
