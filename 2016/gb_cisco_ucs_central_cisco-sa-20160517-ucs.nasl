###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ucs_central_cisco-sa-20160517-ucs.nasl 12363 2018-11-15 09:51:15Z asteins $
#
# Cisco Unified Computing System Central Cross-Site Scripting Vulnerability
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

CPE = "cpe:/a:cisco:ucs_central_software";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105724");
  script_cve_id("CVE-2016-1401");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_version("$Revision: 12363 $");

  script_name("Cisco Unified Computing System Central Cross-Site Scripting Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160517-ucs");

  script_tag(name:"impact", value:"An attacker could exploit this vulnerability by convincing a user to click a specific link. A successful exploit could allow the attacker to submit arbitrary requests to the affected system via a web browser with the privileges of the user.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The vulnerability is due to insufficient input validation of a user-supplied value. ");
  script_tag(name:"solution", value:"Update to 1.4(1b) or newer");
  script_tag(name:"summary", value:"A vulnerability in the HTTP web-based management interface of Cisco Unified Computing System (UCS) Central Software could allow an unauthenticated, remote attacker to conduct a cross-site scripting (XSS) attack against a user of the web interface of the affected system.");
  script_tag(name:"affected", value:"Cisco UCS Central Software Release 1.4(1a) is vulnerable.");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"last_modification", value:"$Date: 2018-11-15 10:51:15 +0100 (Thu, 15 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-05-18 09:41:46 +0200 (Wed, 18 May 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_ucs_central_version.nasl");
  script_mandatory_keys("cisco_ucs_central/version");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

# example: 1.4(1a).
if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

if( version == "1.4(1a)" )
{
  report = report_fixed_ver(  installed_version:version, fixed_version:"1.4(1b)" );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

