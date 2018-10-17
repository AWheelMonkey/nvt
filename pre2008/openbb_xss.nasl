###############################################################################
# OpenVAS Vulnerability Test
# $Id: openbb_xss.nasl 10862 2018-08-09 14:51:58Z cfischer $
#
# OpenBB XSS
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
# based on work from (C) Tenable Network Security
#
# Copyright:
# Copyright (C) 2004 David Maciejak
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

#  Ref: gr00vy <groovy2600@yahoo.com.ar>

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.14822");
 script_version("$Revision: 10862 $");
 script_tag(name:"last_modification", value:"$Date: 2018-08-09 16:51:58 +0200 (Thu, 09 Aug 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(9303);
 script_xref(name:"OSVDB", value:"3220");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
 script_name("OpenBB XSS");
 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_active");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2004 David Maciejak");
 script_dependencies("find_service.nasl", "http_version.nasl", "cross_site_scripting.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name:"solution", value:"Upgrade to the latest version of this software.");
 script_tag(name:"summary", value:"The remote host seems to be running OpenBB, a forum management system written
in PHP.

The remote version of this software is vulnerable to cross-site scripting
attacks, through the script 'board.php'.

Using a specially crafted URL, an attacker can cause arbitrary code execution
for third party users, thus resulting in a loss of integrity of their system.");

 script_tag(name:"solution_type", value:"VendorFix");

 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

host = http_host_name( dont_add_port:TRUE );
if( get_http_has_generic_xss( port:port, host:host ) ) exit( 0 );

foreach dir( make_list_unique( "/openbb", cgi_dirs( port:port ) ) ) {

 if( dir == "/" ) dir = "";
 req = http_get(item:string(dir, "/board.php?FID=%3Cscript%3Efoo%3C/script%3E"), port:port);
 res = http_keepalive_send_recv(port:port, data:req);
 if( isnull( res ) ) continue;
 if(res =~ "^HTTP/1\.[01] 200" && egrep(pattern:"<script>foo</script>", string:res)) {
   security_message(port);
   exit(0);
 }
}

exit( 99 );