###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_sb_cisco-sa-20160615-rv1.nasl 12096 2018-10-25 12:26:02Z asteins $
#
# Cisco RV110W, RV130W, and RV215W Routers Cross-Site Scripting Vulnerability
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

CPE = "cpe:/h:cisco:small_business";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105769");
  script_cve_id("CVE-2016-1396");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_version("$Revision: 12096 $");

  script_name("Cisco RV110W, RV130W, and RV215W Routers Cross-Site Scripting Vulnerability");

  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160615-rv1");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");
  script_tag(name:"summary", value:"A vulnerability in the web-based management interface of Cisco RV110W Wireless-N VPN Firewalls,
Cisco RV130W Wireless-N Multifunction VPN Routers, and Cisco RV215W Wireless-N VPN Routers could
allow an unauthenticated, remote attacker to conduct a cross-site scripting (XSS) attack against a
user of the web-based management interface for a targeted device.

The vulnerability is due to improper input validation of certain parameters that are sent to an
affected device via the HTTP GET or HTTP POST method. An unauthenticated, remote attacker could
exploit this vulnerability by persuading a user to follow a link that is designed to submit
malicious input to an affected device. A successful exploit could allow the attacker to execute
arbitrary script in the context of the web-based management interface for the device or allow the
attacker to access sensitive browser-based information.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-25 14:26:02 +0200 (Thu, 25 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-06-17 13:54:53 +0200 (Fri, 17 Jun 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_small_business_devices_snmp_detect.nasl");
  script_mandatory_keys("cisco/small_business/model", "cisco/small_business/version");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );
if( ! model = get_kb_item( "cisco/small_business/model" ) ) exit( 0 );

if( model == 'RV110W' )
{
  affected = make_list(
			"1.1.0.9",
			"1.2.0.10",
			"1.2.0.9",
			"1.2.1.4"
		);
}

if( model == 'RV130W' )
{
  affected = make_list(
			"1.0.0.21",
			"1.0.1.3",
			"1.0.2.7"
		);
}

if( model == 'RV215W' )
{
  affected = make_list(
			"1.1.0.5",
			"1.1.0.6",
			"1.2.0.14",
			"1.2.0.15",
			"1.3.0.7"
		);
}


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

