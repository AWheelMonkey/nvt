###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ios_xe_cisco-sa-20160928-esp-nat.nasl 5850 2017-04-04 09:01:03Z teissa $
#
# Cisco IOS XE Software NAT Denial of Service Vulnerability
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

CPE = "cpe:/o:cisco:ios_xe";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.106299");
 script_cve_id("CVE-2016-6378");
 script_tag(name:"cvss_base", value:"7.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
 script_version ("$Revision: 5850 $");

 script_name("Cisco IOS XE Software NAT Denial of Service Vulnerability");

 script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160928-esp-nat");

 script_tag(name: "vuldetect" , value:"Check the version.");

 script_tag(name: "solution" , value:"See the referenced vendor advisory for a solution.");

 script_tag(name: "summary" , value:"A vulnerability in the implementation of Network Address Translation (NAT)
functionality in Cisco IOS XE Software could allow an unauthenticated, remote attacker to cause an affected
device to reload.");

 script_tag(name: "insight", value: "The vulnerability is due to improper handling of malformed ICMP packets by
the affected software. An attacker could exploit this vulnerability by sending crafted ICMP packets that require
NAT processing by an affected device.");

 script_tag(name: "impact", value: "A successful exploit could allow the attacker to cause the device to reload,
resulting in a denial of service (DoS) condition.");

 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");

 script_tag(name:"last_modification", value:"$Date: 2017-04-04 11:01:03 +0200 (Tue, 04 Apr 2017) $");
 script_tag(name:"creation_date", value:"2016-09-29 14:15:18 +0700 (Thu, 29 Sep 2016)");
 script_category(ACT_GATHER_INFO);
 script_family("CISCO");
 script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
 script_dependencies("gb_cisco_ios_xe_version.nasl");
 script_mandatory_keys("cisco_ios_xe/version");
 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

affected = make_list( 
		'16.2.1',
		'3.1.3S',
		'3.1.4S',
		'3.1.4aS',
		'3.2.1S',
		'3.2.2S',
		'3.3.0S',
		'3.3.1S',
		'3.3.2S',
		'3.4.0S',
		'3.4.1S',
		'3.4.2S',
		'3.4.3S',
		'3.4.4S',
		'3.4.5S',
		'3.4.6S',
		'3.5.0S',
		'3.5.1S',
		'3.5.2S',
		'3.6.0S',
		'3.6.1S',
		'3.6.2S',
		'3.7.0S',
		'3.7.0bS',
		'3.7.1S',
		'3.7.2S',
		'3.7.2tS',
		'3.7.3S',
		'3.7.4S',
		'3.7.4aS',
		'3.7.5S',
		'3.7.6S',
		'3.7.7S',
		'3.8.0S',
		'3.8.1S',
		'3.8.2S',
		'3.9.0S',
		'3.9.0aS',
		'3.9.1S',
		'3.9.1aS',
		'3.9.2S',
		'3.10.0S',
		'3.10.1S',
		'3.10.2S',
		'3.10.2tS',
		'3.10.3S',
		'3.10.4S',
		'3.10.5S',
		'3.10.6S',
		'3.11.0S',
		'3.11.1S',
		'3.11.2S',
		'3.11.3S',
		'3.11.4S',
		'3.12.0S',
		'3.12.0aS',
		'3.12.1S',
		'3.12.4S',
		'3.12.2S',
		'3.12.3S',
		'3.13.2aS',
		'3.13.0S',
		'3.13.0aS',
		'3.13.1S',
		'3.13.2S',
		'3.13.3S',
		'3.13.4S',
		'3.14.0S',
		'3.14.1S',
		'3.14.2S',
		'3.14.3S',
		'3.15.1cS',
		'3.15.3S',
		'3.15.0S',
		'3.15.1S',
		'3.15.2S',
		'3.17.0S',
		'16.1.3',
		'16.1.4',
		'3.16.0S',
		'3.16.0cS',
		'3.16.1S',
		'3.16.1aS' );

foreach af ( affected )
{
  if( version == af )
  {
    report = report_fixed_ver(  installed_version:version, fixed_version: "See advisory" );
    security_message( port:0, data:report );
    exit( 0 );
  }
}

exit( 99 );

