##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_stable-channel-update-for-desktop_12-2018-06_win.nasl 10199 2018-06-14 13:09:24Z santu $
#
# Google Chrome Security Updates(stable-channel-update-for-desktop_12-2018-06)-Windows
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
  script_oid("1.3.6.1.4.1.25623.1.0.813603");
  script_version("$Revision: 10199 $");
  script_cve_id("CVE-2018-6149");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-06-14 15:09:24 +0200 (Thu, 14 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-14 10:21:07 +0530 (Thu, 14 Jun 2018)");
  script_name("Google Chrome Security Updates(stable-channel-update-for-desktop_12-2018-06)-Windows");

  script_tag(name:"summary", value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to an out of bounds write 
  error in V8.");

  script_tag(name: "impact" , value:"Successful exploitation will allow an 
  attacker to cause an out-of-bounds write to arbitrary locations in memory.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Google Chrome version prior to 67.0.3396.87 
  on Windows.");

  script_tag(name: "solution", value:"Upgrade to Google Chrome version 67.0.3396.87 
  or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "https://chromereleases.googleblog.com/2018/06/stable-channel-update-for-desktop_12.html");
  script_xref(name : "URL" , value : "https://www.google.co.in/chrome");
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

if(version_is_less(version:chr_ver, test_version:"67.0.3396.87"))
{
  report = report_fixed_ver(installed_version:chr_ver, fixed_version:"67.0.3396.87", install_path:chr_path);
  security_message(data:report);
  exit(0);
}
exit(0);