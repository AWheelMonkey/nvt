###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_mysql_apr2018-3678067_01_win.nasl 9733 2018-05-04 14:11:22Z cfischer $
#
# Oracle Mysql Security Updates (apr2018-3678067) 01 - Windows
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
  script_oid("1.3.6.1.4.1.25623.1.0.813142");
  script_version("$Revision: 9733 $");
  script_cve_id("CVE-2018-2805" );
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-05-04 16:11:22 +0200 (Fri, 04 May 2018) $");
  script_tag(name:"creation_date", value:"2018-04-19 10:31:43 +0530 (Thu, 19 Apr 2018)");
  script_name("Oracle Mysql Security Updates (apr2018-3678067) 01 - Windows");

  script_tag(name:"summary", value:"This host is running Oracle MySQL and is
  prone to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to an error in the
  'GIS Extension' of MySQL Server");

  script_tag(name: "impact" , value:"Successful exploitation of this
  vulnerability will allow remote attackers to conduct a denial of service
  condition.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Oracle MySQL version 5.6.39 and earlier
  on Windows");

  script_tag(name:"solution", value:"Apply the latest patch from vendor. For
  updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/security-advisory/cpuapr2018-3678067.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MySQL/installed", "Host/runs_windows");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!sqlPort = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location(cpe:CPE, port:sqlPort, exit_no_version:TRUE);
mysqlVer = infos['version'];
path = infos['location'];

if(version_in_range(version:mysqlVer, test_version:"5.6", test_version2:"5.6.39")){
  report = report_fixed_ver(installed_version:mysqlVer, fixed_version: "Apply the patch", install_path:path);
  security_message(port:sqlPort, data:report);
  exit(0);
}

exit(99);
