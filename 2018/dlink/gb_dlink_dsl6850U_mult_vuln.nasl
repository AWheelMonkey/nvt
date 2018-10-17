###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dlink_dsl6850U_mult_vuln.nasl 11208 2018-09-04 08:04:34Z cfischer $
#
# D-Link DSL-6850U Multiple Vulnerabilities
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/h:dlink";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812376");
  script_version("$Revision: 11208 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-04 10:04:34 +0200 (Tue, 04 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-01-03 15:39:16 +0530 (Wed, 03 Jan 2018)");
  script_name("D-Link DSL-6850U Multiple Vulnerabilities");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_dlink_dsl_detect.nasl");
  script_mandatory_keys("host_is_dlink_dsl");
  script_require_ports("Services/www", 80);

  script_xref(name:"URL", value:"https://blogs.securiteam.com/index.php/archives/3588");

  script_tag(name:"summary", value:"The host is a D-Link DSL-6850U router
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Send the crafted HTTP GET request
  and check whether it is possible to access the administration GUI or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - Default account 'support' with password 'support' and it cannot be disabled.

  - Availability of the shell interface although only a set of commands, but
    commands can be combined using logical AND, logical OR.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to access administration of the device and execute arbitrary code
  on the affected system.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"D-Link DSL-6850U versions BZ_1.00.01 - BZ_1.00.09");

  script_tag(name:"solution", value:"Apply the latest security patches from the
  vendor. For details refer to http://www.dlink.com/");

  script_tag(name:"qod_type", value:"remote_vul");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

if( ! port = get_app_port_from_cpe_prefix( cpe:CPE ) ) exit( 0 );
if( ! model = get_kb_item( "D-Link/DSL/model" ) ) exit( 0 );
if( model != "6850U" ) exit( 99 );

url = "/lainterface.html";
host = http_host_name( port:port );

# Base64(support:support) == c3VwcG9ydDpzdXBwb3J0
req = string( "GET ", url, " HTTP/1.1\r\n",
              "Host: ", host, "\r\n",
              "Authorization: Basic c3VwcG9ydDpzdXBwb3J0\r\n",
              "\r\n");
res = http_keepalive_send_recv( port:port, data:req );

if( res && "WAN SETTINGS" >< res && "value='3G Interface" >< res && "menu.html" >< res &&
    "TabHeader=th_setup" >< res && 'src="util.js"' >< res && 'src="language_en.js"' >< res ) {
  report = "It was possible to login with the default account 'support:support' at the following URL: " + report_vuln_url( port:port, url:url, url_only:TRUE );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
