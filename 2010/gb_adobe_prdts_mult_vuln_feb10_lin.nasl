###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_prdts_mult_vuln_feb10_lin.nasl 8250 2017-12-27 07:29:15Z teissa $
#
# Adobe Flash Player/Air Multiple Vulnerabilities - feb10 (Linux)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow remote attackers to crash the application,
  denying service to legitimate users.
  Impact Level: Application";
tag_affected = "Adobe AIR version prior to 1.5.3.9130
  Adobe Flash Player 10 version prior to 10.0.45.2 on Windows";
tag_insight = "Cross domain vulnerabilities present in Adobe Flash Player/Adobe Air allows
  remote attackers to bypass intended sandbox restrictions and make
  cross-domain requests via unspecified vectors.";
tag_solution = "Update to Adobe Air 1.5.3.9130 or Adobe Flash Player 10.0.45.2
  http://get.adobe.com/air
  http://www.adobe.com/support/flashplayer/downloads.html";
tag_summary = "This host is installed with Adobe Flash Player/Air and is prone to
  multiple vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800476");
  script_version("$Revision: 8250 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-27 08:29:15 +0100 (Wed, 27 Dec 2017) $");
  script_tag(name:"creation_date", value:"2010-02-19 11:58:13 +0100 (Fri, 19 Feb 2010)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2010-0186", "CVE-2010-0187");
  script_bugtraq_id(38198, 38200);
  script_name("Adobe Flash Player/Air Multiple Vulnerabilities -feb10 (Linux)");
  script_xref(name : "URL" , value : "https://bugzilla.redhat.com/show_bug.cgi?id=563819");
  script_xref(name : "URL" , value : "http://www.adobe.com/support/security/bulletins/apsb10-06.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_lin.nasl");
  script_mandatory_keys("Adobe/Air_or_Flash_or_Reader/Linux/Installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

# Check for Adobe Flash Player
playerVer = get_kb_item("AdobeFlashPlayer/Linux/Ver");
if(playerVer != NULL)
{
  # Grep for version 10.x < 10.0.45.2
  if(version_in_range(version:playerVer, test_version:"10.0", test_version2:"10.0.45.1"))
  {
    security_message(0);
    exit(0);
  }
}

# Check for Adobe Air
airVer = get_kb_item("Adobe/Air/Linux/Ver");
if(airVer != NULL)
{
  # Grep for version < 1.5.3.9130
  if(version_is_less(version:airVer, test_version:"1.5.3.9130")){
    security_message(0);
  }
}
