###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_mysql_jan2018-3236628_02_lin.nasl 9299 2018-04-04 11:06:32Z cfischer $
#
# Oracle Mysql Security Updates (jan2018-3236628) 02 - Linux
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:oracle:mysql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812647");
  script_version("$Revision: 9299 $");
  script_cve_id("CVE-2018-2668", "CVE-2018-2665", "CVE-2018-2622", "CVE-2018-2640" );
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-04 13:06:32 +0200 (Wed, 04 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-01-17 14:42:54 +0530 (Wed, 17 Jan 2018)");
  script_name("Oracle Mysql Security Updates (jan2018-3236628) 02 - Linux");

  script_tag(name:"summary", value:"This host is running Oracle MySQL and is
  prone to multiple denial-of-service vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - An error in the 'Server: DDL' component.

  - Multiple errors in the 'Server: Optimizer' component.");

  script_tag(name: "impact" , value:"Successful exploitation of these vulnerabilities
  will allow remote attackers to conduct a denial-of-service attack.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Oracle MySQL version 5.5.58 and earlier,
  5.6.38 and earlier, 5.7.20 and earlier on Linux");

  script_tag(name:"solution", value:"Apply the patch from below link,
  http://www.oracle.com/technetwork/security-advisory/cpujan2018-3236628.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/security-advisory/cpujan2018-3236628.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MySQL/installed", "Host/runs_unixoide");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!sqlPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!infos = get_app_version_and_location(cpe:CPE, port:sqlPort, exit_no_version:TRUE)){
  exit(0);
}

mysqlVer = infos['version'];
path = infos['location'];

if(version_in_range(version:mysqlVer, test_version:"5.5", test_version2:"5.5.58")||
   version_in_range(version:mysqlVer, test_version:"5.6", test_version2:"5.6.38")||
   version_in_range(version:mysqlVer, test_version:"5.7", test_version2:"5.7.20")){
  report = report_fixed_ver(installed_version:mysqlVer, fixed_version: "Apply the patch", install_path:path);
  security_message(port:sqlPort, data:report);
  exit(0);
}

exit(99);