###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln01_mar14_win.nasl 11867 2018-10-12 10:48:11Z cfischer $
#
# Google Chrome Multiple Vulnerabilities-01 Mar2014 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:google:chrome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804328");
  script_version("$Revision: 11867 $");
  script_cve_id("CVE-2013-6663", "CVE-2013-6664", "CVE-2013-6665", "CVE-2013-6666",
                "CVE-2013-6667", "CVE-2013-6668");
  script_bugtraq_id(65930);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-03-13 10:53:05 +0530 (Thu, 13 Mar 2014)");
  script_name("Google Chrome Multiple Vulnerabilities-01 Mar2014 (Windows)");


  script_tag(name:"summary", value:"The host is installed with Google Chrome and is prone to multiple
vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Multiple flaws are due to,

  - An use-after-free error within 'SVGImage::setContainerSize' function and
  'FormAssociatedElement::formRemovedFromTree' function in Blink.

  - Heap buffer overflow within 'ResourceProvider::InitializeSoftware' function.

  - Improper restriction of flash header request within
  'PepperFlashRendererHost::OnNavigate' function.

  - Some unspecified errors related to V8 and other few unspecified errors.");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to conduct denial of
service, bypass certain security restrictions, execute arbitrary code and
other unspecified impacts.");
  script_tag(name:"affected", value:"Google Chrome version prior to 33.0.1750.146 on Windows.");
  script_tag(name:"solution", value:"Upgrade to version 33.0.1750.146 or later.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/57194");
  script_xref(name:"URL", value:"http://securitytracker.com/id?1029864");
  script_xref(name:"URL", value:"http://googlechromereleases.blogspot.in/2014/03/stable-channel-update.html");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_portable_win.nasl");
  script_mandatory_keys("GoogleChrome/Win/Ver");
  script_xref(name:"URL", value:"http://www.google.com/chrome");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!chromeVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:chromeVer, test_version:"33.0.1750.146"))
{
  security_message( port: 0, data: "The target host was found to be vulnerable" );
  exit(0);
}
