###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_apic_cisco-sa-20161102-n9kapic.nasl 11922 2018-10-16 10:24:25Z asteins $
#
# Cisco Application Policy Infrastructure Controller Denial of Service Vulnerability
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

CPE = "cpe:/o:cisco:application_policy_infrastructure_controller_(apic)";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106369");
  script_cve_id("CVE-2016-6457");
  script_tag(name:"cvss_base", value:"6.1");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:L/Au:N/C:N/I:N/A:C");
  script_version("$Revision: 11922 $");

  script_name("Cisco Application Policy Infrastructure Controller Denial of Service Vulnerability");

  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20161102-n9kapic");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in the Cisco Nexus 9000 Series Platform Leaf Switches for
Application Centric Infrastructure (ACI) could allow an unauthenticated, adjacent attacker to cause a denial of
service (DoS) condition on the affected device.");

  script_tag(name:"insight", value:"The vulnerability is due to improper handling of a type of Layer 2 control
plane traffic. An attacker could exploit this vulnerability by sending crafted traffic to a host behind a leaf
switch.");

  script_tag(name:"impact", value:"An exploit could allow the attacker to cause a DoS condition on the affected
device.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-16 12:24:25 +0200 (Tue, 16 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-11-03 13:54:56 +0700 (Thu, 03 Nov 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_apic_web_detect.nasl");
  script_require_ports("Services/www", 80, 443);
  script_mandatory_keys("cisco/application_policy_infrastructure_controller/installed");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

affected = make_list(
		'1.3(1)',
		'1.3(2)',
		'1.2(3)',
		'1.2(2)',
		'2.0(1)' );

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
