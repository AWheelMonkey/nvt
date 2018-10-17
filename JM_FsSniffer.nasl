###############################################################################
# OpenVAS Vulnerability Test
# $Id: JM_FsSniffer.nasl 10894 2018-08-10 13:09:25Z cfischer $
#
# FsSniffer Detection
#
# Authors:
# Joseph Mlodzianowski <joseph@rapter.net>
#
# Copyright:
# Copyright (C) 2003 J.Mlodzianowski
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
  script_oid("1.3.6.1.4.1.25623.1.0.11854");
  script_version("$Revision: 10894 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 15:09:25 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("FsSniffer Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2003 J.Mlodzianowski");
  script_family("Malware");
  script_dependencies("find_service2.nasl");
  script_require_ports("Services/RemoteNC");

  script_tag(name:"solution", value:"See www.rapter.net/jm1.htm for details on removal");
  script_tag(name:"impact", value:"An attacker may use it to steal your passwords.");
  script_tag(name:"summary", value:"This host appears to be running FsSniffer on this port.

  FsSniffer is backdoor which allows an intruder to steal
  PoP3/FTP and other passwords you use on your system.");

  script_tag(name:"solution_type", value:"Mitigation");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

port = get_kb_item("Services/RemoteNC");
if( port ) security_message( port:port );
