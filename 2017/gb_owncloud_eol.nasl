###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_owncloud_eol.nasl 11935 2018-10-17 08:47:01Z mmartin $
#
# ownCloud End Of Life Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
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

CPE = "cpe:/a:owncloud:owncloud";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140157");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_version("$Revision: 11935 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-17 10:47:01 +0200 (Wed, 17 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-02-14 13:48:20 +0100 (Tue, 14 Feb 2017)");
  script_name("ownCloud End Of Life Detection");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_owncloud_detect.nasl");
  script_mandatory_keys("owncloud/installed");
  script_require_ports("Services/www", 80);

  script_xref(name:"URL", value:"https://github.com/owncloud/core/wiki/Maintenance-and-Release-Schedule");

  script_tag(name:"summary", value:"The ownCloud version on the remote host has reached the end of life and should
  not be used anymore.");

  script_tag(name:"impact", value:"An end of life version of ownCloud is not receiving any security updates from the vendor. Unfixed security vulnerabilities
  might be leveraged by an attacker to compromise the security of this host.");

  script_tag(name:"solution", value:"Update the ownCloud version on the remote host to a still supported version.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("misc_func.inc");
include("products_eol.inc");
include("version_func.inc");
include("host_details.inc");
include("http_func.inc"); # For report_vuln_url()

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! infos = get_app_version_and_location( cpe:CPE, port:port, exit_no_version:TRUE ) ) exit( 0 );
version  = infos['version'];
location = infos['location'];

if( ret = product_reached_eol( cpe:CPE, version:version ) ) {
  report = build_eol_message( name:"ownCloud",
                              cpe:CPE,
                              version:version,
                              location:report_vuln_url( port:port, url:location, url_only:TRUE ),
                              eol_version:ret["eol_version"],
                              eol_date:ret["eol_date"],
                              eol_type:"prod" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
