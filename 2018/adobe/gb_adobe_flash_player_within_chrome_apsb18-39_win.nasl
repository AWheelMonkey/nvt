##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_within_chrome_apsb18-39_win.nasl 12352 2018-11-14 15:03:21Z santu $
#
# Adobe Flash Player Within Google Chrome Security Update(apsb18-39)-Windows
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.814289");
  script_version("$Revision: 12352 $");
  script_cve_id("CVE-2018-15978");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-14 16:03:21 +0100 (Wed, 14 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-14 17:24:45 +0530 (Wed, 14 Nov 2018)");
  script_name("Adobe Flash Player Within Google Chrome Security Update(apsb18-39)-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to information disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an out-of-bounds
  read error.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to gain access to potentially sensitive information.");

  script_tag(name:"affected", value:"Adobe Flash Player prior to 31.0.0.148
  within Google Chrome on Windows.");

  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player for Google
  Chrome 31.0.0.148 or later. For updates refer to References.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsb18-39.html");
  script_xref(name:"URL", value:"http://get.adobe.com/flashplayer");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_flash_player_within_google_chrome_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Chrome/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
playerVer = infos['version'];
path = infos['location'];

if(version_is_less(version:playerVer, test_version:"31.0.0.148"))
{
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:"31.0.0.148", install_path:path);
  security_message(data:report);
  exit(0);
}
exit(99);
