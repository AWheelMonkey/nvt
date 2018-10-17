###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_asa_CSCux00686.nasl 11569 2018-09-24 10:29:54Z asteins $
#
# Cisco ASA Software libSRTP Denial of Service Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
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

CPE = "cpe:/a:cisco:asa";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106073");
  script_cve_id("CVE-2015-6360");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_version("$Revision: 11569 $");

  script_name("Cisco ASA Software libSRTP Denial of Service Vulnerability");

  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160420-libsrtp");


  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");
  script_tag(name:"summary", value:"Cisco released version 1.5.3 of the Secure Real-Time Transport Protocol (SRTP
library (libSRTP), which addresses a denial of service (DoS) vulnerability.

The vulnerability is in the encryption processing subsystem of libSRTP and could allow an unauthenticated,
remote attacker to trigger a DoS condition. The vulnerability is due to improper input validation of certain
fields of SRTP packets. An attacker could exploit this vulnerability by sending a crafted SRTP packet designed
to trigger the issue to an affected device.

The impact of this vulnerability on Cisco products may vary depending on the affected product. Details about
the impact on each product are outlined in the `Conditions` section of each Cisco bug for this vulnerability.

http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160420-libsrtp");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-09-24 12:29:54 +0200 (Mon, 24 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-05-13 09:53:45 +0700 (Fri, 13 May 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_asa_version.nasl", "gb_cisco_asa_version_snmp.nasl");
  script_mandatory_keys("cisco_asa/version");
 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE, nofork: TRUE ) ) exit( 0 );
check_vers = ereg_replace(string:version, pattern:"\(([0-9.]+)\)", replace:".\1");

affected = make_list(
		'8.1.0.104',
		'8.2.0.45',
		'8.2.1',
		'8.2.1.11',
		'8.2.2',
		'8.2.2.9',
		'8.2.2.10',
		'8.2.2.12',
		'8.2.2.16',
		'8.2.2.17',
		'8.2.3',
		'8.2.4',
		'8.2.4.1',
		'8.2.4.4',
		'8.2.5',
		'8.2.5.13',
		'8.2.5.22',
		'8.2.5.26',
		'8.2.5.33',
		'8.2.5.40',
		'8.2.5.41',
		'8.2.5.46',
		'8.2.5.48',
		'8.2.5.50',
		'8.2.5.52',
		'8.2.5.55',
		'8.2.5.57',
		'8.3.1',
		'8.3.1.1',
		'8.3.1.4',
		'8.3.1.6',
		'8.3.2',
		'8.3.2.4',
		'8.3.2.13',
		'8.3.2.23',
		'8.3.2.25',
		'8.3.2.31',
		'8.3.2.33',
		'8.3.2.34',
		'8.3.2.37',
		'8.3.2.39',
		'8.3.2.40',
		'8.3.2.41',
		'8.3.2.44',
		'8.4.1',
		'8.4.1.3',
		'8.4.1.11',
		'8.4.2',
		'8.4.2.1',
		'8.4.2.8',
		'8.4.3',
		'8.4.3.8',
		'8.4.3.9',
		'8.4.4',
		'8.4.4.1',
		'8.4.4.3',
		'8.4.4.5',
		'8.4.4.9',
		'8.4.5',
		'8.4.5.6',
		'8.4.6',
		'8.4.7',
		'8.4.7.3',
		'8.4.7.15',
		'8.4.7.22',
		'8.4.7.23',
		'8.4.7.26',
		'8.4.7.28',
		'8.4.0',
		'8.4.7.29',
		'8.5.1',
		'8.5.1.1',
		'8.5.1.6',
		'8.5.1.7',
		'8.5.1.14',
		'8.5.1.17',
		'8.5.1.18',
		'8.5.1.19',
		'8.5.1.24',
		'8.5.1.21',
		'8.6.1',
		'8.6.1.1',
		'8.6.1.2',
		'8.6.1.5',
		'8.6.1.10',
		'8.6.1.12',
		'8.6.1.13',
		'8.6.1.17',
		'8.6.1.14',
		'8.7.1',
		'8.7.1.1',
		'8.7.1.3',
		'8.7.1.4',
		'8.7.1.7',
		'8.7.1.8',
		'8.7.1.11',
		'8.7.1.13',
		'8.7.1.16',
		'8.7.1.17',
		'9.0.1',
		'9.0.2',
		'9.0.2.10',
		'9.0.3',
		'9.0.3.6',
		'9.0.3.8',
		'9.0.4',
		'9.0.4.1',
		'9.0.4.5',
		'9.0.4.7',
		'9.0.4.17',
		'9.0.4.20',
		'9.0.4.24',
		'9.0.4.26',
		'9.0.4.29',
		'9.0.4.33',
		'9.0.4.35',
		'9.0.4.37',
		'9.1.1',
		'9.1.1.4',
		'9.1.2',
		'9.1.2.8',
		'9.1.3',
		'9.1.3.2',
		'9.1.4',
		'9.1.4.5',
		'9.1.5',
		'9.1.5.10',
		'9.1.5.12',
		'9.1.5.15',
		'9.1.5.21',
		'9.1.6',
		'9.1.6.1',
		'9.1.6.4',
		'9.1.6.6',
		'9.1.6.8',
		'9.1.6.10',
		'9.2.1',
		'9.2.2',
		'9.2.2.4',
		'9.2.2.7',
		'9.2.2.8',
		'9.2.3',
		'9.2.3.3',
		'9.2.3.4',
		'9.2',
		'9.2.0.104',
		'9.2.3.1',
		'9.2.4',
		'9.3.1',
		'9.3.1.1',
		'9.3.2',
		'9.3.2.2',
		'9.3.3',
		'9.3.3.1',
		'9.3.3.2',
		'9.3.3.5',
		'9.3.1.105',
		'9.3.2.100',
		'9.3.2.243',
		'9.3.1.50',
		'9.3.5' );

foreach af ( affected )
{
  if( check_vers == af )
  {
    report = report_fixed_ver(  installed_version:version, fixed_version: "See advisory" );
    security_message( port:0, data:report );
    exit( 0 );
  }
}

exit( 99 );

