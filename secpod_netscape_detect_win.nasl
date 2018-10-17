###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_netscape_detect_win.nasl 11279 2018-09-07 09:08:31Z cfischer $
#
# Netscape Version Detection (Windows)
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.900392");
  script_version("$Revision: 11279 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-07 11:08:31 +0200 (Fri, 07 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-07-29 08:37:44 +0200 (Wed, 29 Jul 2009)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Netscape Version Detection (Windows)");


  script_tag(name:"summary", value:"Detects the installed version of Netscape.

The script logs in via smb, searches for Netscape in the registry and
gets the version from registry.");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
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

osArch = get_kb_item("SMB/Windows/Arch");
if(!osArch){
  exit(0);
}

## common key will be created for 32 and 64 bit
if(!registry_key_exists(key:"SOFTWARE\Netscape")){
  if(!registry_key_exists(key:"SOFTWARE\Wow6432Node\Netscape")){
    exit(0);
  }
}

## if os is 32 bit iterate over comman path
if("x86" >< osArch){
  key_list = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
}

## 64 bit app is not available, but added code by assuming.
else if("x64" >< osArch){
 key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\",
                      "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\");
}

foreach key (key_list)
{
  foreach item (registry_enum_keys(key:key))
  {
    appName = registry_get_sz(key:key + item, item:"DisplayName");

    if("Netscape Navigator" >< appName || appName =~ "Netscape \(([0-9.]+)\)")
    {
      nsVer = registry_get_sz(key:key + item, item:"DisplayVersion");
      if(nsVer)
      {
        nsVer =  eregmatch(pattern:"([0-9.]+)", string:nsVer);
        if(nsVer[1]){
          nsVer = nsVer[1];
        }
      }

      if(nsVer)
      {
        appLoc = registry_get_sz(key:key + item, item:"InstallLocation");
        if(!appLoc){
          appLoc = "Couldn find the install location from registry";
        }

        set_kb_item(name:"Netscape/Win/Ver", value:nsVer);

        cpe = build_cpe(value:nsVer, exp:"^([0-9.]+)", base:"cpe:/a:netscape:navigator:");
        if(isnull(cpe))
          cpe = "cpe:/a:netscape:navigator";

        ## 64 bit apps on 64 bit platform
        if("x64" >< osArch && "Wow6432Node" >!< key)
        {
          set_kb_item(name:"Netscape64/Win/Ver", value:nsVer);

          cpe = build_cpe(value:nsVer, exp:"^([0-9.]+)", base:"cpe:/a:netscape:navigator:x64:");
          if(isnull(cpe))
            cpe = "cpe:/a:netscape:navigator:x64";
        }
        register_product(cpe:cpe, location:appLoc);
        log_message(data: build_detection_report(app: appName,
                                                 version: nsVer,
                                                 install: appLoc,
                                                 cpe: cpe,
                                                 concluded: nsVer));
      }
    }
  }
}
