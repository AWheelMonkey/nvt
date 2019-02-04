###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_unspecified_vuln_oct10_lin.nasl 12670 2018-12-05 14:14:20Z cfischer $
#
# Google Chrome multiple unspecified vulnerabilities - October 10(Linux)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801459");
  script_version("$Revision: 12670 $");
  script_tag(name:"last_modification", value:"$Date: 2018-12-05 15:14:20 +0100 (Wed, 05 Dec 2018) $");
  script_tag(name:"creation_date", value:"2010-10-07 09:42:58 +0200 (Thu, 07 Oct 2010)");
  script_cve_id("CVE-2010-1822", "CVE-2010-3729", "CVE-2010-3730");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Google Chrome multiple unspecified vulnerabilities - October 10(Linux)");
  script_xref(name:"URL", value:"http://googlechromereleases.blogspot.com/2010/09/stable-beta-channel-updates_17.html");

  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_lin.nasl");
  script_mandatory_keys("Google-Chrome/Linux/Ver");
  script_tag(name:"impact", value:"Successful exploitation could allow the attackers to execute arbitrary code
  via unspecified vectors.");
  script_tag(name:"affected", value:"Google Chrome version prior to 6.0.472.62");
  script_tag(name:"insight", value:"Multiple flaws are due to:

  - improper use of information about the origin of a document to manage
    properties.

  - Buffer mismanagement in the SPDY protocol.

  - Bad cast with malformed SVG.");
  script_tag(name:"solution", value:"Upgrade to the Google Chrome 6.0.472.62 or later.");
  script_tag(name:"summary", value:"The host is running Google Chrome and is prone to multiple unspecified
  vulnerabilities.");
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.google.com/chrome");
  exit(0);
}


include("version_func.inc");

chromeVer = get_kb_item("Google-Chrome/Linux/Ver");
if(!chromeVer){
  exit(0);
}

if(version_is_less(version:chromeVer, test_version:"6.0.472.62")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}
