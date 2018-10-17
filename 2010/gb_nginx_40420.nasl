###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nginx_40420.nasl 5323 2017-02-17 08:49:23Z teissa $
#
# nginx Directory Traversal Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:nginx:nginx";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100659");
 script_version("$Revision: 5323 $");
 script_tag(name:"last_modification", value:"$Date: 2017-02-17 09:49:23 +0100 (Fri, 17 Feb 2017) $");
 script_tag(name:"creation_date", value:"2010-05-31 18:31:53 +0200 (Mon, 31 May 2010)");
 script_bugtraq_id(40420);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
 script_name("nginx Directory Traversal Vulnerability");

 script_xref(name:"URL", value:"http://www.securityfocus.com/bid/40420");
 script_xref(name:"URL", value:"http://nginx.org/");

 script_category(ACT_GATHER_INFO);
 script_family("Web Servers");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl","nginx_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("nginx/installed");

 script_tag(name:"solution", value:"Update to nginx 0.6.37 or later");
 script_tag(name:"summary", value:"nginx is prone to a directory-traversal vulnerability because it fails
 to sufficiently sanitize user-supplied input.");
 script_tag(name:"impact", value:"Exploiting this issue may allow an attacker to obtain sensitive
 information that could aid in further attacks.");
 script_tag(name:"affected", value:"The issue affects nginx 0.6.36 and prior.");

 script_tag(name:"qod_type", value:"remote_banner_unreliable");
 script_tag(name:"solution_type", value:"VendorFix");

 exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less_equal( version: vers, test_version:"0.6.36" ) ) {

  report = report_fixed_ver( installed_version:vers, fixed_version:"0.6.37" );
  security_message( port:port, data:report );
  exit( 0 );

}

exit( 99 );
