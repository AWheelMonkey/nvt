##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_within_chrome_apsb16-36_macosx.nasl 11835 2018-10-11 08:38:49Z mmartin $
#
# Adobe Flash Player Within Google Chrome Security Update (apsb16-36) - Mac OS X
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
  script_oid("1.3.6.1.4.1.25623.1.0.810636");
  script_version("$Revision: 11835 $");
  script_cve_id("CVE-2016-7855");
  script_bugtraq_id(93861);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 10:38:49 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-03-17 17:07:31 +0530 (Fri, 17 Mar 2017)");
  script_name("Adobe Flash Player Within Google Chrome Security Update (apsb16-36) - Mac OS X");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to a remote code execution vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to a use-after-free
  vulnerability");

  script_tag(name:"impact", value:"Successful exploitation of this vulnerability
  will allow remote attackers to take control of the affected system.");

  script_tag(name:"affected", value:"Adobe Flash Player for chrome versions
  before 23.0.0.205 on Mac OS X.");

  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player for chrome
  version 23.0.0.205 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsb16-36.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_flash_player_within_google_chrome_detect_macosx.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Chrome/MacOSX/Ver");
  script_xref(name:"URL", value:"http://get.adobe.com/flashplayer");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!playerVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:playerVer, test_version:"23.0.0.205"))
{
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:"23.0.0.205");
  security_message(data:report);
  exit(0);
}