###############################################################################
# OpenVAS Vulnerability Test
# $Id: iwss_detect.nasl 10911 2018-08-10 15:16:34Z cfischer $
#
# Trend Micro IWSS console management detection
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
#
# Copyright:
# Copyright (C) 2005 David Maciejak
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
  script_oid("1.3.6.1.4.1.25623.1.0.17200");
  script_version("$Revision: 10911 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 17:16:34 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("Trend Micro IWSS console management detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2005 David Maciejak");
  script_family("Product detection");
  # nb: Don't add a dependency to http_version.nasl or gb_get_http_banner.nasl to avoid cyclic dependency to embedded_web_server_detect.nasl
  script_dependencies("find_service.nasl", "httpver.nasl");
  script_require_ports("Services/www", 1812);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"solution", value:"Filter incoming traffic to this port");

  script_tag(name:"summary", value:"The remote host appears to run the Trend Micro Interscan Web Security Suite.

Make sure that only authorized hosts can connect to this service, as the information of its existence may help an
attacker to make more sophisticated attacks against the remote network.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:1812 );

rep = http_get_cache( item:"/logon.jsp", port:port );
if( rep == NULL ) exit( 0 );

if( "<title>Trend Micro InterScan Web Security Suite</title>" >< rep ) {
  log_message( port:port );
  set_kb_item( name:"Services/www/" + port + "/embedded", value:TRUE );
}

exit(0);
