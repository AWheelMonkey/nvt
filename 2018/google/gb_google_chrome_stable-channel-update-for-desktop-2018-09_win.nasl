##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_stable-channel-update-for-desktop-2018-09_win.nasl 11246 2018-09-05 12:58:16Z santu $
#
# Google Chrome Security Updates(stable-channel-update-for-desktop-2018-09)-Windows
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
  script_oid("1.3.6.1.4.1.25623.1.0.813884");
  script_version("$Revision: 11246 $");
  script_cve_id("CVE-2018-16066", "CVE-2018-16067", "CVE-2018-16068", "CVE-2018-16065",
                "CVE-2018-16069", "CVE-2018-16070", "CVE-2018-16071", "CVE-2018-16085",
                "CVE-2018-16073", "CVE-2018-16074", "CVE-2018-16075", "CVE-2018-16076",
                "CVE-2018-16077", "CVE-2018-16078", "CVE-2018-16079", "CVE-2018-16080",
                "CVE-2018-16081", "CVE-2018-16082", "CVE-2018-16083", "CVE-2018-16084");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-05 14:58:16 +0200 (Wed, 05 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-05 11:42:16 +0530 (Wed, 05 Sep 2018)");
  script_name("Google Chrome Security Updates(stable-channel-update-for-desktop-2018-09)-Windows");

  script_tag(name:"summary", value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - Multiple out of bounds write errors in V8 and Mojo.

  - Multiple out of bounds read errors in Blink, WebAudio, SwiftShader, Little-CMS,
    PDFium and WebRTC.

  - An integer overflow error in Skia.

  - Multiple use after free errors in WebRTC and Memory Instrumentation.

  - An user confirmation bypass error in external protocol handling.

  - A stack buffer overflow error in SwiftShader.

  - An improper file access control in DevTools and Blink.

  - Multiple url spoofing errors.

  - The content security policy bypass error in Blink.

  - A security bypass error in Autofill.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to bypass security restrictions, cause denial of service condition,
  disclose sensitive information and conduct spoofing attack.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Google Chrome version prior to 69.0.3497.81
  on Windows");

  script_tag(name:"solution", value:"Upgrade to Google Chrome version 69.0.3497.81
  or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://chromereleases.googleblog.com/2018/09/stable-channel-update-for-desktop.html");
  script_xref(name:"URL", value:"http://www.google.com/chrome");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_google_chrome_detect_win.nasl");
  script_mandatory_keys("GoogleChrome/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
chr_ver = infos['version'];
chr_path = infos['location'];

if(version_is_less(version:chr_ver, test_version:"69.0.3497.81"))
{
  report = report_fixed_ver(installed_version:chr_ver, fixed_version:"69.0.3497.81", install_path:chr_path);
  security_message(data:report);
  exit(0);
}
exit(0);
