# OpenVAS Vulnerability Test
# $Id: cp-firewall-auth.nasl 11885 2018-10-12 13:47:20Z cfischer $
# Description: CheckPoint Firewall-1 Telnet Authentication Detection
#
# Authors:
# Yoav Goldberg <yoavg@securiteam.com>
# (rd: description re-phrased)
#
# Copyright:
# Copyright (C) 2001 SecuriTeam
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


if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.10675");
  script_version("$Revision: 11885 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 15:47:20 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("CheckPoint Firewall-1 Telnet Authentication Detection");


  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Firewalls");
  script_copyright("This script is Copyright (C) 2001 SecuriTeam");
  script_dependencies("find_service.nasl");
  script_require_ports(259);
  script_tag(name:"solution", value:"if you do not use this service, disable it.");
  script_tag(name:"solution_type", value:"Mitigation");
  script_tag(name:"summary", value:"A Firewall-1 Client Authentication Server is running on this port.

Such an element allows an intruder to attempt to log into
the remote network or to gather a list of valid user names
by a brute-force attack.");
  exit(0);
}

#
# Actual script starts here
#
include("telnet_func.inc");

port = 259;
if(get_port_state(259))
{
 data = get_telnet_banner(port: 259);
 if(data)
 {
  if("Check Point FireWall-1 Client Authentication Server running on" >< data)
  	security_message(259);
 }
}

