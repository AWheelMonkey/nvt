###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_unprotected_belkin_2307.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# Belkin 2307 Unprotected Web Console
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.103704");
  script_version("$Revision: 11865 $");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_name("Belkin 2307 Unprotected Web Console");

  script_xref(name:"URL", value:"http://www.belkin.com");

  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-04-23 12:01:48 +0100 (Tue, 23 Apr 2013)");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"solution", value:"Set a password.");
  script_tag(name:"solution_type", value:"Workaround");
  script_tag(name:"summary", value:"The remote Belkin 2307 Web Console is not protected by a password.");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 80);

url = '/login.html';
res = http_get(item:url, port:port);

if( 'content="Belkin 2307"' >< res ) {

  useragent = get_http_user_agent();
  host = http_host_name(port:port);
  login = "page=&logout=&action=submit&pws=&itsbutton1=Absenden&h_language=de&is_parent_window=1";
  len = strlen(login);

  req = string("POST /login.cgi HTTP/1.1\r\n",
               "Host: ", host,"\r\n",
               "User-Agent: ", useragent, "\r\n",
               "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n",
               "Accept-Language: de-de,de;q=0.8,en-us;q=0.5,en;q=0.3\r\n",
               "Accept-Encoding: identity\r\n",
               "DNT: 1\r\n",
               "Connection: keep-alive\r\n",
               "Referer: http://",host,"/login.html\r\n",
               "Content-Type: application/x-www-form-urlencoded\r\n",
               "Content-Length: ", len,"\r\n",
               "\r\n",
               login);

  result = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);
  if(result !~ "HTTP/1.. 200")exit(99);

  url = '/ut_sys.html';

  req = http_get(item:url, port:port);
  buf = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);

  if("sysPasswd" >< buf && "sysConfirmPasswd" >< buf && "userOldPswd" >< buf) {
    security_message(port:port);
    exit(0);
  }

  exit(99);

}

exit(0);
