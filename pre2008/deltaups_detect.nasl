# OpenVAS Vulnerability Test
# $Id: deltaups_detect.nasl 7146 2017-09-15 12:38:49Z cfischer $
# Description: Delta UPS Daemon Detection
#
# Authors:
# SecurITeam
#
# Copyright:
# Copyright (C) 2002 SecurITeam
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
 script_oid("1.3.6.1.4.1.25623.1.0.10876");
 script_version("$Revision: 7146 $");
 script_tag(name:"last_modification", value:"$Date: 2017-09-15 14:38:49 +0200 (Fri, 15 Sep 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
 script_name("Delta UPS Daemon Detection");
 script_category(ACT_GATHER_INFO);
 script_copyright("This script is Copyright (C) 2002 SecurITeam");
 script_family("General");
 script_dependencies("find_service2.nasl");
 script_require_ports("Services/delta-ups", 2710);

 script_tag(name : "solution" , value : "Block access to the Delta UPS's daemon on this port");
 script_tag(name : "summary" , value : "The Delta UPS Daemon is running on this server.

 sThis UPS (see: http://www.deltaww.com/) provides a daemon that shows 
 ssensitive information, including:
 OS type and version
 Internal network addresses
 Internal numbers used for pager
 Encrypted password
 Latest event log of the machine");

 script_tag(name:"solution_type", value:"Mitigation");
 script_tag(name:"qod_type", value:"remote_vul");
 exit(0);
}

# Check starts here

function check(req, port)
{

 local_var port;

 soc = open_sock_tcp(port);
 if(soc)
 {

  send(socket:soc, data:req);
  buf = recv(socket:soc, length:4096);

  close(soc);

  if (("DeltaUPS" >< buf) || ("NET01" >< buf) || ("STS00" >< buf) || ("ATZ" >< buf) || ("ATDT" >< buf))
  {
        security_message(port:port);
        return(0);
  }
 }
 return(0);
}

port = get_kb_item("Services/delta-ups");
if(!port)port = 2710;
cginameandpath[0] = string("\n");
cginameandpath[1] = "";

i = 0;
if(get_port_state(port))
{
 for (i = 0; cginameandpath[i]; i = i + 1)
 {
  url = cginameandpath[i];
  if(check(req:url, port:port))exit(0);
 }
}

exit(99);