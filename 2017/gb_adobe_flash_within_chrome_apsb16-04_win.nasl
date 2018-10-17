############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_within_chrome_apsb16-04_win.nasl 11900 2018-10-15 07:44:31Z mmartin $
#
# Adobe Flash Player Within Google Chrome Security Update (apsb16-04) - Windows
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
  script_oid("1.3.6.1.4.1.25623.1.0.810659");
  script_version("$Revision: 11900 $");
  script_cve_id("CVE-2016-0964", "CVE-2016-0965", "CVE-2016-0966", "CVE-2016-0967",
                "CVE-2016-0968", "CVE-2016-0969", "CVE-2016-0970", "CVE-2016-0971",
                "CVE-2016-0972", "CVE-2016-0973", "CVE-2016-0974", "CVE-2016-0975",
                "CVE-2016-0976", "CVE-2016-0977", "CVE-2016-0978", "CVE-2016-0979",
                "CVE-2016-0980", "CVE-2016-0981", "CVE-2016-0982", "CVE-2016-0983",
                "CVE-2016-0984", "CVE-2016-0985");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-15 09:44:31 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-03-18 15:25:30 +0530 (Sat, 18 Mar 2017)");
  script_name("Adobe Flash Player Within Google Chrome Security Update (apsb16-04) - Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to,

  - Multiple memory corruption vulnerabilities.

  - Multiple use-after-free vulnerabilities.

  - A heap buffer overflow vulnerability.

  - A type confusion vulnerability.");

  script_tag(name:"impact", value:"Successful exploitation will potentially
  allow an attacker to execute arbitrary code.");

  script_tag(name:"affected", value:"Adobe Flash Player for chrome versions
  before 20.0.0.306 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player for chrome
  version 20.0.0.306 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsb16-04.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_flash_player_within_google_chrome_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Chrome/Win/Ver");
  script_xref(name:"URL", value:"http://get.adobe.com/flashplayer");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!playerVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:playerVer, test_version:"20.0.0.306"))
{
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:"20.0.0.306");
  security_message(data:report);
  exit(0);
}