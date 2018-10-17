###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_manageengine_admanager_plus_detection_win.nasl 10922 2018-08-10 19:21:48Z cfischer $
#
# ManageEngine ADManager Plus Detection (Windows)
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.107129");
  script_version("$Revision: 10922 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 21:21:48 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-01-18 16:11:25 +0700 (Wed, 18 Jan 2017)");
  script_tag(name:"qod_type", value:"registry");
  script_name("ManageEngine ADManager Plus Version Detection (Windows)");

  script_tag(name:"summary", value:"Detects the installed version of
  ManageEngine ADManager Plus.

  The script logs in via smb, searches for ManageEngine ADManager Plus in the registry and gets the version from 'DisplayVersion' string from registry.");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

arch = get_kb_item("SMB/Windows/Arch");
if(!arch){
  exit(0);
}


if("x86" >< arch){
    key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\");
}

else if("x64" >< arch) {
    key_list =  make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\",
                        "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\");
}

if(isnull(key_list)){
  exit(0);
}
foreach key (key_list)
{
  foreach item (registry_enum_keys(key:key))
  {
   Name = registry_get_sz(key:key + item, item:"DisplayName");

   if("ADManager Plus" >< Name)
    {
      set_kb_item(name:"manageengine/admanager_plus/installed", value:TRUE);
      Ver = registry_get_sz(key:key + item, item:"DisplayVersion");
      Path = registry_get_sz(key:key + item, item:"InstallLocation");
      if(!Path){
        Path = "Unable to find the install location from registry";
      }

      if(Ver)
      {
        set_kb_item(name:"Manageengine/Admanager_Plus/Win/Ver", value:Ver);
        cpe = build_cpe(value:Ver, exp:"^([0-9.]+)", base:"cpe:/a:manageengine:admanager_plus:");
        if(isnull(cpe))
          cpe = "cpe:/a:manageengine:admanager_plus";

       register_product(cpe:cpe, location:Path, port:0);
       log_message(data: build_detection_report(app: "ManageEngine Admanager Plus",
                                                version: Ver,
                                                install: Path,
                                                cpe: cpe,
                                                concluded: Ver));
      }
    }
  }
}



