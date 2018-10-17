###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_thunderbird_mult_vuln01_jan15_win.nasl 11452 2018-09-18 11:24:16Z mmartin $
#
# Mozilla Thunderbird Multiple Vulnerabilities-01 Jan15 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:mozilla:thunderbird";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805252");
  script_version("$Revision: 11452 $");
  script_cve_id("CVE-2014-8639", "CVE-2014-8638", "CVE-2014-8634");
  script_bugtraq_id(72046, 72047, 72049);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-18 13:24:16 +0200 (Tue, 18 Sep 2018) $");
  script_tag(name:"creation_date", value:"2015-01-20 13:57:45 +0530 (Tue, 20 Jan 2015)");
  script_name("Mozilla Thunderbird Multiple Vulnerabilities-01 Jan15 (Windows)");

  script_tag(name:"summary", value:"This host is installed with Mozilla
  Thunderbird and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to,

  - An error when handling a '407 Proxy Authentication' response with a
  'Set-Cookie' header from a web proxy.

  - Some unspecified errors.

  - An error when handling a request from 'navigator.sendBeacon' API interface
  function.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to bypass certain security restrictions, and compromise a user's
  system.");

  script_tag(name:"affected", value:"Mozilla Thunderbird before version 31.4
  on Windows");

  script_tag(name:"solution", value:"Upgrade to Mozilla Thunderbird version
  31.4 or later, For updates refer https://www.mozilla.org/en-US/thunderbird");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://secunia.com/advisories/62253");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-04");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-03");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-01");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_thunderbird_detect_portable_win.nasl");
  script_mandatory_keys("Thunderbird/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!tbVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:tbVer, test_version:"31.4"))
{
  fix = "31.4";
  report = 'Installed version: ' + tbVer + '\n' +
             'Fixed version:     ' + fix  + '\n';
  security_message(data:report );
  exit(0);
}
