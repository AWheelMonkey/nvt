###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_esa_cisco-sa-20161102-esa.nasl 12431 2018-11-20 09:21:00Z asteins $
#
# Cisco Email Security Appliance RAR File Attachment Scanner Bypass Vulnerability
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

CPE = "cpe:/h:cisco:email_security_appliance";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106370");
  script_cve_id("CVE-2016-6458");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_version("$Revision: 12431 $");

  script_name("Cisco Email Security Appliance RAR File Attachment Scanner Bypass Vulnerability");

  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20161102-esa");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in the content filtering functionality of Cisco AsyncOS
Software for Cisco Email Security Appliances could allow an unauthenticated, remote attacker to bypass content
filters configured on an affected device. Email that should have been filtered could instead be forwarded by the
device.");

  script_tag(name:"insight", value:"The vulnerability is due to incorrect validation of protected or encrypted
email attachments that are Roshal Archive (RAR) format files. An attacker could exploit this vulnerability by
sending an email message that has a crafted RAR file attachment through an affected device.");

  script_tag(name:"impact", value:"A successful exploit could allow the attacker to bypass content filters that
are configured to detect and act upon protected or encrypted email attachments.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-11-20 10:21:00 +0100 (Tue, 20 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-11-03 14:00:33 +0700 (Thu, 03 Nov 2016)");
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
		'9.9.6-026',
		'9.7.1-066',
		'9.7.2-046',
		'9.7.2-047',
		'9.7.2-054',
		'10.0.0-124',
		'10.0.0-125' );

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

