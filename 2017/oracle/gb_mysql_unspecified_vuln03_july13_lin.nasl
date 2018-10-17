###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_unspecified_vuln03_july13_lin.nasl 8600 2018-01-31 11:58:54Z cfischer $
#
# MySQL Unspecified vulnerabilities-03 July-2013 (Linux)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:mysql:mysql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812187");
  script_version("$Revision: 8600 $");
  script_cve_id("CVE-2013-3801", "CVE-2013-3805", "CVE-2013-3794");
  script_bugtraq_id(61269, 61256, 61222);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-01-31 12:58:54 +0100 (Wed, 31 Jan 2018) $");
  script_tag(name:"creation_date", value:"2017-11-22 15:41:37 +0530 (Wed, 22 Nov 2017)");
  script_name("MySQL Unspecified vulnerabilities-03 July-2013 (Linux)");

  script_tag(name : "summary" , value : "This host is running MySQL and is prone
  to multiple unspecified vulnerabilities.");

  script_tag(name : "vuldetect" , value : "Get the installed version of MySQL
  with the help of detect NVT and check it is vulnerable or not.");

  script_tag(name : "solution" , value : "Apply the patch from below link,
  http://www.oracle.com/technetwork/topics/security/cpujuly2013-1899826.html");

  script_tag(name : "insight" , value : "Unspecified errors in the MySQL Server
  component via unknown vectors related to Prepared Statements, Server Options
  and Server Partition.");

  script_tag(name : "affected" , value : "Oracle MySQL 5.5.30 and earlier and 5.6.10 on Linux");

  script_tag(name : "impact" , value : "Successful exploitation will allow remote
  authenticated users to affect availability via unknown vectors.

  Impact Level: Application");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/cpujuly2013-1899826.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH");
  script_family("Databases");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MySQL/installed","Host/runs_unixoide");
  exit(0);
}

include("misc_func.inc");
include("version_func.inc");
include("host_details.inc");

if(!sqlPort = get_app_port(cpe:CPE)) exit(0);

if(!infos = get_app_version_and_location(cpe:CPE, port:sqlPort, exit_no_version:TRUE)) exit(0);
mysqlVer = infos['version'];
mysqlPath = infos['location'];

if(mysqlVer && mysqlVer =~ "^(5\.(5|6))")
{
  if(version_is_equal(version:mysqlVer, test_version:"5.6.10") ||
     version_in_range(version:mysqlVer, test_version:"5.5", test_version2:"5.5.30"))
  {
    report = report_fixed_ver(installed_version:mysqlVer, fixed_version: "Apply the patch", install_path:mysqlPath);
    security_message(port:sqlPort, data:report);
    exit(0);
  }
}
