##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_apsb17-33_win.nasl 11983 2018-10-19 10:04:45Z mmartin $
#
# Adobe Flash Player Security Updates( apsb17-33 )-Windows
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.812140");
  script_version("$Revision: 11983 $");
  script_cve_id("CVE-2017-3112", "CVE-2017-3114", "CVE-2017-11213", "CVE-2017-11215",
		"CVE-2017-11225");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 12:04:45 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-11-15 13:50:29 +0530 (Wed, 15 Nov 2017)");
  script_name("Adobe Flash Player Security Updates( apsb17-33 )-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaws exists due to,

  - An Out-of-bounds Read vulnerability.

  - An Use after free vulnerability.");

  script_tag(name:"impact", value:"Successful exploitation of this
  vulnerability will allow remote attackers to execute code.");

  script_tag(name:"affected", value:"Adobe Flash Player version before
  27.0.0.187 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player version
  27.0.0.187, or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsb17-33.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Win/Installed");
  script_xref(name:"URL", value:"http://get.adobe.com/flashplayer");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

playerVer = "";

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
playerVer = infos['version'];
playerPath = infos['location'];

if(version_is_less(version:playerVer, test_version:"27.0.0.187"))
{
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:"27.0.0.187", install_path:playerPath);
  security_message(data:report);
  exit(0);
}
exit(0);
