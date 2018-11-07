##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_stable-channel-update-for-desktop-2018-04_macosx.nasl 12116 2018-10-26 10:01:35Z mmartin $
#
# Google Chrome Security Updates(stable-channel-update-for-desktop-2018-04)-MAC OS X
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
  script_oid("1.3.6.1.4.1.25623.1.0.813096");
  script_version("$Revision: 12116 $");
  script_cve_id("CVE-2018-6085", "CVE-2018-6086", "CVE-2018-6087", "CVE-2018-6088",
                "CVE-2018-6089", "CVE-2018-6090", "CVE-2018-6091", "CVE-2018-6092",
                "CVE-2018-6093", "CVE-2018-6094", "CVE-2018-6095", "CVE-2018-6096",
                "CVE-2018-6097", "CVE-2018-6098", "CVE-2018-6099", "CVE-2018-6100",
                "CVE-2018-6101", "CVE-2018-6102", "CVE-2018-6103", "CVE-2018-6104",
                "CVE-2018-6105", "CVE-2018-6106", "CVE-2018-6107", "CVE-2018-6108",
                "CVE-2018-6109", "CVE-2018-6110", "CVE-2018-6111", "CVE-2018-6112",
                "CVE-2018-6113", "CVE-2018-6114", "CVE-2018-6115", "CVE-2018-6116",
                "CVE-2018-6117", "CVE-2018-6084");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:01:35 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-04-18 14:30:38 +0530 (Wed, 18 Apr 2018)");
  script_name("Google Chrome Security Updates(stable-channel-update-for-desktop-2018-04)-MAC OS X");

  script_tag(name:"summary", value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - Multiple use after free errors in 'Disk Cache', 'WebAssembly' and 'PDFium'.

  - A same origin policy bypass error in Service Worker.

  - A heap buffer overflow error in Skia.

  - An incorrect handling of plug-ins by Service Worker.

  - An integer overflow error in WebAssembly.

  - Multiple UI spoofing errors.

  - Multiple URL spoofing errors in Omnibox.

  - An insufficient protection of remote debugging prototol in DevTools.

  - An incorrect handling of promises in V8, files by FileAPI, plaintext files
    via 'file://'.

  - An incorrect low memory handling in WebAssembly.

  - A content security policy bypass error.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to conduct spoofing attacks, bypass security restrictions, cause
  denial of service condition and also some unspecified impacts.");

  script_tag(name:"affected", value:"Google Chrome version
  prior to 66.0.3359.117 on MAC OS X");

  script_tag(name:"solution", value:"Upgrade to Google Chrome version
  66.0.3359.117 or later.For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://chromereleases.googleblog.com/2018/04/stable-channel-update-for-desktop.html");
  script_xref(name:"URL", value:"http://www.google.com/chrome");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_google_chrome_detect_macosx.nasl");
  script_mandatory_keys("GoogleChrome/MacOSX/Version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
vers = infos['version'];
path = infos['location'];

if(version_is_less(version:vers, test_version:"66.0.3359.117"))
{
  report = report_fixed_ver(installed_version:vers, fixed_version:"66.0.3359.117", install_path:path);
  security_message(data:report);
  exit(0);
}
exit(0);
