###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_security_bypass_vuln_nov15_win.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# Google Chrome PDF Viewer Security Bypass Vulnerability Nov15 (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.806568");
  script_version("$Revision: 11872 $");
  script_cve_id("CVE-2015-1302");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-11-13 17:56:03 +0530 (Fri, 13 Nov 2015)");
  script_name("Google Chrome PDF Viewer Security Bypass Vulnerability Nov15 (Windows)");

  script_tag(name:"summary", value:"The host is installed with Google Chrome
  and is prone to security bypass vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to PDF viewer which does
  not properly restrict scripting messages and API exposure.");

  script_tag(name:"impact", value:"Successful exploitation would allow remote
  attackers to bypass the Same Origin Policy.");

  script_tag(name:"affected", value:"Google Chrome versions prior to
  46.0.2490.86 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Google Chrome version
  46.0.2490.86 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://googlechromereleases.blogspot.in/2015/11/stable-channel-update.html");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(version_is_less(version:chromeVer, test_version:"46.0.2490.86"))
{
  report = 'Installed version: ' + chromeVer + '\n' +
           'Fixed version:     46.0.2490.86'  + '\n';
  security_message(data:report);
  exit(0);
}
