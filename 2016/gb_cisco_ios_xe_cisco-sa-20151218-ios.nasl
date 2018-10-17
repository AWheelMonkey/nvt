###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ios_xe_cisco-sa-20151218-ios.nasl 11523 2018-09-21 13:37:35Z asteins $
#
# Cisco IOS and IOS XE Software IKEv1 State Machine Denial of Service Vulnerability
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

CPE = "cpe:/o:cisco:ios_xe";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105675");
  script_cve_id("CVE-2015-6429");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_version("$Revision: 11523 $");

  script_name("Cisco IOS and IOS XE Software IKEv1 State Machine Denial of Service Vulnerability");

  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20151218-ios");


  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");
  script_tag(name:"summary", value:"A vulnerability in the Internet Key Exchange (IKEv1) state machine of Cisco IOS and Cisco IOS XE Software could allow an unauthenticated, remote attacker to tear down valid IPsec connections, resulting in a partial denial of service (DoS) condition.

The vulnerability is due to insufficient condition checks in the IKEv1 state machine. An attacker could exploit this vulnerability by sending a spoofed, specific IKEv1 packet to an endpoint of an IPsec tunnel. A successful exploit could allow the attacker to tear down IPsec tunnels that terminate on the endpoint, causing a partial DoS condition.

Cisco has released software updates that address this vulnerability. There are no workarounds that mitigate this vulnerability.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-09-21 15:37:35 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-05-10 10:48:54 +0200 (Tue, 10 May 2016)");
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
		'3.15.0S',
		'3.15.1S',
		'3.15.2S',
		'3.17.0S',
		'3.17.1S',
		'3.16.0S',
		'3.16.1S' );

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

