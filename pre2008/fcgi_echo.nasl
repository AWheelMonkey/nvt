###############################################################################
# OpenVAS Vulnerability Test
# $Id: fcgi_echo.nasl 10862 2018-08-09 14:51:58Z cfischer $
#
# FastCGI samples Cross Site Scripting
#
# Authors:
# Matt Moore <matt.moore@westpoint.ltd.uk>
#
# Copyright:
# Copyright (C) 2002 Matt Moore
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.10838");
  script_version("$Revision: 10862 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-09 16:51:58 +0200 (Thu, 09 Aug 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("FastCGI samples Cross Site Scripting");
  script_category(ACT_ATTACK);
  script_copyright("This script is Copyright (C) 2002 Matt Moore");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl", "cross_site_scripting.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"solution", value:"Always remove sample applications from production servers.");
  script_tag(name:"summary", value:"Two sample CGI's supplied with FastCGI are vulnerable
  to cross-site scripting attacks. FastCGI is an 'open extension to CGI
  that provides high performance without the limitations of server
  specific APIs', and is included in the default installation of the
  'Unbreakable' Oracle9i Application Server. Various other web servers
  support the FastCGI extensions (Zeus, Pi3Web etc).");
  script_tag(name:"insight", value:"Two sample CGI's are installed with FastCGI, (echo.exe and echo2.exe
  under Windows, echo and echo2 under Unix). Both of these CGI's output
  a list of environment variables and PATH information for various
  applications. They also display any parameters that were provided
  to them. Hence, a cross site scripting attack can be performed via
  a request such as:

  http://www.someserver.com/fcgi-bin/echo2.exe?blah=<SCRIPT>alert(document.domain)</SCRIPT>");

  script_tag(name:"solution_type", value:"Mitigation");
  script_tag(name:"qod", value:"50"); # No extra check, prone to false positives and doesn't match existing qod_types

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );

# Avoid FP against Compaq Web Management or HTTP proxy
host = http_host_name( dont_add_port:TRUE );
if( get_http_has_generic_xss( port:port, host:host ) ) exit( 0 );

files = make_list( "echo", "echo.exe", "echo2", "echo2.exe" );

foreach file( files ) {

  url = "/fcgi-bin/" + file + "?foo=<SCRIPT>alert(document.domain)</SCRIPT>";
  req = http_get( item:url, port:port );
  res = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );
  if( isnull( res ) ) continue;

  if( res =~ "^HTTP/1\.[01] 200" && "<SCRIPT>alert(document.domain)</SCRIPT>" >< res ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );