###############################################################################
# OpenVAS Vulnerability Test
# $Id: sw_vaadin_xss_vuln3.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# Vaadin Framework < 7.1.11 Multiple Vulnerabilities
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

CPE = 'cpe:/a:vaadin:vaadin';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105184");
  script_version("$Revision: 11872 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-01-22 12:00:00 +0100 (Thu, 22 Jan 2015)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

  script_name("Vaadin Framework < 7.1.11 Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2015 SCHUTZWERK GmbH");
  script_family("Web application abuses");
  script_dependencies("sw_vaadin_detect.nasl");
  script_require_ports("Services/www", 8888);
  script_mandatory_keys("vaadin/installed");

  script_tag(name:"summary", value:"This web application is running with the Vaadin Framework which
  is prone to multiple cross-site scripting issues because the application fails to properly sanitize
  user-supplied input.");
  script_tag(name:"vuldetect", value:"Check the version.");
  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - Proper escaping of the src-attribute on the client side was not ensured when using icons for
  OptionGroup items.

  - The client side Util.getAbsoluteUrl() did not ensure proper escaping of the given URL.");
  script_tag(name:"impact", value:"This could potentially, in certain situations, allow a malicious user
  to inject content, such as javascript, in order to perform a cross-site scripting (XSS) attack.");
  script_tag(name:"affected", value:"Vaadin Framework versions from 7.0.0 up to 7.1.10");
  script_tag(name:"solution", value:"Upgrade to Vaadin Framework version 7.1.11 or later.");

  script_xref(name:"URL", value:"http://www.vaadin.com/download/release/7.1/7.1.11/release-notes.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"http://www.vaadin.com/releases");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"7.0.0", test_version2:"7.1.10" ) ) {

  report = 'Installed version: ' + vers + '\n' +
           'Fixed version:     ' + "7.1.11" + '\n';
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
