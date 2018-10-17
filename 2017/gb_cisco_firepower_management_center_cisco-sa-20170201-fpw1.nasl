###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_firepower_management_center_cisco-sa-20170201-fpw1.nasl 11935 2018-10-17 08:47:01Z mmartin $
#
# Cisco Firepower URL Bypass Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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

CPE = "cpe:/a:cisco:firepower_management_center";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106557");
  script_cve_id("CVE-2017-3814");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_version("$Revision: 11935 $");

  script_name("Cisco Firepower URL Bypass Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170201-fpw1");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in Cisco Firepower System Software could allow an
unauthenticated, remote attacker to maliciously bypass the appliance's ability to block certain web content.");

  script_tag(name:"insight", value:"The vulnerability is due to insufficient input validation checks within the
system's access control rule criteria. An attacker could exploit this vulnerability by adding malicious text to
the end of a URL string.");

  script_tag(name:"impact", value:"An exploit could allow the attacker to bypass configured blocked websites.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-17 10:47:01 +0200 (Wed, 17 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-02-02 12:37:17 +0700 (Thu, 02 Feb 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_firepower_management_center_version.nasl");
  script_mandatory_keys("cisco_firepower_management_center/version");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

affected = make_list(
		'5.3.0',
		'5.4.0',
		'6.0.0',
		'6.0.1',
		'6.1.0' );

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

