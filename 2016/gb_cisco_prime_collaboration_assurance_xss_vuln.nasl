###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_prime_collaboration_assurance_xss_vuln.nasl 11516 2018-09-21 11:15:17Z asteins $
#
# Cisco Prime Collaboration Assurance Cross-Site Scripting Vulnerability
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################
CPE = "cpe:/a:cisco:prime_collaboration_assurance";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809770");
  script_version("$Revision: 11516 $");
  script_cve_id("CVE-2016-9200");
  script_bugtraq_id(94806);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 13:15:17 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-12-22 19:49:38 +0530 (Thu, 22 Dec 2016)");
  script_name("Cisco Prime Collaboration Assurance Cross-Site Scripting Vulnerability");

  script_tag(name:"summary", value:"This host is running cisco prime collaboration
  assurance and is prone to cross site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to insufficient input validation
  of some parameters that are passed to the web server.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attacker to execute arbitrary script code in the context of the affected site
  or allow the attacker to access sensitive browser-based information.");

  script_tag(name:"qod_type", value:"package");

  script_tag(name:"affected", value:"Cisco Cisco Prime Collaboration Assurance
  versions 10.5.1 and 10.6.0");

  script_tag(name:"solution", value:"Apply patch from the vendor advisory. For
  details refer to
  https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20161207-pca");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://bst.cloudapps.cisco.com/bugsearch/bug/CSCut43268");
  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20161207-pca");

  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_pca_version.nasl");
  script_mandatory_keys("cisco_pca/detected");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!version = get_app_version(cpe:CPE)) exit(0);

if(version =~ "^(10\.(5|6))")
{
  if(version_is_equal(version:version, test_version:"10.5.1")||
     version_is_equal(version:version, test_version:"10.6.0"))
  {
    report = report_fixed_ver(installed_version:version, fixed_version:"Apply Patch");
    security_message(data:report, port:0);
    exit(0);
  }
}
exit(0);
