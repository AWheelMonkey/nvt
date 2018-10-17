###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ios_xe_cisco-sa-20160804-wedge.nasl 11922 2018-10-16 10:24:25Z asteins $
#
# Cisco IOS XE Software Crafted Network Time Protocol Packets Denial of Service Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.106175");
  script_cve_id("CVE-2016-1478");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_version("$Revision: 11922 $");

  script_name("Cisco IOS XE Software Crafted Network Time Protocol Packets Denial of Service Vulnerability");

  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160804-wedge");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in the processing of Network Time Protocol (NTP)
packets by Cisco IOS XE could allow an unauthenticated, remote attacker to cause an interface wedge and an
eventual denial of service (DoS) condition on the affected device.

The vulnerability is due to insufficient checks on clearing the invalid NTP packets from the
interface queue. An attacker could exploit this vulnerability by sending a number of crafted NTP
packets to be processed by an affected device. An exploit could allow the attacker to cause an
interface wedge and an eventual denial of service (DoS) condition on the affected device.

Cisco has released software updates that address this vulnerability. There are no workarounds that
address this vulnerability; however, there is a mitigation for this vulnerability.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-16 12:24:25 +0200 (Tue, 16 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-08-10 15:45:16 +0700 (Wed, 10 Aug 2016)");
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
		'3.16.3S',
		'3.17.2S',
		'3.18.1S' );

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

