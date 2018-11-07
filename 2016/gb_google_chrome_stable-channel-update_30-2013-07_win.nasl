##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_stable-channel-update_30-2013-07_win.nasl 11969 2018-10-18 14:53:42Z asteins $
#
# Google Chrome Security Updates(stable-channel-update_30-2013-07)-Windows
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.809068");
  script_version("$Revision: 11969 $");
  script_cve_id("CVE-2013-2881", "CVE-2013-2882", "CVE-2013-2883", "CVE-2013-2884",
                "CVE-2013-2885", "CVE-2013-2886");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-18 16:53:42 +0200 (Thu, 18 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-10-19 11:28:07 +0530 (Wed, 19 Oct 2016)");
  script_name("Google Chrome Security Updates(stable-channel-update_30-2013-07)-Windows");

  script_tag(name:"summary", value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaws exist due to

  - An origin bypass error in frame handling.

  - A type confusion error in Google V8.

  - An use-after-free error in MutationObserver.

  - An use-after-free in DOM implementation.

  - An use-after-free in input handling.

  - The various fixes from internal audits, fuzzing and other initiatives.");

  script_tag(name:"impact", value:"Successful exploitation of these
  vulnerabilities will allow remote attackers to cause a denial of service
  or possibly have unspecified other impact and to bypass security.");

  script_tag(name:"affected", value:"Google Chrome version
  prior to 28.0.1500.95 on Windows");

  script_tag(name:"solution", value:"Upgrade to Google Chrome version
  28.0.1500.95 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://googlechromereleases.blogspot.in/2013/07/stable-channel-update_30.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_google_chrome_detect_portable_win.nasl");
  script_mandatory_keys("GoogleChrome/Win/Ver");
  script_xref(name:"URL", value:"http://www.google.com/chrome");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!chr_ver = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:chr_ver, test_version:"28.0.1500.95"))
{
  report = report_fixed_ver(installed_version:chr_ver, fixed_version:"28.0.1500.95");
  security_message(data:report);
  exit(0);
}
