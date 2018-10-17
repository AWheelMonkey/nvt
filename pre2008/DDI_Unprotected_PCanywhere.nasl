# OpenVAS Vulnerability Test
# $Id: DDI_Unprotected_PCanywhere.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: Unprotected PC Anywhere Service
#
# Authors:
# H D Moore
#
# Copyright:
# Copyright (C) 2002 Digital Defense Incorporated
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

tag_summary = "The PC Anywhere service does not require a password to access
the desktop of this system. If this machine is running Windows 95,
98, or ME, gaining full control of the machine is trivial. If
this system is running NT or 2000 and is currently logged out, an
attacker can still spy on and hijack a legitimate user's session when
they login.";

tag_solution = "1. Open the PC Anywhere application as an Administrator. 
2. Right click on the Host object you are using and select Properties.
3. Select the Caller Access tab. 
4. Switch the authentication type to Windows or PC Anywhere.
5. If you are using PC Anywhere authentication, set a strong password.";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.10798");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_tag(name:"cvss_base", value:"4.6");
 script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-1999-0508");
 name = "Unprotected PC Anywhere Service";
 script_name(name);


 
 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_active");
 
 script_copyright("This script is Copyright (C) 2002 Digital Defense Incorporated");
 family = "General";
 script_family(family);
 script_dependencies("find_service.nasl", "PC_anywhere_tcp.nasl");
 script_require_ports("Services/pcanywheredata", 5631);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

#
# The script code starts here
#

debug = 0;

cl[0] = raw_string (0x00, 0x00, 0x00, 0x00);
sv[0] = "nter";

cl[1] = raw_string (0x6f, 0x06, 0xff);
sv[1] = raw_string (0x1b, 0x61);

cl[2] = raw_string (0x6f, 0x61, 0x00, 0x09, 0x00, 0xfe, 0x00,
                    0x00, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00);
                            
sv[2] = raw_string (0x1b, 0x62);

cl[3] = raw_string (0x6f, 0x62, 0x01, 0x02, 0x00, 0x00, 0x00);         
sv[3] = raw_string (0x65, 0x6e);

cl[4] = raw_string(0x6f, 0x49, 0x00, 0x4c, 0x20, 0x20, 0x20, 0x20,
                   0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00,
                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                   0x00, 0x00, 0x1f, 0x00, 0x00, 0x00, 0x00, 0x00,
                   0x00, 0x00, 0x09, 0xff, 0x05, 0x00, 0x00, 0x00,
                   0x60, 0x24, 0x00, 0x09, 0x00, 0x00, 0x00, 0x06,
                   0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41,
                   0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                   0x31);
sv[4] = raw_string(0x1b, 0x16);

cl[5] = raw_string(0x6f, 0x73, 0x02, 0x01, 0x00, 0x02);
sv[5] = "Service Pack";

port = get_kb_item("Services/pcanywheredata");
if(!port)port = 5631;

if(get_port_state(port))
{
    soc = open_sock_tcp(port);
    if(soc)
    {

        for(d=0;cl[d];d=d+1)
        {
            if(debug)display(":: entering level ", d, "\n");
            send(socket:soc, data:cl[d]);
            r  = recv(socket:soc, length:2048);
	    if(!r)exit(0);
            
            # no minimum encryption level set
            if(d == 2)
            {
                if(("Reducing" >< r) && ("encryption" >< r))
                {
                    if(debug)display("Warning: no minimum encryption level set.\n");
                }
                if(("denying" >< r) && ("cannot connect at level" >< r))
                {
                   if(debug)display("Warning: plugin exiting because a minimum encryption level has been set.\n");
                   exit(0);                   
                }
            }
            
            # user authentication
            if(d == 3)
            {
                if(("Enter user name" >< r) || ("Enter login name" >< r))
                {
                    if(debug)display("Warning: plugin exiting because user authentication needed.\n");
                    exit(0); 
                }
            }
                       
            if(! sv[d] >< r)
            {
            
                close(soc);
                if(debug)display("exiting at level ", d, "\n");
                exit(0);
            }
        }
        security_message(port:port);
	close(soc);
    }
}
