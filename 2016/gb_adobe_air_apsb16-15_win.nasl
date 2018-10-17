###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_air_apsb16-15_win.nasl 8176 2017-12-19 12:50:00Z cfischer $
#
# Adobe Air Security Updates( apsb16-15 )-Windows
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:adobe:adobe_air";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808101");
  script_version("$Revision: 8176 $");
  script_cve_id("CVE-2016-1096", "CVE-2016-1097", "CVE-2016-1098", "CVE-2016-1099", 
		"CVE-2016-1100", "CVE-2016-1101", "CVE-2016-1102", "CVE-2016-1103", 
		"CVE-2016-1104", "CVE-2016-1105", "CVE-2016-1106", "CVE-2016-1107", 
		"CVE-2016-1108", "CVE-2016-1109", "CVE-2016-1110", "CVE-2016-4108", 
		"CVE-2016-4109", "CVE-2016-4110", "CVE-2016-4111", "CVE-2016-4112", 
		"CVE-2016-4113", "CVE-2016-4114", "CVE-2016-4115", "CVE-2016-4116", 
	        "CVE-2016-4117");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-12-19 13:50:00 +0100 (Tue, 19 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-05-13 10:42:48 +0530 (Fri, 13 May 2016)");
  script_name("Adobe Air Security Updates( apsb16-15 )-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Air
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The multiple flaws exists due to,
  - Multiple type confusion vulnerabilities.
  - Multiple use-after-free vulnerabilities.
  - A heap buffer overflow vulnerability.
  - A buffer overflow vulnerability.
  - Multiple memory corruption vulnerabilities.
  - A vulnerability in the directory search path used to find resources.");

  script_tag(name:"impact" , value:"Successful exploitation of this
  vulnerability will allow remote attackers to execute arbitrary code.

  Impact Level: System/Application.");

  script_tag(name: "affected" , value:"Adobe Air version before
  21.0.0.215 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Adobe Air version
  21.0.0.215 or later.
  For updates refer to http://get.adobe.com/air");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name: "URL" , value :"https://helpx.adobe.com/security/products/flash-player/apsb16-15.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("Adobe/Air/Win/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
airVer = "";

## Get version
if(!airVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:airVer, test_version:"21.0.0.215"))
{
  report = report_fixed_ver(installed_version:airVer, fixed_version:"21.0.0.215");
  security_message(data:report);
  exit(0);
}
