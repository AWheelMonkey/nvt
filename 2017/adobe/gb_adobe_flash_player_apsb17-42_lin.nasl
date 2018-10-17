##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_apsb17-42_lin.nasl 8493 2018-01-23 06:43:13Z ckuersteiner $
#
# Adobe Flash Player Security Updates(apsb17-42)-Linux
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:adobe:flash_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812252");
  script_version("$Revision: 8493 $");
  script_cve_id("CVE-2017-11305" );
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-01-23 07:43:13 +0100 (Tue, 23 Jan 2018) $");
  script_tag(name:"creation_date", value:"2017-12-13 12:28:59 +0530 (Wed, 13 Dec 2017)");
  script_name("Adobe Flash Player Security Updates(apsb17-42)-Linux");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to a security bypass vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The Flaw exists due to a logic error may 
  cause the global settings preference file to be reset.");

  script_tag(name: "impact" , value:"Successful exploitation of this
  vulnerability will allow remote attackers to conduct unintended reset of 
  global settings preference file.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Adobe Flash Player version before 
  28.0.0.126 on Linux.");

  script_tag(name: "solution", value:"Upgrade to Adobe Flash Player version
  28.0.0.126, or later.
  For updates refer to http://get.adobe.com/flashplayer");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name: "URL" , value :"https://helpx.adobe.com/security/products/flash-player/apsb17-42.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_lin.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Linux/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
playerVer = "";

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

## Grep for vulnerable version
if(version_is_less(version:vers, test_version:"28.0.0.126"))
{
  report =  report_fixed_ver(installed_version:vers, fixed_version:"28.0.0.126", install_path:path);
  security_message(data:report);
  exit(0);
}
exit(0);
