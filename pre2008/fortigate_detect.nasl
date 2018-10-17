# OpenVAS Vulnerability Test
# $Id: fortigate_detect.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: Fortinet Fortigate console management detection
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
#

tag_summary = "The remote host appears to be a Fortinet Fortigate Firewall.

Connections are allowed to the web console management.

Letting attackers know that you are using this software will help them 
to focus their attack or will make them change their strategy. In addition
to this, an attacker may set up a brute force attack against the remote
interface.";

tag_solution = "Filter incoming traffic to this port";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.17367");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_tag(name:"cvss_base", value:"0.0");
 
 name = "Fortinet Fortigate console management detection";

 script_name(name);
 

 
 
 
 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
 
 script_copyright("This script is Copyright (C) 2005 David Maciejak");
 
 family = "General";
 script_family(family);
 script_dependencies("http_version.nasl");
 script_require_ports(443);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

#
# The script code starts here
#
include("http_func.inc");

port = 443;

if(get_port_state(port))
{
  req1 = http_get(item:"/system/console?version=1.5", port:port);
  req = http_send_recv(data:req1, port:port);
  #<title>Fortigate Console Access</title>

  if("Fortigate Console Access" >< req)
  {
    log_message(port);
  }
}
