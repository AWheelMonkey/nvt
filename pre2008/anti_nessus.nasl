###############################################################################
# OpenVAS Vulnerability Test
# $Id: anti_nessus.nasl 10818 2018-08-07 14:03:55Z cfischer $
#
# Anti OpenVAS defenses
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
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.11238");
  script_version("$Revision: 10818 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-07 16:03:55 +0200 (Tue, 07 Aug 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("Anti OpenVAS defenses");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2003 Michel Arboi");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "httpver.nasl", "no404.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"solution", value:"Change your configuration if you want accurate audit results.");

  script_tag(name:"summary", value:"It seems that your web server rejects requests
  from the Scanner. It is probably protected by a reverse proxy.");

  script_tag(name:"qod_type", value:"remote_analysis");

  exit(0);
}

include("global_settings.inc");
include("http_func.inc");
#include("http_keepalive.inc");
include("misc_func.inc");

port = get_http_port(default:80);
host = http_host_name(dont_add_port:TRUE);
no404 = get_http_no404_string(port:port, host:host);

rep = "It seems that your web server rejects requests from the Scanner. It is probably protected by a reverse proxy.";

if( no404 ) {
  rep += '\nHowever, the way the filter is implemented, it may in fact help a script kiddy that uses the Scanner to scan your system.\n\n';
  rep += 'Solution: change your configuration if you want accurate audit results and a better protection.';
} else
  rep += '\n\n Solution: change your configuration if you want accurate audit results.';

u = string("/OpenVASTest", rand(), ".html");
r = http_get(port: port, item: u);

c1 = http_send_recv(port:port, data:r);
if( c1 == NULL ) exit(0);
x1 = ereg_replace(pattern:"^HTTP/[0-9]\.[0-9] ([0-9][0-9][0-9]) .*$",
		string:c1, replace: "\1");
if (c1 == x1) x1 = "";

u = string("/", rand_str(), ".html");
r = http_get(port: port, item: u);

c2 = http_send_recv(port:port, data:r);
if(c2 == NULL)exit(0);
x2 = ereg_replace(pattern:"^HTTP/[0-9]\.[0-9] ([0-9][0-9][0-9]) .*$",
		string:c2, replace: "\1");
if (c2 == x2) x2 = "";

if (x1 != x2)
{
  log_message(port: port, data: rep);
  set_kb_item(name: string("www/anti-OpenVAS/",port,"/rand-url"), value: TRUE);
  exit(0);
}


r = http_get(port: port, item: "/");
c1 = http_send_recv(port:port, data:r);
if(c1 == NULL)exit(0);
# Extract the HTTP code
c1 = egrep(pattern:"^HTTP/[0-9]\.[0-9] [0-9]* .*", string:c1);
x1 = ereg_replace(pattern:"^HTTP/[0-9]\.[0-9] ([0-9][0-9][0-9]) .*$",
		string:c1, replace: "\1");
if (c1 == x1) x1 = "";

#ua = '\nUser-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.3.1) Gecko/20030425\r\n';
ua = '\nUser-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)\r\n';

r2 = ereg_replace(string: r, pattern: '\nUser-Agent:[^\r]*OpenVAS[^\r]*\r\n', replace: ua);
if (r == r2) exit(0);	# Cannot test

c2 = http_send_recv(port:port, data:r2);
if(c2 == NULL)exit(0);
# Extract the HTTP code
c2 = egrep(pattern:"^HTTP/[0-9]\.[0-9] [0-9]* .*", string:c2);
x2 = ereg_replace(pattern:"^HTTP/[0-9]\.[0-9] ([0-9][0-9][0-9]) .*$",
		string:c2, replace: "\1");
if (c2 == x2) x2 = "";

if (x1 != x2)
{
  log_message(port: port, data: rep);
  set_kb_item(name: string("www/anti-OpenVAS/",port,"/user-agent"),value: ua);
  exit(0);
}
