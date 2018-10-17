###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_oct2016-2881722_03_lin.nasl 7545 2017-10-24 11:45:30Z cfischer $
#
# Oracle MySQL Security Updates (oct2016-2881722) 03 - Linux
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

CPE = "cpe:/a:oracle:mysql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809375");
  script_version("$Revision: 7545 $");
  script_cve_id("CVE-2016-5612");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:45:30 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2016-10-19 15:48:51 +0530 (Wed, 19 Oct 2016)");
  script_name("Oracle MySQL Security Updates (oct2016-2881722) 03 - Linux");

  script_tag(name:"summary", value:"This host is running Oracle MySQL and is
  prone to an unspecified vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to an unspecified
  error in Server: DML component.");

  script_tag(name: "impact" , value:"Successful exploitation of this
  vulnerability will allow a remote authenticated user to cause denial of
  service conditions.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Oracle Mysql version 5.5.50 and earlier,
  5.6.31 and earlier, and 5.7.13 and earlier on Linux");

  script_tag(name:"solution", value:"Apply the patch from below link,
  http://www.oracle.com/technetwork/security-advisory/cpuoct2016-2881722.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/security-advisory/cpuoct2016-2881722.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_mandatory_keys("MySQL/installed","Host/runs_unixoide");
  script_require_ports("Services/mysql", 3306);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
mysqlVer = "";
sqlPort = "";

## Get Port
if(!sqlPort = get_app_port(cpe:CPE)){
  CPE = "cpe:/a:mysql:mysql";
  if(!sqlPort = get_app_port(cpe:CPE)){
    exit(0);
  }
}

## Get version
if(!mysqlVer = get_app_version(cpe:CPE, port:sqlPort)){
  exit(0);
}

if(version_in_range(version:mysqlVer, test_version:"5.5", test_version2:"5.5.50") ||
   version_in_range(version:mysqlVer, test_version:"5.6", test_version2:"5.6.31") ||
   version_in_range(version:mysqlVer, test_version:"5.7", test_version2:"5.7.13"))
{
  report = report_fixed_ver(installed_version:mysqlVer, fixed_version: "Apply the patch");
  security_message(data:report, port:sqlPort);
  exit(0);
}
