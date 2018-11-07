##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_stable-channel-update-for-desktop-2018-06_win.nasl 12116 2018-10-26 10:01:35Z mmartin $
#
# Google Chrome Security Updates(stable-channel-update-for-desktop-2018-06)-Windows
#
# Authors:
# Rajat Mishra <rajatm@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.813515");
  script_version("$Revision: 12116 $");
  script_cve_id("CVE-2018-6148");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:01:35 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-06-07 11:05:17 +0530 (Thu, 07 Jun 2018)");
  script_name("Google Chrome Security Updates(stable-channel-update-for-desktop-2018-06)-Windows");

  script_tag(name:"summary", value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to Incorrect handling of
  CSP header.");

  script_tag(name:"impact", value:"Successful exploitation could allow an
  attacker to perform cross-site scripting, clickjacking and other types of code
  injection attacks.");

  script_tag(name:"affected", value:"Google Chrome version
  prior to 67.0.3396.79 on Windows");

  script_tag(name:"solution", value:"Upgrade to Google Chrome version
  67.0.3396.79 or later.  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://www.google.com/chrome");
  script_xref(name:"URL", value:"https://chromereleases.googleblog.com/2018/06/stable-channel-update-for-desktop.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

if(version_is_less(version:chr_ver, test_version:"67.0.3396.79"))
{
  report = report_fixed_ver(installed_version:chr_ver, fixed_version:"67.0.3396.79");
  security_message(data:report);
  exit(0);
}

exit(0);
