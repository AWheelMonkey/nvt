###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ios_xe_cisco-sa-20150325-ani.nasl 12431 2018-11-20 09:21:00Z asteins $
#
# Multiple Vulnerabilities in Cisco IOS Software and IOS XE Software Autonomic Networking Infrastructure
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
  script_oid("1.3.6.1.4.1.25623.1.0.105673");
  script_cve_id("CVE-2015-0635", "CVE-2015-0636", "CVE-2015-0637");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:C");
  script_version("$Revision: 12431 $");

  script_name("Multiple Vulnerabilities in Cisco IOS Software and IOS XE Software Autonomic Networking Infrastructure");

  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20150325-ani");
  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/viewAlert.x?alertId=37811");
  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/viewAlert.x?alertId=37812");
  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/viewAlert.x?alertId=37813");
  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/viewErp.x?alertId=43609");
  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityBundle/cisco-sa-20150325-bundle");
  script_xref(name:"URL", value:"http://www.cisco.com/web/about/security/intelligence/Cisco_ERP_mar15.html");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");
  script_tag(name:"summary", value:"The Autonomic Networking Infrastructure (ANI) feature of Cisco IOS Software
  and IOS XE Software has multiple vulnerabilities which could allow an unauthenticated, remote attacker to cause
  a denial of service (DoS) condition or gain limited command and control of the device.

  Autonomic Networking Registration Authority Spoofing Vulnerability

  Autonomic Networking Infrastructure Spoofed Autonomic Networking Messages Denial of Service Vulnerability

  Autonomic Networking Infrastructure Device Reload Denial of Service Vulnerability


  Cisco has released software updates that address these vulnerabilities.

  Note: The March 25, 2015, Cisco IOS & XE Software Security Advisory bundled publication includes seven Cisco Security Advisories.
  The advisories address vulnerabilities in Cisco IOS Software and Cisco IOS XE Software. Individual publication links are in Cisco Event
  Response: Semiannual Cisco IOS & XE Software Security Advisory Bundled Publication at the referenced links.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-11-20 10:21:00 +0100 (Tue, 20 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-05-10 10:44:03 +0200 (Tue, 10 May 2016)");
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
		'3.10.0S',
		'3.10.1S',
		'3.10.2S',
		'3.10.3S',
		'3.10.4S',
		'3.10.5S',
		'3.11.0S',
		'3.11.1S',
		'3.11.2S',
		'3.11.3S',
		'3.12.0S',
		'3.12.1S',
		'3.12.2S',
		'3.12.3S',
		'3.13.0S' );

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

