# OpenVAS Vulnerability Test
# $Id: sgi_rpc_passwd.nasl 9349 2018-04-06 07:02:25Z cfischer $
# Description: irix rpc.passwd overflow
#
# Authors:
# Renaud Deraison <deraison@cvs.nessus.org>
#
# Copyright:
# Copyright (C) 2002 Renaud Deraison
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

tag_summary = "The remote RPC service 100009 (yppasswdd) is vulnerable
to a buffer overflow which allows any user to obtain a root
shell on this host.";

tag_solution = "disable this service if you don't use
it, or see SGI advisory #20020601-01-P";

# This is *NOT* the issue described in CVE-2002-0357, which happens
# to be a logic error for which details have not been leaked at all.

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.80034");
 script_version("$Revision: 9349 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:02:25 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2008-10-24 20:15:31 +0200 (Fri, 24 Oct 2008)");
 script_bugtraq_id(4939);
 script_cve_id("CVE-2002-0357");
 script_xref(name:"OSVDB", value:"834");
 
 script_tag(name:"cvss_base", value:"7.2");
 script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");

 
 name = "irix rpc.passwd overflow";
 
 script_name(name);
 
 
 script_category(ACT_DENIAL);
  script_tag(name:"qod_type", value:"remote_vul"); 
 
 script_copyright("This script is Copyright (C) 2002 Renaud Deraison");
 family = "Gain a shell remotely";
 script_family(family);
 script_dependencies("secpod_rpc_portmap.nasl", "yppasswdd.nasl");
 script_require_keys("rpc/portmap");
 script_exclude_keys("rpc/yppasswd/sun_overflow");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("misc_func.inc");
include("byte_func.inc");

n = get_kb_item("rpc/yppasswd/sun_overflow");
if(n)exit(0);


function ping(len, soc)
{
 crp = crap(len-4);
    
    len_hi = len / 256;
    len_lo = len % 256;
    
    req = raw_string(0x56, 0x6C, 0x9F, 0x6B, 
    		     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02,
		     0x00, 0x01, 0x86, 0xA9, 0x00, 0x00, 0x00, 0x01,
		     0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,
		     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		     0x00, 0x00, len_hi, len_lo, 0x80, 0x1C, 0x40, 0x11
		     ) + crp + raw_string(0x00, 0x00, 0x00, 0x02,
		     0x61, 0x61, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03,
		     0x61, 0x61, 0x61, 0x00, 0x00, 0x00, 0x00, 0x03,
		     0x61, 0x61, 0x61, 0x00, 0x00, 0x00, 0x00, 0x02,
		     0x61, 0x61, 0x00, 0x00);
     send(socket:soc, data:req);
     r = recv(socket:soc, length:28);
     if(strlen(r) > 1)return(1);
     else return(0);
}

port = get_rpc_port(program:100009, protocol:IPPROTO_UDP);
if(port)
{
  if(get_port_state(port))
  {
   soc = open_sock_udp(port);
   if(soc)
   {
    #
    # We forge a bogus RPC request, with a way too long
    # argument. The remote process will die immediately,
    # and hopefully painlessly.
    #
    p1 = ping(len:80, soc:soc);
    if(p1)
    {
     p2 = ping(len:4000, soc:soc);
     if(!p2)
     {
      p3 = ping(len:80, soc:soc);
      if(!p3)security_message(port:port, protocol:"udp");
     }
     }
   }
  }
}
