##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_apsb16-08_lin.nasl 11969 2018-10-18 14:53:42Z asteins $
#
# Adobe Flash Player Security Updates-APSB16-08 (Linux)
#
# Authors:
# kashinath T <tkashinath@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.807611");
  script_version("$Revision: 11969 $");
  script_cve_id("CVE-2016-0960", "CVE-2016-0961", "CVE-2016-0962", "CVE-2016-0963",
		"CVE-2016-0986", "CVE-2016-0987", "CVE-2016-0988", "CVE-2016-0989",
		"CVE-2016-0990", "CVE-2016-0991", "CVE-2016-0992", "CVE-2016-0993",
		"CVE-2016-0994", "CVE-2016-0995", "CVE-2016-0996", "CVE-2016-0997",
		"CVE-2016-0998", "CVE-2016-0999", "CVE-2016-1000", "CVE-2016-1001",
		"CVE-2016-1002", "CVE-2016-1005", "CVE-2016-1010");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-18 16:53:42 +0200 (Thu, 18 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-03-11 13:45:48 +0530 (Fri, 11 Mar 2016)");
  script_name("Adobe Flash Player Security Updates-APSB16-08 (Linux)");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaws exist due to,

  - An integer overflow vulnerabilities.

  - A use-after-free vulnerabilities.

  - A heap overflow vulnerability.

  - The memory corruption vulnerabilities.");

  script_tag(name:"impact", value:"Successful exploitation of this
  vulnerability will allow remote attackers to execute arbitrary code.");

  script_tag(name:"affected", value:"Adobe Flash Player version before
  11.2.202.577 on Linux.");

  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player version
  11.2.202.577 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsb16-08.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_lin.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Linux/Ver");
  script_xref(name:"URL", value:"http://get.adobe.com/flashplayer");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!playerVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:playerVer, test_version:"11.2.202.577"))
{
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:"11.2.202.577");
  security_message(data:report);
  exit(0);
}

