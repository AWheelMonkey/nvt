###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_csm_default_web_credentials.nasl 11492 2018-09-20 08:38:50Z mmartin $
#
# Cisco Content Security Management Appliance Web Interface Default Credentials
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105435");
  script_version("$Revision: 11492 $");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Cisco Content Security Management Appliance Web Interface Default Credentials");
  script_tag(name:"last_modification", value:"$Date: 2018-09-20 10:38:50 +0200 (Thu, 20 Sep 2018) $");
  script_tag(name:"creation_date", value:"2015-11-06 14:06:55 +0100 (Fri, 06 Nov 2015)");
  script_category(ACT_ATTACK);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_ironport_csma_detect.nasl");
  script_require_ports("Services/www", 443);
  script_mandatory_keys("cisco_csm/http/cookie", "cisco_csm/http/port");

  script_tag(name:"summary", value:'The remote Cisco Content Security Management Appliance Web Interface is prone to a default account authentication bypass vulnerability.');

  script_tag(name:"impact", value:'This issue may be exploited by a remote attacker to gain access to sensitive information or modify system configuration.');

  script_tag(name:"vuldetect", value:'Try to login with default credentials.');

  script_tag(name:"insight", value:'It was possible to login with default credentials: admin/ironport');

  script_tag(name:"solution", value:'Change the password.');

  script_tag(name:"solution_type", value:"Workaround");
  script_tag(name:"qod_type", value:"exploit");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

if( ! port = get_kb_item( "cisco_csm/http/port" ) ) exit( 0 );
if( ! cookie = get_kb_item( "cisco_csm/http/cookie" ) ) exit( 0 );

postdata = 'action=Login&referrer=&screen=login&username=admin&password=ironport';
len = strlen( postdata );

url = "/login";

host = http_host_name( port:port );
useragent = get_http_user_agent();

req = 'POST ' + url + ' HTTP/1.1\r\n' +
      'Connection: Close\r\n' +
      'Host: ' + host + '\r\n' +
      'Pragma: no-cache\r\n' +
      'Cache-Control: no-cache\r\n' +
      'User-Agent: ' + useragent + '\r\n' +
      'Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, image/png, */*\r\n' +
      'Accept-Language: en\r\n' +
      'Accept-Encoding: identify\r\n' +
      'DNT: 1\r\n' +
      'Cookie: ' + cookie + '\r\n' +
      'Accept-Charset: iso-8859-1,*,utf-8\r\n' +
      'X-Requested-With: XMLHttpRequest\r\n' +
      'Content-Type: application/x-www-form-urlencoded; charset=UTF-8\r\n' +
      'Content-Length: ' + len + '\r\n' +
      '\r\n' +
      postdata;
res = http_keepalive_send_recv( port:port, data:req );

if( "authenticated" >!< res ) exit( 99 );

ac = eregmatch( pattern:'Set-Cookie: (authenticated=[^;]+;)', string:res );
if( isnull( ac[1] ) ) exit( 0 );

cookie = ac[1] + cookie;

if( http_vuln_check( port:port, url:'/services/system_status', pattern:"action=Logout", extra_check:make_list("System Status","Logged in as"), cookie:cookie ) ) {
  report = report_vuln_url( port:port, url:url );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
