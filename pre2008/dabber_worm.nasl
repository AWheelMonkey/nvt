# OpenVAS Vulnerability Test
# $Id: dabber_worm.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: Dabber worm detection
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
#
# Copyright:
# Copyright (C) 2004 David Maciejak
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

tag_summary = "W32.Dabber propagates by exploiting a vulnerability in the FTP server 
component of W32.Sasser.Worm and its variants.
It installs a backdoor on infected hosts and tries to listen on port 9898.
If the attempt fails, W32Dabber.A tries to listen on ports 9899 through 9999 
in sequence until it finds an open port.";

tag_solution = "- Disable access to port 445 and Dabber remote shell by using a firewall
- Apply Microsoft MS04-011 patch
- Update your virus definitions";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.12266");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_tag(name:"cvss_base", value:"8.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:C");
 name = "Dabber worm detection";
 script_name(name);
 

 
 
 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_vul");
 
 script_copyright("This script is Copyright (C) 2004 David Maciejak");
 family = "Malware";
 script_family(family);
 script_dependencies("find_service2.nasl");
 script_require_ports(5554);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://securityresponse.symantec.com/avcenter/venc/data/w32.dabber.b.html");
 script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/MS04-011.mspx");
 exit(0);
}

#
# The script code starts here
#
sasser_port = 5554;    
dabber_ports = make_list();

for ( port = 9898 ; port <= 9999 ; port ++ ) 
{
	dabber_ports = make_list(dabber_ports, port);
}

if (get_port_state(sasser_port))
{
	if (open_sock_tcp(sasser_port)) 
	{		
		foreach port (dabber_ports)
		{
			if (get_port_state(port)) 
			{	
				soc=open_sock_tcp(port);
				if (soc)
				{
					buf = string("C");
					send(socket:soc, data:buf);
					data_root = recv(socket:soc, length:2048);
				        close(soc);

					if(data_root)
  					{
						security_message(port);
					}
				}
			}
		}
	}
}
exit(0);
