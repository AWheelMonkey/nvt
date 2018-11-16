###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_mult_vuln_feb16_macosx.nasl 12338 2018-11-13 14:51:17Z asteins $
#
# Mozilla Firefox ESR Multiple Vulnerabilities - Feb16 (Mac OS X)
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

CPE = "cpe:/a:mozilla:firefox_esr";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807071");
  script_version("$Revision: 12338 $");
  script_cve_id("CVE-2016-1521", "CVE-2016-1522", "CVE-2016-1523", "CVE-2016-1526");
  script_bugtraq_id(82991);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-13 15:51:17 +0100 (Tue, 13 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-02-15 13:46:57 +0530 (Mon, 15 Feb 2016)");
  script_name("Mozilla Firefox ESR Multiple Vulnerabilities - Feb16 (Mac OS X)");

  script_tag(name:"summary", value:"This host is installed with Mozilla
  Firefox ESR and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to:

  - Insufficient validation of size value by 'TtfUtil:LocaLookup' function in
    'TtfUtil.cpp' script in Libgraphite in Graphite.

  - Mishandling of a return value by 'SillMap::readFace' function in
   'FeatureMap.cpp' script in Libgraphite in Graphite.

  - 'Code.cpp' script in Libgraphite in Graphite does not consider recursive load
    calls during a size check.

  - Insufficient validation of a certain skip operation by 'directrun' function in
    'directmachine.cpp' script in Libgraphite in Graphite.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary code, obtain sensitive information, or cause a
  denial of service.");

  script_tag(name:"affected", value:"Mozilla Firefox ESR version 38.x
  before 38.6.1 on Mac OS X.");

  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox ESR version
  38.6.1 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-14");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("Mozilla/Firefox-ESR/MacOSX/Version");
  script_xref(name:"URL", value:"http://www.mozilla.com/en-US/firefox/all.html");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!ffVer = get_app_version(cpe:CPE)){
   exit(0);
}

if(ffVer =~ "^38")
{
  if(version_is_less(version:ffVer, test_version:"38.6.1"))
  {
    report = report_fixed_ver(installed_version:ffVer, fixed_version:"38.6.1");
    security_message(data:report);
    exit(0);
  }
}
