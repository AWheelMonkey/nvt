###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln_sep11_win.nasl 11552 2018-09-22 13:45:08Z cfischer $
#
# Google Chrome multiple vulnerabilities - September11 (Windows)
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.802326");
  script_version("$Revision: 11552 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 15:45:08 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-09-07 08:36:57 +0200 (Wed, 07 Sep 2011)");
  script_cve_id("CVE-2011-2822", "CVE-2011-2823", "CVE-2011-2824", "CVE-2011-2825",
                "CVE-2011-2821", "CVE-2011-2826", "CVE-2011-2806", "CVE-2011-2827",
                "CVE-2011-2828", "CVE-2011-2829");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Google Chrome multiple vulnerabilities - September11 (Windows)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/45698/");
  script_xref(name:"URL", value:"http://googlechromereleases.blogspot.com/2011/08/stable-channel-update_22.html");

  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_portable_win.nasl");
  script_mandatory_keys("GoogleChrome/Win/Ver");
  script_tag(name:"impact", value:"Successful exploitation could allow attackers to execute arbitrary code in
  the context of the browser, inject scripts, bypass certain security
  restrictions, or cause a denial-of-service condition.");
  script_tag(name:"affected", value:"Google Chrome version prior to 13.0.782.215 on Windows.");
  script_tag(name:"insight", value:"Multiple flaws are due to,

  - URL parsing error when located on the command line.

  - Multiple use-after-free error exists within the handling of features like
    line boxes, counter nodes, custom fonts and text searching.

  - A double free error exists in libxml when handling XPath expression.

  - Memory corruption error when handling certain vertex data.

  - An error related to empty origins allows attackers to violate the
    cross-origin policy.

  - An integer overflow error in uniform arrays.");
  script_tag(name:"solution", value:"Upgrade to the Google Chrome 13.0.782.215 or later,
  For updates refer to http://www.google.com/chrome");
  script_tag(name:"summary", value:"The host is running Google Chrome and is prone to multiple
  vulnerabilities.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

chromeVer = get_kb_item("GoogleChrome/Win/Ver");
if(!chromeVer){
  exit(0);
}

if(version_is_less(version:chromeVer, test_version:"13.0.782.215")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}
