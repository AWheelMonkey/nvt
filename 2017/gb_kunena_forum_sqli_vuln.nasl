###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_kunena_forum_sqli_vuln.nasl 11474 2018-09-19 11:38:50Z mmartin $
#
# Kunena Forum Extension 'CVE-2009-4550' SQL Injection Vulnerability
#
# Authors:
# Christian Fischer <christian.fischer@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:kunena:kunena";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.108108");
  script_version("$Revision: 11474 $");
  script_cve_id("CVE-2009-4550");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-19 13:38:50 +0200 (Wed, 19 Sep 2018) $");
  script_tag(name:"creation_date", value:"2017-03-23 09:57:33 +0100 (Thu, 23 Mar 2017)");
  script_name("Kunena Forum Extension 'CVE-2009-4550' SQL Injection Vulnerability");
  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_kunena_forum_detect.nasl");
  script_mandatory_keys("kunena_forum/installed");
  script_require_ports("Services/www", 80);

  script_tag(name:"summary", value:"This host is installed with the Kunena Forum Extension for Joomla
  and is prone to a SQL injection vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"impact", value:"Successfully exploitation will allow remote
  attacker to compromise the application, access or modify data, or exploit latent vulnerabilities
  in the underlying database.");

  script_tag(name:"affected", value:"Kunena Forum Extension version 1.5.3 and 1.5.4 .");

  script_tag(name:"solution", value:"Update the Kunena Forum Extension to version 1.5.5 or higher.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"1.5.3", test_version2:"1.5.4" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"1.5.5" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
