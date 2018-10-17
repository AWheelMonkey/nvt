###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_dos_vuln_apr09.nasl 10459 2018-07-09 07:41:24Z cfischer $
#
# PHP Denial Of Service Vulnerability - April09
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.800393");
  script_version("$Revision: 10459 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-09 09:41:24 +0200 (Mon, 09 Jul 2018) $");
  script_tag(name:"creation_date", value:"2009-04-23 08:49:13 +0200 (Thu, 23 Apr 2009)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2009-1272");
  script_name("PHP Denial Of Service Vulnerability - April09");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_php_detect.nasl");
  script_mandatory_keys("php/installed");

  script_xref(name:"URL", value:"http://www.php.net/releases/5_2_9.php");
  script_xref(name:"URL", value:"http://www.openwall.com/lists/oss-security/2009/04/01/9");

  script_tag(name:"impact", value:"Successful exploitation could result in denial of service condition.

  Impact Level: Application");

  script_tag(name:"affected", value:"PHP version prior to 5.2.9");

  script_tag(name:"insight", value:"Improper handling of .zip file while doing extraction via
  php_zip_make_relative_path function in php_zip.c file.");

  script_tag(name:"solution", value:"Upgrade to PHP version 5.2.9 or above,
  http://www.php.net/downloads.php

  Workaround:
  For workaround refer below link,
  http://cvs.php.net/viewvc.cgi/php-src/ext/json/JSON_parser.c?r1=1.1.2.14&r2=1.1.2.15");

  script_tag(name:"summary", value:"The host is installed with PHP and is prone to Denial of
  Service vulnerability.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( phpPort = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! phpVer = get_app_version( cpe:CPE, port:phpPort ) ) exit( 0 );

# Match PHP version < 5.2.9
if( version_is_less( version:phpVer, test_version:"5.2.9" ) ) {
  report = report_fixed_ver( installed_version:phpVer, fixed_version:"5.2.10" );
  security_message( data:report, port:phpPort );
  exit( 0 );
}

exit( 99 );