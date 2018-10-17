##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_stable-channel-update-2016-05_win.nasl 11516 2018-09-21 11:15:17Z asteins $
#
# Google Chrome Security Updates(stable-channel-update-2016-05)-Windows
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
  script_oid("1.3.6.1.4.1.25623.1.0.807589");
  script_version("$Revision: 11516 $");
  script_cve_id("CVE-2016-1667", "CVE-2016-1668", "CVE-2016-1669", "CVE-2016-1670");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 13:15:17 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-05-17 11:47:13 +0530 (Tue, 17 May 2016)");
  script_name("Google Chrome Security Updates(stable-channel-update-2016-05)-Windows");

  script_tag(name:"summary", value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaws exists due to

  - Same origin bypass in DOM.

  - Same origin bypass in Blink V8 bindings.

  - Buffer overflow in V8.

  - Race condition in loader.");

  script_tag(name:"impact", value:"Successful exploitation of this
  vulnerability will allow remote attackers to bypass security restrictions,
  to obtain sensitive information and to cause a denial of service
  (buffer overflow) or possibly have unspecified other impact.");

  script_tag(name:"affected", value:"Google Chrome version
  prior to 50.0.2661.102 on Windows");

  script_tag(name:"solution", value:"Upgrade to Google Chrome version
  50.0.2661.102 or later.
  For updates refer to http://www.google.com/chrome");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://googlechromereleases.blogspot.in/2016/05/stable-channel-update.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(version_is_less(version:chr_ver, test_version:"50.0.2661.102"))
{
  report = report_fixed_ver(installed_version:chr_ver, fixed_version:"50.0.2661.102");
  security_message(data:report);
  exit(0);
}
