##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_stable-channel-update-for-desktop-2018-12_lin.nasl 13072 2019-01-15 08:12:06Z asteins $
#
# Google Chrome Security Updates(stable-channel-update-for-desktop-2018-12)-Linux
#
# Authors:
# Vidita V Koushik <vidita@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.814365");
  script_version("$Revision: 13072 $");
  script_cve_id("CVE-2018-17480", "CVE-2018-17481", "CVE-2018-18335", "CVE-2018-18336",
                "CVE-2018-18337", "CVE-2018-18338", "CVE-2018-18339", "CVE-2018-18340",
                "CVE-2018-18341", "CVE-2018-18342", "CVE-2018-18343", "CVE-2018-18344",
                "CVE-2018-18345", "CVE-2018-18346", "CVE-2018-18347", "CVE-2018-18348",
                "CVE-2018-18349", "CVE-2018-18350", "CVE-2018-18351", "CVE-2018-18352",
                "CVE-2018-18354", "CVE-2018-18355", "CVE-2018-18356", "CVE-2018-18357",
                "CVE-2018-18358", "CVE-2018-18359");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-15 09:12:06 +0100 (Tue, 15 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-12-05 14:52:39 +0530 (Wed, 05 Dec 2018)");
  script_name("Google Chrome Security Updates(stable-channel-update-for-desktop-2018-12)-Linux");

  script_tag(name:"summary", value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The multiple flaws exist due to

  - Multiple out of bounds write error in V8.

  - Multiple use after free errors in PDFium, Blink, WebAudio, MediaRecorder,
    Skia and Extensions.

  - Multiple heap buffer overflow errors in Skia, Canvas and Blink.

  - Inappropriate implementations in Extensions, Site Isolation, Navigation,
    Omnibox, Media, Network Authentication and PDFium.

  - Multiple issues in SQLite via WebSQL.

  - Incorrect security UI in Blink.

  - Insufficient policy enforcements in Blink, Navigation, URL Formatter,
    Proxy and Payments.

  - Insufficient data validation in Shell Integration.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  an attacker to execute arbitrary code in the context of the browser, obtain
  sensitive information, bypass security restrictions and perform unauthorized
  actions, or cause denial-of-service conditions");

  script_tag(name:"affected", value:"Google Chrome version
  prior to 71.0.3578.80 on Linux");

  script_tag(name:"solution", value:"Upgrade to Google Chrome version
  71.0.3578.80 or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://chromereleases.googleblog.com/2018/12/stable-channel-update-for-desktop.html");
  script_xref(name:"URL", value:"https://www.google.com/chrome");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_google_chrome_detect_lin.nasl");
  script_mandatory_keys("Google-Chrome/Linux/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
chr_ver = infos['version'];
chr_path = infos['location'];

if(version_is_less(version:chr_ver, test_version:"71.0.3578.80"))
{
  report = report_fixed_ver(installed_version:chr_ver, fixed_version:"71.0.3578.80", install_path:chr_path);
  security_message(data:report);
  exit(0);
}
exit(99);
