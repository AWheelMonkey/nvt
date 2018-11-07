###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_thunderbird_mfsa_2016-16_2016-38_1_macosx.nasl 12051 2018-10-24 09:14:54Z asteins $
#
# Mozilla Thunderbird Security Updates( mfsa_2016-16_2016-38_1 )-MAC OS X
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
  script_oid("1.3.6.1.4.1.25623.1.0.808696");
  script_version("$Revision: 12051 $");
  script_cve_id("CVE-2016-1977", "CVE-2016-2790", "CVE-2016-2791", "CVE-2016-2792",
		"CVE-2016-2793", "CVE-2016-2794", "CVE-2016-2795", "CVE-2016-2796",
		"CVE-2016-2797", "CVE-2016-2798", "CVE-2016-2799", "CVE-2016-2800",
		"CVE-2016-2801", "CVE-2016-2802", "CVE-2016-1979", "CVE-2016-1950",
		"CVE-2016-1974", "CVE-2016-1953", "CVE-2016-1964", "CVE-2016-1961",
		"CVE-2016-1960", "CVE-2016-1957", "CVE-2016-1956", "CVE-2016-1955",
		"CVE-2016-1954", "CVE-2016-1952");
  script_bugtraq_id(84222, 84221, 84223, 84219, 84218);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-24 11:14:54 +0200 (Wed, 24 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-09-07 12:03:08 +0530 (Wed, 07 Sep 2016)");
  script_name("Mozilla Thunderbird Security Updates( mfsa_2016-16_2016-38_1 )-MAC OS X");

  script_tag(name:"summary", value:"This host is installed with Mozilla
  Thunderbird and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist, Refer to the reference
  link for more information.");

  script_tag(name:"impact", value:"Successful exploitation of this
  vulnerability will allow remote attackers  to cause a denial of service
  (memory corruption and application crash) or possibly execute arbitrary code.");

  script_tag(name:"affected", value:"Mozilla Thunderbird version before
  45 on MAC OS X.");

  script_tag(name:"solution", value:"Upgrade to Mozilla Thunderbird version 45");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-37/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-36/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-35/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-34/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-27/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-24/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-23/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-20/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-19/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-18/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-17/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-16/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("ThunderBird/MacOSX/Version");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/thunderbird");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!tbVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:tbVer, test_version:"45"))
{
  report = report_fixed_ver(installed_version:tbVer, fixed_version:"45");
  security_message(data:report);
  exit(0);
}
