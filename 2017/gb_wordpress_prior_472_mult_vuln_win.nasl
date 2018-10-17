###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_prior_472_mult_vuln_win.nasl 7543 2017-10-24 11:02:02Z cfischer $
#
# WordPress < 4.7.2 Multiple Security Vulnerabilities (Windows)
#
# Authors:
# Christian Fischer <christian.fischer@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.108069");
  script_version("$Revision: 7543 $");
  script_cve_id("CVE-2017-5610", "CVE-2017-5611", "CVE-2017-5612", "CVE-2017-1001000");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:02:02 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-02-02 14:20:15 +0100 (Thu, 02 Feb 2017)");
  script_name("WordPress < 4.7.2 Multiple Security Vulnerabilities (Windows)");
  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("os_detection.nasl", "secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed", "Host/runs_windows");
  script_require_ports("Services/www", 80);

  script_xref(name:"URL", value:"https://make.wordpress.org/core/2017/02/01/disclosure-of-additional-security-fix-in-wordpress-4-7-2/");
  script_xref(name:"URL", value:"https://wordpress.org/news/2017/01/wordpress-4-7-2-security-release/");
  script_xref(name:"URL", value:"https://blog.sucuri.net/2017/02/content-injection-vulnerability-wordpress-rest-api.html");
  script_xref(name:"URL", value:"http://www.secpod.com/blog/wordpress-rest-api-zero-day-privilege-escalation-vulnerability");

  script_tag(name:"summary", value:"This host is running WordPress and is prone to multiple security vulnerabilities
  because it fails to sanitize user-supplied input.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of the detect NVT and
  check if the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to:

  - The user interface for assigning taxonomy terms in Press This is shown to
  users who do not have permissions to use it.

  - P_Query is vulnerable to a SQL injection (SQLi) when passing unsafe data.
  WordPress core is not directly vulnerable to this issue, but hardening was added to prevent plugins and themes
  from accidentally causing a vulnerability.

  - A cross-site scripting (XSS) vulnerability was discovered in the posts list table.

  - An unauthenticated privilege escalation vulnerability was discovered in a REST API endpoint.");

  script_tag(name:"impact", value:"Successfully exploiting this issue allow
  remote attacker to e.g. obtain sensitive information or inject arbitrary web script or HTML. 

  Impact Level: Application");

  script_tag(name:"affected", value:"WordPress versions 4.7.1 and earlier.");

  script_tag(name:"solution", value:"Upgrade to WordPress version 4.7.2.
  For updates refer to https://wordpress.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less( version:vers, test_version:"4.7.2" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"4.7.2" );
  security_message( data:report, port:port );
  exit( 0 );
}

exit( 99 );
