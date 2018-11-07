###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_phpmyadmin_mult_vuln_jul11_win.nasl 12106 2018-10-26 06:33:36Z cfischer $
#
# phpMyAdmin 3.4.x < 3.4.3.2 Multiple Directory Traversal Vulnerabilities (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.108239");
  script_version("$Revision: 12106 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 08:33:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-09-11 08:48:02 +0200 (Mon, 11 Sep 2017)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2011-2643", "CVE-2011-2718");
  script_bugtraq_id(48874);
  script_name("phpMyAdmin 3.4.x < 3.4.3.2 Multiple Directory Traversal Vulnerabilities (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_phpmyadmin_detect_900129.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("phpMyAdmin/installed", "Host/runs_windows");

  script_xref(name:"URL", value:"https://www.phpmyadmin.net/security/PMASA-2011-10/");
  script_xref(name:"URL", value:"https://www.phpmyadmin.net/security/PMASA-2011-11/");

  script_tag(name:"summary", value:"phpMyAdmin is prone to multiple directory traversal vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"phpMyAdmin 3.4.x before 3.4.3.2.");

  script_tag(name:"solution", value:"Update to version 3.4.3.2 or newer.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( vers =~ "^3\.4\." ) {
  if( version_is_less( version:vers, test_version:"3.4.3.2" ) ) {
    report = report_fixed_ver( installed_version:vers, fixed_version:"3.4.3.2" );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
