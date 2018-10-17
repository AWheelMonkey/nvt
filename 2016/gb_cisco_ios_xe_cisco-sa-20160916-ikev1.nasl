###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ios_xe_cisco-sa-20160916-ikev1.nasl 11345 2018-09-12 07:02:17Z cfischer $
#
# Cisco IOS XE Software IKEv1 Information Disclosure Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.106260");
  script_cve_id("CVE-2016-6415");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_version("$Revision: 11345 $");

  script_name("Cisco IOS XE Software IKEv1 Information Disclosure Vulnerability");

  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160916-ikev1");
  script_xref(name:"URL", value:"https://bst.cloudapps.cisco.com/bugsearch/bug/CSCvb29204");
  script_xref(name:"URL", value:"https://bst.cloudapps.cisco.com/bugsearch/bug/CSCvb36055");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"The vendor has released updates, please see the referenced vendor advisory for more information on the fixed versions.");

  script_tag(name:"summary", value:"A vulnerability in IKEv1 packet processing code in Cisco IOS XE Software
could allow an unauthenticated, remote attacker to retrieve memory contents, which could lead to the disclosure
of confidential information.");

  script_tag(name:"insight", value:"The vulnerability is due to insufficient condition checks in the part of
the code that handles IKEv1 security negotiation requests. An attacker could exploit this vulnerability by
sending a crafted IKEv1 packet to an affected device configured to accept IKEv1 security negotiation requests.");

  script_tag(name:"impact", value:"A successful exploit could allow the attacker to retrieve memory contents,
which could lead to the disclosure of confidential information.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-09-12 09:02:17 +0200 (Wed, 12 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-09-19 09:36:49 +0700 (Mon, 19 Sep 2016)");
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
		'3.18.0S',
		'3.10.0S',
		'3.10.1S',
		'3.10.1xbS',
		'3.10.2S',
		'3.10.2tS',
		'3.10.3S',
		'3.10.4S',
		'3.10.5S',
		'3.10.6S',
		'3.10.7S',
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
		'3.13.5S',
		'3.13.0S',
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
		'3.17.1S',
		'3.16.3S',
		'3.16.0S',
		'3.16.0cS',
		'3.16.1S',
		'3.16.1aS',
		'3.16.2S' );

foreach af ( affected )
{
  if( version == af )
  {
    report = report_fixed_ver( installed_version:version, fixed_version: "See advisory" );
    security_message( port:0, data:report );
    exit( 0 );
  }
}

exit( 99 );

