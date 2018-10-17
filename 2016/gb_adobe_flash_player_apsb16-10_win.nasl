##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_apsb16-10_win.nasl 11516 2018-09-21 11:15:17Z asteins $
#
# Adobe Flash Player Security Updates( apsb16-10 )-Windows
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

CPE = "cpe:/a:adobe:flash_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807653");
  script_version("$Revision: 11516 $");
  script_cve_id("CVE-2016-1006", "CVE-2016-1011", "CVE-2016-1012", "CVE-2016-1013",
		"CVE-2016-1014", "CVE-2016-1015", "CVE-2016-1016", "CVE-2016-1017",
		"CVE-2016-1018", "CVE-2016-1019", "CVE-2016-1020", "CVE-2016-1021",
		"CVE-2016-1022", "CVE-2016-1023", "CVE-2016-1024", "CVE-2016-1025",
		"CVE-2016-1026", "CVE-2016-1027", "CVE-2016-1028", "CVE-2016-1029",
		"CVE-2016-1030", "CVE-2016-1031", "CVE-2016-1032", "CVE-2016-1033");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 13:15:17 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-04-12 18:40:52 +0530 (Tue, 12 Apr 2016)");
  script_name("Adobe Flash Player Security Updates( apsb16-10 )-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaws exists due to,

  - Multiple type confusion vulnerabilities.

  - Multiple use-after-free vulnerabilities.

  - Multiple memory corruption vulnerabilities.

  - A stack overflow vulnerability.

  - A vulnerability in the directory search path used to find resources.");

  script_tag(name:"impact", value:"Successful exploitation of this
  vulnerability will allow remote attackers to bypass memory layout
  randomization mitigations, also leads to code execution.");

  script_tag(name:"affected", value:"Adobe Flash Player version before
  18.0.0.343 and 20.x before 21.0.0.213 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player version
  18.0.0.343, or 21.0.0.213, or later.
  For updates refer to http://get.adobe.com/flashplayer");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsb16-10.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Win/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!playerVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_in_range(version:playerVer, test_version:"20", test_version2:"21.0.0.212"))
{
  fix = "21.0.0.213";
  VULN = TRUE;
}

else if(version_is_less(version:playerVer, test_version:"18.0.0.343"))
{
  fix = "18.0.0.343";
  VULN = TRUE;
}

if(VULN)
{
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:fix);
  security_message(data:report);
  exit(0);
}

