###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_dos_vuln02_aug16_win.nasl 11640 2018-09-27 07:15:20Z asteins $
#
# PHP Denial of Service Vulnerability - 02 - Aug16 (Windows)
#
# Authors:
# Tushar Khelge <tkashinath@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.809138");
  script_version("$Revision: 11640 $");
  script_cve_id("CVE-2016-5114");
  script_bugtraq_id(81808);
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-27 09:15:20 +0200 (Thu, 27 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-08-17 15:48:17 +0530 (Wed, 17 Aug 2016)");
  script_name("PHP Denial of Service Vulnerability - 02 - Aug16 (Windows)");

  script_tag(name:"summary", value:"This host is installed with PHP and is prone
  to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to the 'sapi/fpm/fpm/fpm_log.c'
  script misinterprets the semantics of the snprintf return value.");

  script_tag(name:"impact", value:"Successfully exploiting this issue allow
  attackers to obtain sensitive information from process memory or cause a
  denial of service (out-of-bounds read and buffer overflow) via a long string.");

  script_tag(name:"affected", value:"PHP versions before 5.5.31, 5.6.x before
  5.6.17, and 7.x before 7.0.2 on Windows.");

  script_tag(name:"solution", value:"Upgrade to PHP version 5.5.31, or 5.6.17,
  or 7.0.2, or later.
  For updates refer to http://www.php.net");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"http://www.php.net/ChangeLog-5.php");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_dependencies("gb_php_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("php/installed", "Host/runs_windows");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( phpPort = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! phpVer = get_app_version( cpe:CPE, port:phpPort ) ) exit( 0 );

if(version_is_less(version:phpVer, test_version:"5.5.31"))
{
  fix = '5.5.31';
  VULN = TRUE;
}

else if(phpVer =~ "^5\.6")
{
  if(version_in_range(version:phpVer, test_version:"5.6.0", test_version2:"5.6.16"))
  {
    fix = '5.6.17';
    VULN = TRUE;
  }
}

else if(phpVer =~ "^7\.0")
{
  if(version_in_range(version:phpVer, test_version:"7.0", test_version2:"7.0.1"))
  {
    fix = '7.0.2';
    VULN = TRUE;
  }
}

if(VULN)
{
  report = report_fixed_ver(installed_version:phpVer, fixed_version:fix);
  security_message(data:report, port:phpPort);
  exit(0);
}

exit(99);