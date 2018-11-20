##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_within_chrome_apsa18-01_win.nasl 12410 2018-11-19 10:06:05Z cfischer $
#
# Adobe Flash Player Within Google Chrome Multiple RCE Vulnerabilities(apsa18-01)-Windows
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
  script_oid("1.3.6.1.4.1.25623.1.0.812686");
  script_version("$Revision: 12410 $");
  script_cve_id("CVE-2018-4878", "CVE-2018-4877");
  script_bugtraq_id(102893, 102930);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-19 11:06:05 +0100 (Mon, 19 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-02-02 11:08:19 +0530 (Fri, 02 Feb 2018)");
  script_name("Adobe Flash Player Within Google Chrome Multiple RCE Vulnerabilities(apsa18-01)-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple remote code execution vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to multiple
  use-after-free errors in the flash player.");

  script_tag(name:"impact", value:"Successful exploitation of these
  vulnerabilities will allow an attacker to execute arbitrary code on
  affected system and take control of the affected system.");

  script_tag(name:"affected", value:"Adobe Flash Player version 28.0.0.137 and
  earlier within Google Chrome on Windows.");

  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player version
  28.0.0.161, or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsa18-01.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_flash_player_within_google_chrome_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Chrome/Win/Ver");
  script_xref(name:"URL", value:"http://get.adobe.com/flashplayer");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

if(version_is_less_equal(version:vers, test_version:"28.0.0.137"))
{
  report =  report_fixed_ver(installed_version:vers, fixed_version:"28.0.0.161", install_path:path);
  security_message(data:report);
  exit(0);
}
exit(0);
