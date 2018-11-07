###############################################################################
# OpenVAS Vulnerability Test
# $Id: echo_udp.nasl 12037 2018-10-23 12:45:32Z cfischer $
#
# echo Service Detection (UDP)
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.108102");
  script_version("$Revision: 12037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-23 14:45:32 +0200 (Tue, 23 Oct 2018) $");
  script_tag(name:"creation_date", value:"2009-03-24 15:43:44 +0100 (Tue, 24 Mar 2009)");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("echo Service Detection (UDP)");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Service detection");
  script_require_udp_ports("Services/udp/echo", 7);

  script_tag(name:"summary", value:"Checks if the remote host is running an echo service via UDP.

  Note: The reporting takes place in a separate VT 'echo Service Reporting (TCP + UDP)' (OID: 1.3.6.1.4.1.25623.1.0.100075).");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("misc_func.inc");

port = get_kb_item( "Services/udp/echo" );
if( ! port ) port = 7;
if( ! get_udp_port_state( port ) ) exit( 0 );

soc = open_sock_udp( port );
if( ! soc ) exit( 0 );

echo_string = vtstrings["default"] + "-Echo-Test";

send( socket:soc, data:echo_string );
buf = recv( socket:soc, length:512 );
close( soc );

if( buf == echo_string ) {
  register_service( port:port, proto:"echo", ipproto:"udp" );
  set_kb_item( name:"echo_tcp_udp/detected", value:TRUE );
  set_kb_item( name:"echo_udp/detected", value:TRUE );
  set_kb_item( name:"echo_udp/" + port + "/detected", value:TRUE );
  log_message( port:port, data:"An echo service is running at this port.", protocol:"udp" );
}

exit( 0 );