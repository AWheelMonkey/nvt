##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_stable-channel-update-for-desktop-2017-11_win.nasl 12308 2018-11-12 03:41:06Z ckuersteiner $
#
# Google Chrome Security Updates(stable-channel-update-for-desktop-2017-11)-Windows
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:google:chrome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811892");
  script_version("$Revision: 12308 $");
  script_cve_id("CVE-2017-15398", "CVE-2017-15399");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-12 04:41:06 +0100 (Mon, 12 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-11-07 12:15:57 +0530 (Tue, 07 Nov 2017)");
  script_name("Google Chrome Security Updates(stable-channel-update-for-desktop-2017-11)-Windows");

  script_tag(name:"summary", value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaws exists due to,

  - A stack buffer overflow error in QUIC.

  - An use after free error in V8.");

  script_tag(name:"impact", value:"Successful exploitation of these
  vulnerabilities will allow remote attackers to corrupt valid data,
  execute arbitrary code or cause denial of service condition.");

  script_tag(name:"affected", value:"Google Chrome version
  prior to 62.0.3202.89 on Windows");

  script_tag(name:"solution", value:"Upgrade to Google Chrome version
  62.0.3202.89 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://chromereleases.googleblog.com/2017/11/stable-channel-update-for-desktop.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_google_chrome_detect_portable_win.nasl");
  script_mandatory_keys("GoogleChrome/Win/Ver");
  script_xref(name:"URL", value:"http://www.google.com/chrome");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

chr_ver = "";

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

if(version_is_less(version:vers, test_version:"62.0.3202.89"))
{
  report = report_fixed_ver( installed_version:vers, fixed_version:"62.0.3202.89", install_path:path );
  security_message(data:report);
  exit(0);
}