###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_bigtree_mult_vuln_jun17.nasl 12106 2018-10-26 06:33:36Z cfischer $
#
# BigTree CMS <= 4.2.18 Multiple CSRF and XSS Vulnerabilities
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

CPE = "cpe:/a:bigtree:bigtree";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.108181");
  script_version("$Revision: 12106 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 08:33:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-13 08:57:33 +0200 (Tue, 13 Jun 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2017-9546", "CVE-2017-9547", "CVE-2017-9548", "CVE-2017-9428", "CVE-2017-9444",
                "CVE-2017-9448", "CVE-2017-9379", "CVE-2017-9364", "CVE-2017-9365");
  script_name("BigTree CMS <= 4.2.18 Multiple CSRF and XSS Vulnerabilities");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_bigtree_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("BigTree/Installed");

  script_xref(name:"URL", value:"https://github.com/bigtreecms/BigTree-CMS");

  script_tag(name:"summary", value:"BigTree CMS is prone to a CSRF vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"BigTree CMS is prone to a CSRF vulnerability because it
  relies on a substring check for CSRF protection, which allows remote attackers to bypass
  this check by placing the required admin/developer/ URI within a query string in an HTTP
  Referer header.");

  script_tag(name:"affected", value:"BigTree CMS versions through 4.2.18.");

  script_tag(name:"solution", value:"Update to version 4.2.19.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less_equal( version:vers, test_version:"4.2.18" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"4.2.19" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );