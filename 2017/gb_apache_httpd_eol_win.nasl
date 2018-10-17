###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_httpd_eol_win.nasl 11835 2018-10-11 08:38:49Z mmartin $
#
# Apache Web Server End Of Life Detection (Windows)
#
# Authors:
# Christian Fischer <christian.fischer@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

CPE = "cpe:/a:apache:http_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.108135");
  script_version("$Revision: 11835 $");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 10:38:49 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-02-27 11:48:20 +0100 (Mon, 27 Feb 2017)");
  script_name("Apache Web Server End Of Life Detection (Windows)");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web Servers");
  script_dependencies("secpod_apache_detect.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("apache/installed", "Host/runs_windows");

  script_xref(name:"URL", value:"https://archive.apache.org/dist/httpd/Announcement1.3.html");
  script_xref(name:"URL", value:"https://archive.apache.org/dist/httpd/Announcement2.0.html");
  script_xref(name:"URL", value:"https://www.apache.org/dist/httpd/Announcement2.2.html");
  script_xref(name:"URL", value:"https://en.wikipedia.org/wiki/Apache_HTTP_Server#Versions");

  script_tag(name:"summary", value:"The Apache Web Server version on the remote host has reached the end of life and should
  not be used anymore.");
  script_tag(name:"impact", value:"An end of life version of Apache Web Server is not receiving any security updates from the vendor. Unfixed security vulnerabilities
  might be leveraged by an attacker to compromise the security of this host.");
  script_tag(name:"solution", value:"Update the Apache Web Server version on the remote host to a still supported version.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("misc_func.inc");
include("products_eol.inc");
include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! version = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( ret = product_reached_eol( cpe:CPE, version:version ) ) {
  report = build_eol_message( name:"Apache Web Server",
                              cpe:CPE,
                              version:version,
                              eol_version:ret["eol_version"],
                              eol_date:ret["eol_date"],
                              eol_type:"prod" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
