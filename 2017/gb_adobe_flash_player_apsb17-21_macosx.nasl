##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_apsb17-21_macosx.nasl 11936 2018-10-17 09:05:37Z mmartin $
#
# Adobe Flash Player Security Updates( apsb17-21 )-MAC OS X
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
  script_oid("1.3.6.1.4.1.25623.1.0.811468");
  script_version("$Revision: 11936 $");
  script_cve_id("CVE-2017-3080", "CVE-2017-3099", "CVE-2017-3100");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-17 11:05:37 +0200 (Wed, 17 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-07-12 15:27:38 +0530 (Wed, 12 Jul 2017)");
  script_name("Adobe Flash Player Security Updates( apsb17-21 )-MAC OS X");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - A Security Bypass vulenrability.

  - Multiple memory corruption issues.");

  script_tag(name:"impact", value:"Successful exploitation of this
  vulnerability will allow remote attackers execute remote code and can get
  sensitive information which can lead to denial of service.");

  script_tag(name:"affected", value:"Adobe Flash Player version before
  26.0.0.137 on MAC OS X.");

  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player version
  26.0.0.137, or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsb17-21.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(version_is_less(version:playerVer, test_version:"26.0.0.137"))
{
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:"26.0.0.137");
  security_message(data:report);
  exit(0);
}
exit(0);
