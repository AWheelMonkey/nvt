###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_css_imp_dos_vuln_win.nasl 11552 2018-09-22 13:45:08Z cfischer $
#
# Google Chrome 'WebKit' CSS Implementation DoS Vulnerability (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.801773");
  script_version("$Revision: 11552 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 15:45:08 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-04-22 16:38:12 +0200 (Fri, 22 Apr 2011)");
  script_cve_id("CVE-2011-1691");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("Google Chrome 'WebKit' CSS Implementation DoS Vulnerability (Windows)");
  script_xref(name:"URL", value:"http://code.google.com/p/chromium/issues/detail?id=77665");
  script_xref(name:"URL", value:"http://googlechromereleases.blogspot.com/2011/04/beta-channel-update_12.html");

  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_dependencies("gb_google_chrome_detect_portable_win.nasl");
  script_mandatory_keys("GoogleChrome/Win/Ver");
  script_tag(name:"impact", value:"Successful exploitation could allow the attackers to cause denial-of-service
  via crafted JavaScript code.");
  script_tag(name:"affected", value:"Google Chrome version prior to 11.0.696.43");
  script_tag(name:"insight", value:"The flaw is due to error in 'counterToCSSValue()' function in
  'CSSComputedStyleDeclaration.cpp' in the Cascading Style Sheets (CSS)
  implementation in WebCore in WebKit, it does not properly handle access to
  the 'counterIncrement', 'counterReset' attributes of CSSStyleDeclaration data
  provided by a getComputedStyle method call.");
  script_tag(name:"solution", value:"Upgrade to the Google Chrome 11.0.696.43 or later,
  For updates refer to http://www.google.com/chrome");
  script_tag(name:"summary", value:"The host is installed Google Chrome and is prone to denial of
  service vulnerability.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

chromeVer = get_kb_item("GoogleChrome/Win/Ver");
if(!chromeVer){
  exit(0);
}

if(version_is_less(version:chromeVer, test_version:"11.0.696.43")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}
