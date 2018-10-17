###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_php_use_after_free_vuln.nasl 10458 2018-07-09 06:47:36Z cfischer $
#
# PHP 'substr_replace()' Use After Free Vulnerability
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902356");
  script_version("$Revision: 10458 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-09 08:47:36 +0200 (Mon, 09 Jul 2018) $");
  script_tag(name:"creation_date", value:"2011-03-22 08:43:18 +0100 (Tue, 22 Mar 2011)");
  script_cve_id("CVE-2011-1148");
  script_bugtraq_id(46843);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("PHP 'substr_replace()' Use After Free Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 SecPod");
  script_family("Web application abuses");
  script_dependencies("gb_php_detect.nasl");
  script_mandatory_keys("php/installed");

  script_xref(name:"URL", value:"http://bugs.php.net/bug.php?id=54238");
  script_xref(name:"URL", value:"http://openwall.com/lists/oss-security/2011/03/13/3");

  script_tag(name:"impact", value:"Successful exploitation could allow remote attackers to execute
  arbitrary code in the context of a web server. Failed attempts will likely
  result in denial-of-service conditions.

  Impact Level: Network");

  script_tag(name:"affected", value:"PHP version 5.3.6 and prior.");

  script_tag(name:"insight", value:"The flaw is due to passing the same variable multiple times to
  the 'substr_replace()' function, which makes the PHP to use the same pointer in
  three variables inside the function.");

  script_tag(name:"solution", value:"Upgrade to PHP version 5.3.7 or later.
  For updates refer to http://www.php.net/downloads.php");

  script_tag(name:"summary", value:"This host is running PHP and is prone to Use After Free
  vulnerability.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( phpPort = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! phpVer = get_app_version( cpe:CPE, port:phpPort ) ) exit( 0 );

if( version_is_less_equal( version:phpVer, test_version:"5.3.6" ) ) {
  report = report_fixed_ver( installed_version:phpVer, fixed_version:"5.3.7" );
  security_message( data:report, port:phpPort );
  exit( 0 );
}

exit( 99 );