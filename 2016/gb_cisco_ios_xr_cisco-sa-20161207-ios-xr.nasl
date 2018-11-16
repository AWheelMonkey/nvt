###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ios_xr_cisco-sa-20161207-ios-xr.nasl 12338 2018-11-13 14:51:17Z asteins $
#
# Cisco IOS XR Software HTTP 2.0 Request Handling Event Service Daemon Denial of Service Vulnerability
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

CPE = "cpe:/o:cisco:ios_xr";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106448");
  script_cve_id("CVE-2016-9205");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_version("$Revision: 12338 $");

  script_name("Cisco IOS XR Software HTTP 2.0 Request Handling Event Service Daemon Denial of Service Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20161207-ios-xr");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in the HTTP 2.0 request handling code of Cisco IOS XR
Software could allow an unauthenticated, remote attacker to cause the Event Management Service daemon (emsd) to
crash, resulting in a denial of service (DoS) condition.");

  script_tag(name:"insight", value:"The vulnerability is due to improper handling of HTTP requests. An attacker
could exploit this vulnerability by sending malicious HTTP 2.0 requests to the targeted system.");

  script_tag(name:"impact", value:"An exploit could allow the attacker to cause the emsd to crash.");

  script_tag(name:"qod_type", value:"package");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-11-13 15:51:17 +0100 (Tue, 13 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-12-08 15:09:24 +0700 (Thu, 08 Dec 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_ios_xr_version.nasl");
  script_mandatory_keys("cisco/ios_xr/version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

if( version == '6.1.1' )
{
  report = report_fixed_ver(  installed_version:version, fixed_version: "See advisory" );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

