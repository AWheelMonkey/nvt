###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ios_cisco-sa-20160921-caf.nasl 11596 2018-09-25 09:49:46Z asteins $
#
# Cisco IOS Software Application-Hosting Framework Unauthorized File Access Vulnerability
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

CPE = "cpe:/o:cisco:ios";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106277");
  script_cve_id("CVE-2016-6410");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:N/A:N");
  script_version("$Revision: 11596 $");

  script_name("Cisco IOS Software Application-Hosting Framework Unauthorized File Access Vulnerability");

  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160921-caf");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in the Cisco application-hosting framework (CAF) for
Cisco IOS Software with the IOx feature set could allow an authenticated, remote attacker to read arbitrary
files on a targeted system.");

  script_tag(name:"insight", value:"The vulnerability is due to insufficient input validation by the affected
framework. An attacker could exploit this vulnerability by submitting specific, crafted input to the affected
framework.");

  script_tag(name:"impact", value:"A successful exploit could allow the attacker to read arbitrary files on
the targeted system.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-09-25 11:49:46 +0200 (Tue, 25 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-09-22 10:06:54 +0700 (Thu, 22 Sep 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_ssh_cisco_ios_get_version.nasl");
  script_mandatory_keys("cisco_ios/version");
 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

if( version == '15.5(2)T' ) {
  report = report_fixed_ver(  installed_version:version, fixed_version: "See advisory" );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

