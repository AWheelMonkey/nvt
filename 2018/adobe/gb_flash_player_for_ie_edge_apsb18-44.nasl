##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_flash_player_for_ie_edge_apsb18-44.nasl 12938 2019-01-04 07:18:11Z asteins $
#
# Microsoft IE And Microsoft Edge Flash Player Security Update(apsb18-44)
#
# Authors:
# Vidita V Koushik <vidita@secpod.com>
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

CPE = "cpe:/a:adobe:flash_player_internet_explorer";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814352");
  script_version("$Revision: 12938 $");
  script_cve_id("CVE-2018-15981");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2019-01-04 08:18:11 +0100 (Fri, 04 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-11-21 12:11:42 +0530 (Wed, 21 Nov 2018)");
  script_name("Adobe Flash Player Security Update(apsb18-44)-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  within Microsoft Edge or Internet Explorer and is prone to remote code execution
  vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to a type confusion error
  in the flash player.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attackers
  to execute arbitrary code in the context of the current user.");

  script_tag(name:"affected", value:"Adobe Flash Player prior to 31.0.0.153
  within Microsoft Edge or Internet Explorer on,

  Windows 10 Version 1607 for x32/x64 Edition,

  Windows 10 Version 1703 for x32/x64 Edition,

  Windows 10 Version 1709 for x32/x64 Edition,

  Windows 10 Version 1803 for x32/x64 Edition,

  Windows 10 Version 1809 for x32/x64 Edition,

  Windows 10 x32/x64 Edition,

  Windows 8.1 for x32/x64 Edition");

  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player 31.0.0.153 or later.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsb18-44.html");
  script_xref(name:"URL", value:"http://get.adobe.com/flashplayer");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_flash_player_within_ie_edge_detect.nasl");
  script_mandatory_keys("AdobeFlash/IE_or_EDGE/Installed");
  exit(0);
}

include("host_details.inc");
include("secpod_reg.inc");
include("version_func.inc");

if(hotfix_check_sp(win8_1:1, win8_1x64:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

if(!infos = get_app_version_and_location(cpe:CPE))
{
  CPE = "cpe:/a:adobe:flash_player_edge";
  infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
}

flashVer = infos['version'];
if(!flashVer){
  exit(0);
}

flashPath = infos['location'];

if(flashPath){
  flashPath = flashPath + "\Flashplayerapp.exe";
} else {
  flashPath = "Could not find the install location";
}

if(version_is_less(version:flashVer, test_version:"31.0.0.153"))
{
  report = report_fixed_ver(file_checked:flashPath,
                            file_version:flashVer, vulnerable_range:"Less than 31.0.0.153");
  security_message(data:report);
  exit(0);
}
exit(99);
