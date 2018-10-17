##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_apsb16-18_macosx.nasl 11922 2018-10-16 10:24:25Z asteins $
#
# Adobe Flash Player Security Updates( apsb16-18 )-MAC OS X
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
  script_oid("1.3.6.1.4.1.25623.1.0.808170");
  script_version("$Revision: 11922 $");
  script_cve_id("CVE-2016-4122", "CVE-2016-4123", "CVE-2016-4124", "CVE-2016-4125",
		"CVE-2016-4127", "CVE-2016-4128", "CVE-2016-4129", "CVE-2016-4130",
		"CVE-2016-4131", "CVE-2016-4132", "CVE-2016-4133", "CVE-2016-4134",
		"CVE-2016-4135", "CVE-2016-4136", "CVE-2016-4137", "CVE-2016-4138",
		"CVE-2016-4139", "CVE-2016-4140", "CVE-2016-4141", "CVE-2016-4142",
		"CVE-2016-4143", "CVE-2016-4144", "CVE-2016-4145", "CVE-2016-4146",
		"CVE-2016-4147", "CVE-2016-4148", "CVE-2016-4149", "CVE-2016-4150",
		"CVE-2016-4151", "CVE-2016-4152", "CVE-2016-4153", "CVE-2016-4154",
		"CVE-2016-4155", "CVE-2016-4156", "CVE-2016-4166", "CVE-2016-4171");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-16 12:24:25 +0200 (Tue, 16 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-06-17 10:50:53 +0530 (Fri, 17 Jun 2016)");
  script_name("Adobe Flash Player Security Updates( apsb16-18 )-MAC OS X");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaws exists due to,

  - A type confusion vulnerabilities.

  - The use-after-free vulnerabilities.

  - The heap buffer overflow vulnerabilities.

  - The memory corruption vulnerabilities.

  - A vulnerability in the directory search path used to find resources.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to bypass the same-origin-policy and lead to information disclosure,
  and code execution.");

  script_tag(name:"affected", value:"Adobe Flash Player version before
  18.0.0.360 and 21.x before 22.0.0.192 on MAC OS X.");

  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player version
  18.0.0.360, or 22.0.0.192, or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsb16-18.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_macosx.nasl");
  script_mandatory_keys("Adobe/Flash/Player/MacOSX/Version");
  script_xref(name:"URL", value:"http://get.adobe.com/flashplayer");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!playerVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_in_range(version:playerVer, test_version:"21", test_version2:"22.0.0.191"))
{
  fix = "22.0.0.192";
  VULN = TRUE;
}

else if(version_is_less(version:playerVer, test_version:"18.0.0.360"))
{
  fix = "18.0.0.360";
  VULN = TRUE;
}

if(VULN)
{
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:fix);
  security_message(data:report);
  exit(0);
}

