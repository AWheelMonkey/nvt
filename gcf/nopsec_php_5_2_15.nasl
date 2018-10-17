##############################################################################
# OpenVAS Vulnerability Test
# $Id: nopsec_php_5_2_15.nasl 10460 2018-07-09 07:50:03Z cfischer $
#
# PHP Version 5.2 < 5.2.15 Multiple Vulnerabilities
#
# Authors:
# Songhan Yu <syu@nopsec.com>
#
# Copyright:
# Copyright NopSec Inc. 2012, http://www.nopsec.com
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

CPE = "cpe:/a:php:php";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.110066");
  script_version("$Revision: 10460 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-09 09:50:03 +0200 (Mon, 09 Jul 2018) $");
  script_tag(name:"creation_date", value:"2012-06-21 11:43:12 +0100 (Thu, 21 Jun 2012)");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"cvss_base", value:"6.8");
  script_cve_id("CVE-2010-3436", "CVE-2010-3709", "CVE-2010-4150",
                "CVE-2010-4697", "CVE-2010-4698", "CVE-2011-0752");
  script_bugtraq_id(44718, 44723, 45335, 45952, 46448);
  script_name("PHP Version 5.2 < 5.2.15 Multiple Vulnerabilities");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("Copyright NopSec Inc. 2012");
  script_dependencies("gb_php_detect.nasl");
  script_mandatory_keys("php/installed");

  script_tag(name:"solution", value:"Upgrade to PHP version 5.2.15 or later.");

  script_tag(name:"summary", value:"PHP 5.2 < 5.2.15 suffers from multiple vulnerabilities such as a crash
  in the zip extract method, NULL pointer dereference and stack-based buffer overflow.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( port = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"5.2", test_version2:"5.2.14" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"5.2.15" );
  security_message( data:report, port:port );
  exit( 0 );
}

exit( 99 );