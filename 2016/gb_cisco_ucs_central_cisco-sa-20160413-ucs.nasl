###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ucs_central_cisco-sa-20160413-ucs.nasl 11596 2018-09-25 09:49:46Z asteins $
#
# Cisco UCS Central Software Arbitrary Command Execution Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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

CPE = "cpe:/a:cisco:ucs_central_software";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105604");
  script_cve_id("CVE-2016-1352");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_version("$Revision: 11596 $");

  script_name("Cisco UCS Central Software Arbitrary Command Execution Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160413-ucs");

  script_tag(name:"impact", value:"An attacker could exploit this vulnerability by sending a malicious HTTP request to an affected system. A successful exploit could allow the attacker to execute arbitrary commands on the underlying operating system.");
  script_tag(name:"vuldetect", value:"Check the version");
  script_tag(name:"insight", value:"The vulnerability is due to improper input validation by the affected software.<");
  script_tag(name:"solution", value:"Update to 1.3(1c)/1.4(1a) or newer");
  script_tag(name:"summary", value:"A vulnerability in the web framework of Cisco Unified Computing System (UCS) Central Software could allow an unauthenticated, remote attacker to execute arbitrary commands on a targeted system.");
  script_tag(name:"affected", value:"Cisco UCS Central Software releases 1.3(1b) and prior.");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"last_modification", value:"$Date: 2018-09-25 11:49:46 +0200 (Tue, 25 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-04-15 13:16:59 +0200 (Fri, 15 Apr 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_ucs_central_version.nasl");
  script_mandatory_keys("cisco_ucs_central/version");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

# example: 1.4(1a).
if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

version = str_replace( string:version, find:"(", replace:".");
version = str_replace( string:version, find:")", replace:"");

if( version_is_less_equal( version:version, test_version:'1.3.1b' ) )
{
  report = report_fixed_ver(  installed_version:version, fixed_version:"1.3(1c)/1.4(1a)" );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

