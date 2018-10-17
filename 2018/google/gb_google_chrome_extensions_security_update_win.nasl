##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_extensions_security_update_win.nasl 11741 2018-10-04 08:03:44Z santu $
#
# Google Chrome Extensions Securit Updates (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:google:chrome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814067");
  script_version("$Revision: 11741 $");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-04 10:03:44 +0200 (Thu, 04 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-03 17:36:31 +0530 (Wed, 03 Oct 2018)");
  script_name("Google Chrome Extensions Securit Updates (Windows)");

  script_tag(name:"summary", value:"The host is installed with Google Chrome
  extensions and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - If an extension asks for permission to read, write, and change data on all
    websites, there is no option available using which users can explicitly
    blacklist or white list a specific set of websites.

  - Code Obfuscation for Chrome Extensions.

  - Missing 2-Step Verification on Chrome Web Store accounts.

  - Absence of more in-depth review of extensions that ask for 'powerful permissions'.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to automatically read and change data on websites using extensions, inject
  malicious code, conduct phishing attack and bypass security restrictions.");

  script_tag(name:"affected", value:"Google Chrome version prior to 70.0.3538.35
  on Windows.");

  script_tag(name:"solution", value:"Upgrade to Google Chrome version 70.0.3538.35
  or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://thehackernews.com/2018/10/google-chrome-extensions-security.html");
  script_xref(name:"URL", value:"http://www.google.com/chrome");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_google_chrome_detect_portable_win.nasl");
  script_mandatory_keys("GoogleChrome/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
chr_ver  = infos['version'];
chrPath = infos['location'];

if(version_is_less(version:chr_ver, test_version:"70.0.3538.35"))
{
  report = report_fixed_ver(installed_version:chr_ver, fixed_version:"70.0.3538.35", install_path:chrPath);
  security_message(data:report);
  exit(0);
}

exit(99);
