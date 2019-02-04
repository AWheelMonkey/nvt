###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_jenkins_20190116_win.nasl 13260 2019-01-24 09:34:34Z jschulte $
#
# Jenkins < 2.160 and < 2.150.2 LTS Multiple Vulnerabilities (Windows)
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
#
# Copyright:
# Copyright (C) 2019 Greenbone Networks GmbH
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112495");
  script_version("$Revision: 13260 $");
  script_cve_id("CVE-2019-1003003", "CVE-2019-1003004");
  script_tag(name:"cvss_base", value:"8.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:M/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2019-01-24 10:34:34 +0100 (Thu, 24 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-23 10:08:11 +0100 (Wed, 23 Jan 2019)");
  script_name("Jenkins < 2.160 and < 2.150.2 LTS Multiple Vulnerabilities (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("sw_jenkins_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("jenkins/installed", "Host/runs_windows");
  script_require_ports("Services/www", 8080);

  script_tag(name:"summary", value:"Jenkins and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Jenkins is prone to the following vulnerabilities:

  - Administrators could persist access to Jenkins using crafted 'Remember me' cookie (CVE-2019-1003003).

  - Deleting a user in an external security realm did not invalidate their session or 'Remember me' cookie (CVE-2019-1003004).");

  script_tag(name:"affected", value:"Jenkins LTS through 2.150.1, Jenkins weekly through 2.159.");

  script_tag(name:"solution", value:"Upgrade Jenkins weekly to 2.160 or later / Jenkins LTS to 2.150.2
  or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"https://jenkins.io/security/advisory/2019-01-16/");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

CPE = "cpe:/a:jenkins:jenkins";

if( ! port = get_app_port( cpe:CPE ) )
  exit( 0 );

if( ! infos = get_app_version_and_location( cpe:CPE, port:port, exit_no_version:TRUE ) )
  exit( 0 );

vers = infos["version"];
path = infos["location"];

if( get_kb_item( "jenkins/" + port + "/is_lts" ) ) {
  if ( version_is_less( version:vers, test_version:"2.150.2" ) ) {
    fix = "2.150.2";
  }
} else {
  if( version_is_less( version:vers, test_version:"2.160" ) ) {
    fix = "2.160";
  }
}

if( fix ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:fix, install_path:path );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
