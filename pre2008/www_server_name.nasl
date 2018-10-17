# OpenVAS Vulnerability Test
# $Id: www_server_name.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: Hidden WWW server name
#
# Authors:
# Michel Arboi <arboi@alussinan.org>
#
# Copyright:
# Copyright (C) 2003 Michel Arboi
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

tag_summary = "It seems that your web server tries to hide its version 
or name, which is a good thing.
However, using a special crafted request, OpenVAS was able 
to discover it.";

tag_solution = "Fix your configuration.";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.11239");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_tag(name:"cvss_base", value:"0.0");
 name = "Hidden WWW server name";
 script_name(name);
 

 
 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_analysis"); 
 
 script_copyright("This script is Copyright (C) 2003 Michel Arboi");
 family = "Web Servers";
 script_family(family);
 script_dependencies("find_service.nasl","httpver.nasl");
 script_require_ports("Services/www", 80);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

#

include("http_func.inc");

port = get_http_port(default:80);

if (! get_port_state(port)) exit(0);
if (  get_kb_item("Services/www/" + port + "/embedded") ) exit(0);


s = http_open_socket(port);
if(! s) exit(0);

r = http_get(port: port, item: "/");
send(socket: s, data: r);

r = http_recv_headers2(socket:s);
http_close_socket(s);

# If anybody can get the server name, exit
srv = string("^Server: *[^ \t\n\r]");
if (egrep(string: r, pattern: srv)) exit(0);

i = 0;
req[i] = string("HELP\r\n\r\n"); i=i+1;
req[i] = string("HEAD / \r\n\r\n"); i=i+1;
req[i] = string("HEAD / HTTP/1.0\r\n\r\n"); i=i+1;
req[i] = string("HEAD / HTTP/1.1\r\nHost: ", get_host_name(), "\r\n\r\n"); i=i+1;

for (i = 0; req[i]; i=i+1)
{
  s = http_open_socket(port);
  if (s)
  {
    send(socket: s, data: req[i]);
    r = http_recv_headers2(socket:s);
    http_close_socket(s);
    if (strlen(r) && (s1 = egrep(string: r, pattern: srv)))
    {
     s1 -= '\r\n'; s1 -= 'Server:';
     rep = "
It seems that your web server tries to hide its version 
or name, which is a good thing.
However, using a special crafted request, OpenVAS was able 
to determine that is is running : 
" + s1 + "

Solution: Fix your configuration.";

      log_message(port:port, data:rep);
      # We check before: creating a list is not a good idea
      sb = string("www/banner/", port);
      if (! get_kb_item(sb))
	{
        	replace_kb_item(name: sb, value: r);
	}
      else
      {
        sb = string("www/alt-banner/", port);
        if (! get_kb_item(sb))
          set_kb_item(name: sb, value: r);
      }
      exit(0);
    }
  }
}
