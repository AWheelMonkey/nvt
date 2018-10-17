###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sanyo_network_camera_default_credentials.nasl 11356 2018-09-12 10:46:43Z tpassfeld $
#
# Sanyo Network Camera Default Credentials
#
# Authors:
# Thorsten Passfeld <thorsten.passfeld@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, https://www.greenbone.net
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

if( description )
{
  script_oid("1.3.6.1.4.1.25623.1.0.114021");
  script_version("$Revision: 11356 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-12 12:46:43 +0200 (Wed, 12 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-08-15 14:08:31 +0200 (Wed, 15 Aug 2018)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_tag(name:"qod_type", value:"remote_vul");

  script_tag(name:"solution_type", value:"Mitigation");

  script_name("Sanyo Network Camera Default Credentials");

  script_category(ACT_ATTACK);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Default Accounts");
  script_dependencies("gb_sanyo_network_camera_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("sanyo/network_camera/detected");

  script_tag(name:"summary", value:"Sanyo network cameras use the default credentials admin:admin.");
  script_tag(name:"vuldetect", value:"Tries to login using default credentials.");
  script_tag(name:"affected", value:"All Sanyo cameras using this web interface.");
  script_tag(name:"solution", value:"Change the default password.");

  script_xref(name:"URL", value:"https://ipvm.com/reports/ip-cameras-default-passwords-directory");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");

CPE = "cpe:/h:sanyo:network_camera";

if(!port = get_app_port(cpe: CPE)) exit(0);

username = "admin";
password = "admin";

auth_header = make_array("Authorization", "Basic " + base64(str: username + ":" + password));
req = http_get_req(port: port, url: "/", add_headers: auth_header);
res = http_keepalive_send_recv(port: port, data: req);

if(('<IMG src="../img/SANYO_lan.gif"></TD>' >< res && "<TITLE>SANYO  NETWORK CAMERA</TITLE>" >< res)
    || 'top.window.location.replace("/cgi-bin/lang.cgi");' >< res) {
  report = 'It was possible to login using the username "' + username + '" and the password "' + password + '".';

  #Version detection with authorization
  session = eregmatch(pattern: "NOBSESS=([0-9a-zA-z]+)", string: res);

  sessionCookie = session[0];
  versionUrl = "/cgi-bin/option.cgi";

  #Some versions do not expect or send you a session cookie
  if(sessionCookie) {
    req = http_get_req(port: port,
                       url: versionUrl,
                       add_headers: make_array("Authorization", "Basic " + base64(str: username + ":" + password) + "=",
                                               "Cookie", sessionCookie));
  }
  else {
    req = http_get_req(port: port,
                       url: versionUrl,
                       add_headers: make_array("Authorization", "Basic " + base64(str: username + ":" + password) + "="));
  }

  res = http_keepalive_send_recv(port: port, data: req);

  #MAIN Ver. 2.03-02 || CAM MAIN Ver. 2.03-06
  #SUB Ver. 1.01-00  || CAM SUB Ver. 1.01-00
  mainVer = eregmatch(pattern: "(CAM)?\s*MAIN\s*Ver.\s*([0-9.-]+)", string: res);
  subVer = eregmatch(pattern: "(CAM)?\s*SUB\s*Ver.\s*([0-9.-]+)", string: res);

  if(mainVer[2]) set_kb_item(name: "sanyo/network_camera/main/version", value: mainVer[2]);
  if(subVer[2])  set_kb_item(name: "sanyo/network_camera/sub/version", value: subVer[2]);

  security_message(data: report, port: port);
  exit(0);
}

exit(99);
