##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_within_chrome_apsb17-02_win.nasl 5662 2017-03-21 11:54:36Z antu123 $
#
# Adobe Flash Player Within Google Chrome Security Update (apsb17-02) - Windows
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:adobe:flash_player_chrome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810619");
  script_version("$Revision: 5662 $");
  script_cve_id("CVE-2017-2925", "CVE-2017-2926", "CVE-2017-2927", "CVE-2017-2928",
                "CVE-2017-2930", "CVE-2017-2931", "CVE-2017-2932", "CVE-2017-2933",
                "CVE-2017-2934", "CVE-2017-2935", "CVE-2017-2936", "CVE-2017-2937",
                "CVE-2017-2938");
  script_bugtraq_id(95341, 95342, 95347, 95350);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-21 12:54:36 +0100 (Tue, 21 Mar 2017) $");
  script_tag(name:"creation_date", value:"2017-03-14 17:33:50 +0530 (Tue, 14 Mar 2017)");
  script_name("Adobe Flash Player Within Google Chrome Security Update (apsb17-02) - Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,
  - A security bypass vulnerability.
  - Multiple use-after-free vulnerabilities.
  - The heap buffer overflow vulnerabilities.
  - The memory corruption vulnerabilities.");

  script_tag(name: "impact" , value:"Successful exploitation of these vulnerabilities
  will allow remote attackers to take control of the affected system, lead to code
  execution and information disclosure.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Adobe Flash Player for chrome versions
  before 24.0.0.194 on Windows.");

  script_tag(name: "solution", value:"Upgrade to Adobe Flash Player for chrome
  version 24.0.0.194 or later. For updates refer to
  http://get.adobe.com/flashplayer");
  
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name: "URL" , value :"https://helpx.adobe.com/security/products/flash-player/apsb17-02.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General"); 
  script_dependencies("gb_flash_player_within_google_chrome_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Chrome/Win/Ver");
  exit(0);
} 

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
playerVer = "";

## Get version
if(!playerVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:playerVer, test_version:"24.0.0.194"))
{
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:"24.0.0.194");
  security_message(data:report);
  exit(0);
}