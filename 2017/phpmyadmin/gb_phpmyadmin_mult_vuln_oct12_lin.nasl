###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_phpmyadmin_mult_vuln_oct12_lin.nasl 7539 2017-10-24 08:52:47Z cfischer $
#
# phpMyAdmin 3.5.x < 3.5.3 Multiple Vulnerabilities (Linux)
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:phpmyadmin:phpmyadmin";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.108238");
  script_version("$Revision: 7539 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 10:52:47 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-09-11 08:48:02 +0200 (Mon, 11 Sep 2017)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2012-5339", "CVE-2012-5368");
  script_bugtraq_id(55925, 55939);
  script_name("phpMyAdmin 3.5.x < 3.5.3 Multiple Vulnerabilities (Linux)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_phpmyadmin_detect_900129.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("phpMyAdmin/installed", "Host/runs_unixoide");

  script_xref(name:"URL", value:"https://www.phpmyadmin.net/security/PMASA-2012-6/");
  script_xref(name:"URL", value:"https://www.phpmyadmin.net/security/PMASA-2012-7/");

  script_tag(name:"summary", value:"phpMyAdmin is prone to multiple cross-site scripting (XSS) vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"affected", value:"phpMyAdmin 3.5.x before 3.5.3.");

  script_tag(name:"solution", value:"Update to version 3.5.3 or newer.");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( vers =~ "^3\.5\." ) {
  if( version_is_less( version:vers, test_version:"3.5.3" ) ) {
    report = report_fixed_ver( installed_version:vers, fixed_version:"3.5.3" );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
