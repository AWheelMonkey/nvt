##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_stable-channel-update-for-desktop_21-2017-09_win.nasl 10133 2018-06-08 11:13:34Z asteins $
#
# Google Chrome Security Updates(stable-channel-update-for-desktop_21-2017-09)-Windows
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
  script_oid("1.3.6.1.4.1.25623.1.0.811842");
  script_version("$Revision: 10133 $");
  script_cve_id("CVE-2017-5121", "CVE-2017-5122");
  script_bugtraq_id(100947);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-06-08 13:13:34 +0200 (Fri, 08 Jun 2018) $");
  script_tag(name:"creation_date", value:"2017-09-25 12:15:01 +0530 (Mon, 25 Sep 2017)");
  script_name("Google Chrome Security Updates(stable-channel-update-for-desktop_21-2017-09)-Windows");

  script_tag(name: "summary" , value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name: "insight" , value:"The multiple flaws exists due to,

  - Multiple out-of-bounds access errors in V8.

  - Various fixes from internal audits, fuzzing and other initiatives.");

  script_tag(name: "impact" , value:"Successful exploitation of these
  vulnerabilities will allow remote attackers to access information and can
  also  cause a crash.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Google Chrome version
  prior to 61.0.3163.100 on Windows");

  script_tag(name: "solution", value:"Upgrade to Google Chrome version
  61.0.3163.100 or later.
  For updates refer to http://www.google.com/chrome");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "https://chromereleases.googleblog.com/2017/09/stable-channel-update-for-desktop_21.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_google_chrome_detect_portable_win.nasl");
  script_mandatory_keys("GoogleChrome/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!chr_ver = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:chr_ver, test_version:"61.0.3163.100"))
{
  report = report_fixed_ver(installed_version:chr_ver, fixed_version:"61.0.3163.100");
  security_message(data:report);
  exit(0);
}

exit(99);
