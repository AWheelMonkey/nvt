###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_esa_cisco-sa-20161026-esa3.nasl 11903 2018-10-15 10:26:16Z asteins $
#
# Cisco Email Security Appliance Corrupted Attachment Fields Denial of Service Vulnerability
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

CPE = "cpe:/h:cisco:email_security_appliance";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140027");
  script_cve_id("CVE-2016-6356");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_version("$Revision: 11903 $");

  script_name("Cisco Email Security Appliance Corrupted Attachment Fields Denial of Service Vulnerability");

  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20161026-esa3");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");
  script_tag(name:"summary", value:"A vulnerability in the email message filtering feature of Cisco AsyncOS Software for Cisco Email
  Security Appliances could allow an unauthenticated, remote attacker to cause an affected device to
  stop scanning and forwarding email messages due to a denial of service (DoS) condition.

  The vulnerability is due to improper input validation of email attachments that have corrupted
  fields. An attacker could exploit this vulnerability by sending a crafted email message, which has
  an attachment with corrupted fields, through an affected device. When the affected software filters
  the attachment, the filtering process could crash and restart, resulting in a DoS condition. After
  the filtering process restarts, the software resumes filtering for the same attachment, causing the
  filtering process to crash and restart again. A successful exploit could allow the attacker to cause
  a repeated DoS condition.

  Cisco has released software updates that address this vulnerability. There are no workarounds that
  address this vulnerability.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-15 12:26:16 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-10-27 14:11:57 +0200 (Thu, 27 Oct 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_esa_version.nasl");
  script_mandatory_keys("cisco_esa/installed");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

affected = make_list(
		'3.3.1-09',
		'7.1.0',
		'7.1.1',
		'7.1.2',
		'7.1.3',
		'7.1.4',
		'7.1.5',
		'7.3.0',
		'7.3.1',
		'7.3.2',
		'7.5.0',
		'7.5.1',
		'7.5.2',
		'7.5.2-201',
		'7.6.0',
		'7.6.1-000',
		'7.6.1-gpl-022',
		'7.6.2',
		'7.6.3-000',
		'7.6.3-025',
		'7.7.0-000',
		'7.7.1-000',
		'7.8.0',
		'7.8.0-311',
		'8.0.0',
		'8.0.1-023',
		'8.5.0-000',
		'8.5.0-ER1-198',
		'8.5.6-052',
		'8.5.6-073',
		'8.5.6-074',
		'8.5.6-106',
		'8.5.6-113',
		'8.5.7-042',
		'8.6.0',
		'8.6.0-011',
		'8.9.0',
		'8.9.1-000',
		'8.9.2-032',
		'9.0.0',
		'9.0.0-212',
		'9.0.0-461',
		'9.0.5-000',
		'9.1.0',
		'9.1.0-011',
		'9.1.0-101',
		'9.1.0-032',
		'9.4.0',
		'9.4.4-000',
		'9.5.0-000',
		'9.5.0-201',
		'9.6.0-000',
		'9.6.0-042',
		'9.6.0-051',
		'9.7.0-125',
		'9.7.1-066' );

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

