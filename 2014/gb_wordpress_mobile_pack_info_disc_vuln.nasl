###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_mobile_pack_info_disc_vuln.nasl 11867 2018-10-12 10:48:11Z cfischer $
#
# WordPress Mobile Pack Plugin Information Disclosure Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.804838");
  script_version("$Revision: 11867 $");
  script_cve_id("CVE-2014-5337");
  script_bugtraq_id(69292);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-09-09 14:31:29 +0530 (Tue, 09 Sep 2014)");

  script_name("WordPress Mobile Pack Plugin Information Disclosure Vulnerability");

  script_tag(name:"summary", value:"This host is installed with WordPress
  Mobile Pack Plugin and is prone to information disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Send the crafted HTTP GET request and
  check is it possible to read the password protected posts.");

  script_tag(name:"insight", value:"The flaw is due to an error in the
  export/content.php script which does not restrict access to password
  protected posts.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  attackers to bypass certain security restrictions and read password protected
  posts containing valuable information.");

  script_tag(name:"affected", value:"WordPress Mobile Pack plugin
  version  2.0.1 and earlier.");

  script_tag(name:"solution", value:"Upgrade to version 2.0.2 or later.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://packetstormsecurity.com/files/127949");
  script_xref(name:"URL", value:"http://wordpress.org/plugins/wordpress-mobile-pack/changelog");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_family("Web application abuses");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

url = dir + "/wp-content/plugins/wordpress-mobile-pack/export/content.p" +
            "hp?content=exportarticles&callback=x";

if(http_vuln_check(port:http_port, url:url, check_header:TRUE,
   pattern:"x\(.*id.*title.*author.*date.*description"))
{
  security_message(http_port);
  exit(0);
}
