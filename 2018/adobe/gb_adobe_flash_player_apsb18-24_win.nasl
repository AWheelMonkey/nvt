##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_apsb18-24_win.nasl 11513 2018-09-21 03:48:51Z ckuersteiner $
#
# Adobe Flash Player Security Updates(apsb18-24)-Windows
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:adobe:flash_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813638");
  script_version("$Revision: 11513 $");
  script_cve_id("CVE-2018-5008", "CVE-2018-5007");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 05:48:51 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-07-11 08:12:01 +0530 (Wed, 11 Jul 2018)");
  script_name("Adobe Flash Player Security Updates(apsb18-24)-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - An out-of-bounds read error.

  - A type Confusion error.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to disclose sensitive information and also to conduct arbitrary code
  execution.");

  script_tag(name:"affected", value:"Adobe Flash Player version before
  30.0.0.134 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player version
  30.0.0.134, or later. For updates refer Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsb18-24.html");
  script_xref(name:"URL", value:"http://get.adobe.com/flashplayer");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

if(version_is_less(version:vers, test_version:"30.0.0.134"))
{
  report =  report_fixed_ver(installed_version:vers, fixed_version:"30.0.0.134", install_path:path);
  security_message(data:report);
  exit(0);
}

exit(0);
