###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_moodle_mult_vuln_jul17_01_win.nasl 10674 2018-07-30 08:24:18Z asteins $
#
# Moodle 3.x Multiple Vulnerabilities - Jul'17 (Windows)
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, https://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

if( description )
{
  script_oid("1.3.6.1.4.1.25623.1.0.112268");
  script_version("$Revision: 10674 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-30 10:24:18 +0200 (Mon, 30 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-05-09 12:36:11 +0200 (Wed, 09 May 2018)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:P/A:N");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"solution_type", value:"VendorFix");

  script_cve_id("CVE-2017-7532", "CVE-2017-2642");
  script_bugtraq_id(99617, 99606);

  script_name("Moodle 3.x Multiple Vulnerabilities - Jul'17 (Windows)");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_moodle_cms_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("moodle/detected", "Host/runs_windows");

  script_tag(name:"summary", value:"Moodle is prone to multiple vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Following vulnerabilities exist:

  - user fullname disclosure on the user preferences page

  - course creators are able to change system default settings for courses.");
  script_tag(name:"affected", value:"Moodle 3.3, 3.2 to 3.2.3, 3.1 to 3.1.6 and earlier unsupported versions.");
  script_tag(name:"solution", value:"Update to version 3.3.1, 3.2.4 or 3.1.7 respectively.");

  script_xref(name:"URL", value:"https://moodle.org/mod/forum/discuss.php?d=355554");
  script_xref(name:"URL", value:"https://moodle.org/mod/forum/discuss.php?d=355556");

  exit( 0 );
}

CPE = "cpe:/a:moodle:moodle";

include( "host_details.inc" );
include( "version_func.inc" );

if( ! port = get_app_port( cpe: CPE ) ) exit( 0 );
if( ! infos = get_app_version_and_location( port: port, cpe:CPE, exit_no_version:TRUE ) ) exit( 0 );
version = infos['version'];
path = infos['location'];

if( version_is_less( version: version, test_version: "3.1.7" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "3.1.7", install_path: path );
  security_message( data: report, port: port );
  exit( 0 );
}

if( version_in_range( version: version, test_version: "3.2.0", test_version2: "3.2.3" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "3.2.4", install_path: path );
  security_message( data: report, port: port );
  exit( 0 );
}

if( version_is_equal( version: version, test_version: "3.3.0" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "3.3.1", install_path: path );
  security_message( data: report, port: port );
  exit( 0 );
}

exit( 99 );
