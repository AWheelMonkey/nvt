###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_mult_vuln01_sep16_lin.nasl 11523 2018-09-21 13:37:35Z asteins $
#
# PHP Multiple Vulnerabilities - 01 - Sep16 (Linux)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.809320");
  script_version("$Revision: 11523 $");
  script_cve_id("CVE-2016-7134", "CVE-2016-7133");
  script_bugtraq_id(92765, 92766);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 15:37:35 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-09-12 18:19:30 +0530 (Mon, 12 Sep 2016)");
  script_name("PHP Multiple Vulnerabilities - 01 - Sep16 (Linux)");

  script_tag(name:"summary", value:"This host is installed with PHP and is prone
  to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to

  - An integer overflow in 'ext/curl/interface.c' script.

  - When open_basedir is enabled, mishandles huge realloc operations
    in 'Zend/zend_alloc.c' script.");

  script_tag(name:"impact", value:"Successfully exploiting this issue allow
  remote attackers to cause a denial of service (allocation error and heap-based
  buffer overflow) or possibly have unspecified other impact.");

  script_tag(name:"affected", value:"PHP versions 7.x before 7.0.10, on Linux");

  script_tag(name:"solution", value:"Upgrade to PHP version 7.0.10, or later.
  For updates refer to http://www.php.net");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"http://www.php.net/ChangeLog-7.php");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_php_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("php/installed", "Host/runs_unixoide");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( phpPort = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! phpVer = get_app_version( cpe:CPE, port:phpPort ) ) exit( 0 );

if(phpVer =~ "^7\.0")
{
  if(version_in_range(version:phpVer, test_version:"7.0", test_version2:"7.0.9"))
  {
    report = report_fixed_ver(installed_version:phpVer, fixed_version:"7.0.10");
    security_message(data:report, port:phpPort);
    exit(0);
  }
}

exit(99);