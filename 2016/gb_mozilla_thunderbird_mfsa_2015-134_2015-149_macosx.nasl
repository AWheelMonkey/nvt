###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_thunderbird_mfsa_2015-134_2015-149_macosx.nasl 11640 2018-09-27 07:15:20Z asteins $
#
# Mozilla Thunderbird Security Updates( mfsa_2015-134_2015-149 )-MAC OS X
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
  script_oid("1.3.6.1.4.1.25623.1.0.808692");
  script_version("$Revision: 11640 $");
  script_cve_id("CVE-2015-7214", "CVE-2015-7213", "CVE-2015-7205", "CVE-2015-7212",
		"CVE-2015-7201", "CVE-2015-7202");
  script_bugtraq_id(79279);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-27 09:15:20 +0200 (Thu, 27 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-09-07 12:17:35 +0530 (Wed, 07 Sep 2016)");
  script_name("Mozilla Thunderbird Security Updates( mfsa_2015-134_2015-149 )-MAC OS X");

  script_tag(name:"summary", value:"This host is installed with Mozilla
  Thunderbird and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to,
  multiple unspecified vulnerabilities in the browser engine.");

  script_tag(name:"impact", value:"Successful exploitation of this
  vulnerability will allow remote attackers  to cause a denial of service
  (memory corruption and application crash) or possibly execute arbitrary code.");

  script_tag(name:"affected", value:"Mozilla Thunderbird version before
  38.5 on MAC OS X.");

  script_tag(name:"solution", value:"Upgrade to Mozilla Thunderbird version 38.5
  For updates refer https://www.mozilla.org/en-US/thunderbird");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-149/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-146/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-145/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-139/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-134/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("ThunderBird/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!tbVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:tbVer, test_version:"38.5"))
{
  report = report_fixed_ver(installed_version:tbVer, fixed_version:"38.5");
  security_message(data:report);
  exit(0);
}
