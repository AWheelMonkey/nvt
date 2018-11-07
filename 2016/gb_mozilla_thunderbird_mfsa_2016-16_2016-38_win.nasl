###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_thunderbird_mfsa_2016-16_2016-38_win.nasl 12149 2018-10-29 10:48:30Z asteins $
#
# Mozilla Thunderbird Security Updates(mfsa_2016-16_2016-38)-Windows
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:mozilla:thunderbird";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807627");
  script_version("$Revision: 12149 $");
  script_cve_id("CVE-2016-1977", "CVE-2016-2790", "CVE-2016-2791", "CVE-2016-2792",
		"CVE-2016-2793", "CVE-2016-2794", "CVE-2016-2795", "CVE-2016-2796",
		"CVE-2016-2797", "CVE-2016-2798", "CVE-2016-2799", "CVE-2016-2800",
		"CVE-2016-2801", "CVE-2016-2802", "CVE-2016-1953", "CVE-2016-1950",
		"CVE-2016-1974", "CVE-2016-1966", "CVE-2016-1964", "CVE-2016-1961",
		"CVE-2016-1960", "CVE-2016-1957", "CVE-2016-1954", "CVE-2016-1952");
  script_bugtraq_id(84222, 84221, 84223, 84219, 84218);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-29 11:48:30 +0100 (Mon, 29 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-04-01 13:19:33 +0530 (Fri, 01 Apr 2016)");
  script_name("Mozilla Thunderbird Security Updates(mfsa_2016-16_2016-38)-Windows");

  script_tag(name:"summary", value:"This host is installed with Mozilla
  Thunderbird and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaws exist due to,

  - The 'nsScannerString::AppendUnicodeTo' function does not verify that memory
    allocation succeeds.

  - A memory corruption vulnerability in NPAPI plugin.

  - An use-after-free vulnerability in the 'AtomicBaseIncDec' function.

  - An use-after-free vulnerability in the 'nsHTMLDocument::SetBody' function in
    'dom/html/nsHTMLDocument.cpp' script.

  - Memory leak in libstagefright when deleting an array during MP4 processing.

  - The 'nsCSPContext::SendReports' function in 'dom/security/nsCSPContext.cpp'
    script does not prevent use of a non-HTTP report-uri for a (CSP) violation report.

  - The multiple unspecified vulnerabilities in the browser engine.");

  script_tag(name:"impact", value:"Successful exploitation of this
  vulnerabilities will allow remote attackers to cause a denial of service
  (memory corruption and application crash) or possibly execute arbitrary code.");

  script_tag(name:"affected", value:"Mozilla Thunderbird version before
  38.7 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Mozilla Thunderbird version 38.7");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-37/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-36/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-35/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-34/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-31/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-27/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-24/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-23/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-20/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-17/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-16/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_thunderbird_detect_portable_win.nasl");
  script_mandatory_keys("Thunderbird/Win/Ver");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/thunderbird");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!tbVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:tbVer, test_version:"38.7"))
{
  report = report_fixed_ver(installed_version:tbVer, fixed_version:"38.7");
  security_message(data:report);
  exit(0);
}
