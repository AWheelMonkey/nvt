##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_within_chrome_apsb17-04_lin.nasl 11919 2018-10-16 09:49:19Z mmartin $
#
# Adobe Flash Player Within Google Chrome Security Update (apsb17-04) - Linux
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
  script_oid("1.3.6.1.4.1.25623.1.0.810616");
  script_version("$Revision: 11919 $");
  script_cve_id("CVE-2017-2982", "CVE-2017-2984", "CVE-2017-2985", "CVE-2017-2986",
                "CVE-2017-2987", "CVE-2017-2988", "CVE-2017-2990", "CVE-2017-2991",
                "CVE-2017-2992", "CVE-2017-2993", "CVE-2017-2994", "CVE-2017-2995",
                "CVE-2017-2996");
  script_bugtraq_id(96199, 96193, 96194, 96190, 96191, 96190);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-16 11:49:19 +0200 (Tue, 16 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-03-14 15:25:10 +0530 (Tue, 14 Mar 2017)");
  script_name("Adobe Flash Player Within Google Chrome Security Update (apsb17-04) - Linux");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - A type confusion vulnerability.

  - Multiple use-after-free vulnerabilities.

  - An integer overflow vulnerability.

  - Multiple heap buffer overflow vulnerabilities.

  - Multiple memory corruption vulnerabilities.");

  script_tag(name:"impact", value:"Successful exploitation of this
  vulnerabilities will allow remote attackers to execute arbitrary code on
  the target user's system and that could potentially allow an attacker to
  take control of the affected system.");

  script_tag(name:"affected", value:"Adobe Flash Player for chrome versions
  before 24.0.0.221 on Linux.");

  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player for chrome
  version 24.0.0.221 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsb17-04.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_flash_player_within_google_chrome_detect_lin.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Chrome/Lin/Ver");
  script_xref(name:"URL", value:"http://get.adobe.com/flashplayer");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!playerVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:playerVer, test_version:"24.0.0.221"))
{
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:"24.0.0.221");
  security_message(data:report);
  exit(0);
}