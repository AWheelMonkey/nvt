###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_thunderbird_mult_vuln01_mar15_win.nasl 11452 2018-09-18 11:24:16Z mmartin $
#
# Mozilla Thunderbird Multiple Vulnerabilities-01 Mar15 (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.805479");
  script_version("$Revision: 11452 $");
  script_cve_id("CVE-2015-0836", "CVE-2015-0833", "CVE-2015-0831", "CVE-2015-0827",
                "CVE-2015-0822");
  script_bugtraq_id(72747, 72742, 72746, 72755, 72756);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-18 13:24:16 +0200 (Tue, 18 Sep 2018) $");
  script_tag(name:"creation_date", value:"2015-03-03 16:02:28 +0530 (Tue, 03 Mar 2015)");
  script_name("Mozilla Thunderbird Multiple Vulnerabilities-01 Mar15 (Windows)");

  script_tag(name:"summary", value:"This host is installed with Mozilla
  Thunderbird and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to,

  - Some unspecified vulnerabilities in the browser engine.

  - Multiple untrusted search path vulnerabilities in updater.exe.

  - Use-after-free error in the 'IDBDatabase::CreateObjectStore' function in
  dom/indexedDB/IDBDatabase.cpp script.

  - Heap-based buffer overflow in the 'mozilla::gfx::CopyRect' and
  'nsTransformedTextRun::SetCapitalization' functions.

  - Flaw in the autocomplete feature for forms.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to disclose potentially sensitive information, bypass certain security
  restrictions, cause a denial of service, execute arbitrary code and local
  privilege escalation.");

  script_tag(name:"affected", value:"Mozilla Thunderbird before version 31.5
  on Windows");

  script_tag(name:"solution", value:"Upgrade to Mozilla Thunderbird version
  31.5 or later, For updates refer https://www.mozilla.org/en-US/thunderbird");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://www.securitytracker.com/id/1031791");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-26");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
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

if(version_is_less(version:tbVer, test_version:"31.5"))
{
  report = 'Installed version: ' + tbVer + '\n' +
           'Fixed version:     31.5\n';
  security_message(data:report);
  exit(0);
}
