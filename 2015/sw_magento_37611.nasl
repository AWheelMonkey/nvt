###############################################################################
# OpenVAS Vulnerability Test
# $Id: sw_magento_37611.nasl 12106 2018-10-26 06:33:36Z cfischer $
#
# Magento Multiple HTML Injection Vulnerabilities
#
# Authors:
# Christian Fischer <info@schutzwerk.com>
#
# Copyright:
# Copyright (c) 2015 SCHUTZWERK GmbH
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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

CPE = 'cpe:/a:magentocommerce:magento';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105225");
  script_version("$Revision: 12106 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 08:33:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-02-23 12:00:00 +0100 (Mon, 23 Feb 2015)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_bugtraq_id(37611);
  script_name("Magento Multiple HTML Injection Vulnerabilities");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2015 SCHUTZWERK GmbH");
  script_family("Web application abuses");
  script_dependencies("sw_magento_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("magento/installed");

  script_tag(name:"summary", value:"This host is running with Magento which is prone to multiple HTML injection
  vulnerabilities because it fails to properly sanitize user-supplied input.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"impact", value:"Attacker-supplied HTML or JavaScript code could run in the context of the
  affected site, potentially allowing the attacker to steal cookie-based authentication
  credentials and to control how the site is rendered to the user. Other attacks are also possible.");
  script_tag(name:"affected", value:"Magento 1.3.2.4 is vulnerable. Other versions may also be affected.");
  script_tag(name:"solution", value:"Check for updated versions of Magento");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/37611");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less_equal( version:vers, test_version:"1.3.2.4" ) ) {
  security_message( port:port );
  exit( 0 );
}

exit( 99 );
