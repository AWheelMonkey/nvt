###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_mult_integer_overflow_vuln_mar16_win.nasl 2016-03-01 16:56:54Z March$
#
# PHP Multiple Integer Overflow Vulnerabilities - Mar16 (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.807508");
  script_version("$Revision: 10455 $");
  script_cve_id("CVE-2016-1904");
  script_bugtraq_id(81296);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-07-09 07:52:14 +0200 (Mon, 09 Jul 2018) $");
  script_tag(name:"creation_date", value:"2016-03-01 16:56:54 +0530 (Tue, 01 Mar 2016)");
  script_name("PHP Multiple Integer Overflow Vulnerabilities - Mar16 (Windows)");

  script_tag(name:"summary", value:"This host is installed with PHP and is prone
  to multiple integer overflow vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,
  multiple integer overflows in 'ext/standard/exec.c' script via a long string to
  the 'php_escape_shell_cmd' or 'php_escape_shell_arg' function.");

  script_tag(name:"impact", value:"Successfully exploiting this issue allow
  remote attackers to cause a denial of service or possibly have unspecified
  other impact.

  Impact Level: Application");

  script_tag(name:"affected", value:"PHP versions 7.x before 7.0.2 on Windows");

  script_tag(name:"solution", value:"Upgrade to PHP version  7.0.2 or later.
  For updates refer to http://www.php.net");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"https://bugs.php.net/bug.php?id=70976");
  script_xref(name:"URL", value:"http://www.openwall.com/lists/oss-security/2016/01/14/8");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_php_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("php/installed", "Host/runs_windows");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( phpPort = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! phpVer = get_app_version( cpe:CPE, port:phpPort ) ) exit( 0 );

if(phpVer =~ "^7")
{
  if(version_is_less(version:phpVer, test_version:"7.0.2"))
  {
    report = report_fixed_ver(installed_version:phpVer, fixed_version:"7.0.2");
    security_message(data:report, port:phpPort);
    exit(0);
  }
}

exit(99);