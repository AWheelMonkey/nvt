###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_mult_vuln01_mar16_lin.nasl  2016-03-01 16:56:54Z March$
#
# PHP Multiple Vulnerabilities - 01 - Mar16 (Linux)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.807503");
  script_version("$Revision: 12149 $");
  script_cve_id("CVE-2015-6831", "CVE-2015-6832", "CVE-2015-6833");
  script_bugtraq_id(76737, 76739, 76735);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-29 11:48:30 +0100 (Mon, 29 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-03-01 16:56:54 +0530 (Tue, 01 Mar 2016)");
  script_name("PHP Multiple Vulnerabilities - 01 - Mar16 (Linux)");

  script_tag(name:"summary", value:"This host is installed with PHP and is prone
  to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - The multiple use-after-free vulnerabilities in SPL unserialize implementation.

  - An insufficient validation of user supplied input by 'phar/phar_object.c'
    script.");

  script_tag(name:"impact", value:"Successfully exploiting this issue allow
  remote attackers to execute arbitrary code and to create or overwrite arbitrary
  files on the system and this may lead to launch further attacks.");

  script_tag(name:"affected", value:"PHP versions before 5.4.44, 5.5.x before
  5.5.28, and 5.6.x before 5.6.12 on Linux");

  script_tag(name:"solution", value:"Upgrade to PHP version 5.4.44 or 5.5.28 or
  5.6.12 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"https://bugs.php.net/bug.php?id=70068");
  script_xref(name:"URL", value:"http://www.openwall.com/lists/oss-security/2015/08/19/3");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_php_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("php/installed", "Host/runs_unixoide");

  script_xref(name:"URL", value:"http://www.php.net");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( phpPort = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! phpVer = get_app_version( cpe:CPE, port:phpPort ) ) exit( 0 );

if(version_is_less(version:phpVer, test_version:"5.4.44"))
{
  fix = '5.4.44';
  VULN = TRUE;
}

else if(phpVer =~ "^5\.6")
{
  if(version_in_range(version:phpVer, test_version:"5.6.0", test_version2:"5.6.11"))
  {
    fix = '5.6.12';
    VULN = TRUE;
  }
}

else if(phpVer =~ "^5\.5")
{
  if(version_in_range(version:phpVer, test_version:"5.5.0", test_version2:"5.5.27"))
  {
    fix = '5.5.28';
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