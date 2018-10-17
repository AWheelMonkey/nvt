# OpenVAS Vulnerability Test
# $Id: hosting_controller.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: Hosting Controller vulnerable ASP pages
#
# Authors:
# John Lampe <j_lampe@bellsouth.net> 
#
# Copyright:
# Copyright (C) 2003 John Lampe
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

tag_summary = "The Hosting Controller application resides on this server.  
This version is vulnerable to multiple remote exploits.  

At attacker may make use of this vulnerability and use it to
gain access to confidential data and/or escalate their privileges
on the Web server.

See http://archives.neohapsis.com/archives/bugtraq/2002-01/0039.html
for more information.";

tag_solution = "remove or update the software.";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.11745");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(3808);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
 script_cve_id("CVE-2002-0466");
 script_name("Hosting Controller vulnerable ASP pages");
 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_active"); 
 script_copyright("This script is Copyright (C) 2003 John Lampe");
 script_family("Web application abuses");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if ( ! can_host_asp(port:port) ) exit(0);

files = make_list( "/statsbrowse.asp", "/servubrowse.asp", "/browsedisk.asp", "/browsewebalizerexe.asp", "/sqlbrowse.asp" );

foreach dir( make_list_unique( "/", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";

  foreach file( files ) {
    if(is_cgi_installed_ka(item:string(dir, file), port:port)) {
      req = http_get(item:dir + file + "?filepath=c:" + raw_string(0x5C,0x26) + "Opt=3", port:port);
      res = http_keepalive_send_recv(port:port, data:req);
      if(res == NULL) continue;
      if ( (egrep(pattern:".*\.BAT.*", string:res)) || (egrep(pattern:".*\.ini.*", string:res)) ) {
        security_message(port);
        exit(0);
      }
    }
  }
}
