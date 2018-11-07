###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_security_bypass_vuln_may18_lin.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# PHP Security Bypass Vulnerability May18 (Linux)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:php:php";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813162");
  script_version("$Revision: 12120 $");
  script_cve_id("CVE-2018-10545");
  script_tag(name:"cvss_base", value:"1.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-05-03 10:25:53 +0530 (Thu, 03 May 2018)");
  script_name("PHP Security Bypass Vulnerability May18 (Linux)");

  script_tag(name:"summary", value:"The host is installed with php and is prone
  to security bypass vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists as the dumpable FPM child
  processes allow bypassing opcache access controls");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to bypass security restrictions and access sensitive configuration data for
  other accounts directly in the PHP worker process's memory.");

  script_tag(name:"affected", value:"PHP versions prior to 5.6.35,

  PHP versions 7.2.x prior to 7.2.4,

  PHP versions 7.0.x prior to 7.0.29,

  PHP versions 7.1.x prior to 7.1.16 on Linux.");

  script_tag(name:"solution", value:"Upgrade to version 7.2.4 or 7.0.29 or
  5.6.35 or 7.1.16 or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_xref(name:"URL", value:"http://www.php.net/ChangeLog-5.php#5.6.35");
  script_xref(name:"URL", value:"http://www.php.net/ChangeLog-7.php#7.0.29");
  script_xref(name:"URL", value:"http://www.php.net/ChangeLog-7.php#7.1.16");
  script_xref(name:"URL", value:"http://www.php.net/ChangeLog-7.php#7.2.4");

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_php_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("php/installed", "Host/runs_unixoide");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(isnull(phport = get_app_port(cpe: CPE))){
  exit(0);
}

if(!infos = get_app_version_and_location(cpe:CPE, port:phport, exit_no_version:TRUE)) exit(0);
vers = infos['version'];
path = infos['location'];

if(version_in_range(version: vers, test_version: "7.2", test_version2: "7.2.3")){
  fix = "7.2.4";
}
else if(version_in_range(version: vers, test_version: "7.0", test_version2: "7.0.28")){
  fix = "7.0.29";
}
else if(version_in_range(version: vers, test_version: "7.1", test_version2: "7.1.15")){
  fix = "7.1.16";
}
else if(version_is_less(version: vers, test_version: "5.6.35")){
  fix = "5.6.35";
}

if(fix){
  report = report_fixed_ver(installed_version:vers, fixed_version:fix, install_path:path);
  security_message(port:phport, data:report);
  exit(0);
}
exit(0);
