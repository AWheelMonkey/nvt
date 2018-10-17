###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_server_components_mult_unspec_vuln_lin.nasl 9986 2018-05-28 14:50:35Z cfischer $
#
# MySQL Server Components Multiple Unspecified Vulnerabilities (Linux)
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
  script_oid("1.3.6.1.4.1.25623.1.0.812180");
  script_version("$Revision: 9986 $");
  script_cve_id("CVE-2012-1690", "CVE-2012-1688", "CVE-2012-1703");
  script_bugtraq_id(53074, 53067, 53058);
  script_tag(name:"last_modification", value:"$Date: 2018-05-28 16:50:35 +0200 (Mon, 28 May 2018) $");
  script_tag(name:"creation_date", value:"2017-11-23 14:48:53 +0530 (Thu, 23 Nov 2017)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:C");
  script_name("MySQL Server Components Multiple Unspecified Vulnerabilities");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/48890");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/cpuapr2012-366314.html#AppendixMSQL");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH");
  script_family("Databases");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MySQL/installed","Host/runs_unixoide");

  script_tag(name : "impact" , value : "Successful exploitation could allow
  remote authenticated users to affect availability via unknown vectors.

  Impact Level: Application");

  script_tag(name : "affected" , value : "MySQL version 5.1.x before 5.1.62
  and 5.5.x before 5.5.22");

  script_tag(name : "insight" , value : "Multiple unspecified error in Server
  Optimizer and Server DML components.");

  script_tag(name : "solution" , value : "Apply the patch from the below link,
  http://www.oracle.com/technetwork/topics/security/cpuapr2012-366314.html");

  script_tag(name : "summary" , value : "The host is running MySQL and is prone
  to multiple unspecified vulnerabilities.");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!sqlPort = get_app_port(cpe:CPE)) exit(0);

if(!infos = get_app_version_and_location(cpe:CPE, port:sqlPort, exit_no_version:TRUE)) exit(0);
mysqlVer = infos['version'];
mysqlPath = infos['location'];

if(mysqlVer && mysqlVer =~ "^(5\.(1|5))")
{
  if(version_in_range(version:mysqlVer, test_version:"5.1", test_version2:"5.1.61") ||
     version_in_range(version:mysqlVer, test_version:"5.5", test_version2:"5.5.21"))
  {
    report = report_fixed_ver( installed_version:mysqlVer, fixed_version: "Apply the patch", install_path:mysqlPath );
    security_message(port:sqlPort, data:report);
    exit(0);
  }
}
