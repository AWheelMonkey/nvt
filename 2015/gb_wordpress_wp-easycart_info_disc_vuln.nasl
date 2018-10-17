###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_wp-easycart_info_disc_vuln.nasl 11452 2018-09-18 11:24:16Z mmartin $
#
# Wordpress EasyCart Information Disclosure Vulnerability
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.805124");
  script_version("$Revision: 11452 $");
  script_cve_id("CVE-2014-4942");
  script_bugtraq_id(68692);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-18 13:24:16 +0200 (Tue, 18 Sep 2018) $");
  script_tag(name:"creation_date", value:"2015-01-13 12:25:08 +0530 (Tue, 13 Jan 2015)");
  script_name("Wordpress EasyCart Information Disclosure Vulnerability");

  script_tag(name:"summary", value:"This host is installed with Wordpress
  EasyCart and is prone to information disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Send a crafted data via HTTP GET request
  and check whether it is able to read system info or not.");

  script_tag(name:"insight", value:"Flaw is due to improper handling of a
  direct request for the /inc/admin/phpinfo.php script.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to disclose detailed system information.");

  script_tag(name:"affected", value:"Wordpress EasyCart version 2.0.1
  through 2.0.5");

  script_tag(name:"solution", value:"Upgrade to version 2.0.6 or higher,
  For updates refer https://wordpress.org/plugins/wp-easycart");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://codevigilant.com/disclosure/wp-plugin-wp-easycart-information-disclosure");

  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

url = dir + '/wp-content/plugins/wp-easycart/inc/admin/phpinfo.php';

if(http_vuln_check(port:http_port, url:url, check_header:TRUE,
  pattern:">phpinfo\(\)<", extra_check:make_list(">System", ">Configuration File")))
{
  security_message(port:http_port);
  exit(0);
}
