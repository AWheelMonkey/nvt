###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_jenkins_20171214_1_lin.nasl 12761 2018-12-11 14:32:20Z cfischer $
#
# Jenkins Random Startup Failure Vulnerability (Linux)
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH
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

CPE = "cpe:/a:jenkins:jenkins";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112194");
  script_version("$Revision: 12761 $");

  script_cve_id("CVE-2017-1000503");

  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-12-11 15:32:20 +0100 (Tue, 11 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-01-29 10:05:00 +0100 (Mon, 29 Jan 2018)");
  script_name("Jenkins Random Startup Failure Vulnerability (Linux)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("sw_jenkins_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("jenkins/installed", "Host/runs_unixoide");
  script_require_ports("Services/www", 8080);

  script_xref(name:"URL", value:"https://jenkins.io/security/advisory/2017-12-14/");

  script_tag(name:"summary", value:"A race condition during Jenkins startup could result in the wrong order of execution of commands during initialization.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"On Jenkins this issue could in rare cases result in failure to initialize the setup wizard on the first startup.
This resulted in the following security settings not being set to their usual strict default:

  - No security realm was defined, and no admin user was created whose password was written to the Jenkins log or the initialPassword file.

  - The authorization strategy remained Anyone can do anything rather than Logged-in users can do anything.

  - TCP port for JNLP agents, usually disabled by default, was open, unless a Java system property controlling it was set.

  - CLI over Remoting was enabled.

  - CSRF Protection was disabled.

  - Agent - Master Access Control was disabled.

Affected instances need to be configured to restrict access.");

  script_tag(name:"impact", value:"Successfully exploiting this issue would reduce the system security severely.");

  script_tag(name:"affected", value:"Jenkins LTS 2.89.1, Jenkins weekly 2.81 through 2.94 (inclusive).");

  script_tag(name:"solution", value:"Upgrade to Jenkins weekly to 2.95 or later / Jenkins LTS to 2.89.2 or
  later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"https://www.cloudbees.com");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( get_kb_item( "jenkins/" + port + "/is_lts" ) ) {
  if ( version_is_equal( version:vers, test_version:"2.89.1" ) ) {
    vuln = TRUE;
    fix = "2.89.2";
  }
} else {
  if( version_in_range( version:vers, test_version:"2.81", test_version2:"2.94" ) ) {
    vuln = TRUE;
    fix = "2.95";
  }
}

if( vuln ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:fix );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
