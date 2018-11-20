##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nomachine_for_windows_detect.nasl 12430 2018-11-20 07:03:47Z cfischer $
#
# NoMachine Version Detection (Windows)
#
# Authors:
# Michael Martin <michael.martin@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH, http//www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.107371");
  script_version("$Revision: 12430 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-20 08:03:47 +0100 (Tue, 20 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-19 14:27:32 +0100 (Mon, 19 Nov 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("NoMachine Version Detection (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);

  script_tag(name:"summary", value:"This script detects the installed version
  of NoMachine for Windows.");

  script_tag(name:"qod_type", value:"registry");

  exit(0);
}

include("smb_nt.inc");
include("cpe.inc");
include("host_details.inc");
include("secpod_smb_func.inc");

foreach key(registry_enum_keys(key:"SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall")){

  key = "SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\" + key;
  if(!registry_key_exists(key:key)) continue;

  # "NoMachine" without any version
  appName = registry_get_sz(key:key, item:"DisplayName");
  if(!appName || appName !~ "NoMachine") continue;

  version = "unknown";
  concluded = appName;
  location = "unknown";

  loc = registry_get_sz(key:key, item:"InstallLocation");
  if(loc) location = loc;

  # 5.3.12
  vers = registry_get_sz(key:key, item:"DisplayVersion");
  if(vers){
    version = vers;
    concluded += " " + vers;
  }

  set_kb_item(name:"nomachine/win/detected", value:TRUE);
  set_kb_item(name:"nomachine/win/ver", value:version);

  register_and_report_cpe(app:"NoMachine for Windows" , ver:version, concluded:concluded,
                          base:"cpe:/a:nomachine:nomachine:", expr:"^([0-9.]+)", insloc:location);
  exit(0);
}

exit(0);