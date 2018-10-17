###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_mult_vuln_lin_may11.nasl 11552 2018-09-22 13:45:08Z cfischer $
#
# Adobe Flash Player Multiple Vulnerabilities May-2011 (Linux)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801791");
  script_version("$Revision: 11552 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 15:45:08 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-05-23 15:31:07 +0200 (Mon, 23 May 2011)");
  script_cve_id("CVE-2011-0579", "CVE-2011-0618", "CVE-2011-0619", "CVE-2011-0620",
                "CVE-2011-0621", "CVE-2011-0622", "CVE-2011-0623", "CVE-2011-0624",
                "CVE-2011-0625", "CVE-2011-0626", "CVE-2011-0627");
  script_bugtraq_id(47847, 47815, 47806, 47807, 47808, 47809, 47811, 47812,
                    47813, 47814, 47810);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Adobe Flash Player Multiple Vulnerabilities May-2011 (Linux)");
  script_xref(name:"URL", value:"http://www.adobe.com/support/security/bulletins/apsb11-12.html");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_lin.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Linux/Ver");
  script_tag(name:"impact", value:"Successful exploitation will let attackers to execute arbitrary code or cause
  a denial of service condition.");
  script_tag(name:"affected", value:"Adobe Flash Player version 10.2.159.1 and prior on Linux");
  script_tag(name:"insight", value:"The flaws are caused by memory corruptions, integer overflow errors and bounds
  checking errors when processing malformed Flash content, which could be
  exploited by attackers to execute arbitrary code by tricking a user into
  visiting a specially crafted web page.");
  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player version 10.3.181.14 or later.
  For details refer, http://www.adobe.com/downloads/");
  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player and is prone to
  multiple vulnerabilities.");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}


include("version_func.inc");

flashVer = get_kb_item("AdobeFlashPlayer/Linux/Ver");
if(!flashVer){
  exit(0);
}

flashVer = ereg_replace(pattern:",", string:flashVer, replace: ".");

if(version_is_less_equal(version:flashVer, test_version:"10.2.159.1")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}
