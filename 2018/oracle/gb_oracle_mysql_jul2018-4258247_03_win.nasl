###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_mysql_jul2018-4258247_03_win.nasl 10721 2018-08-02 03:07:04Z ckuersteiner $
#
# Oracle MySQL Security Updates-03 (jul2018-4258247) Windows
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
  script_oid("1.3.6.1.4.1.25623.1.0.813708");
  script_version("$Revision: 10721 $");
  script_cve_id("CVE-2018-3077", "CVE-2018-3054");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-08-02 05:07:04 +0200 (Thu, 02 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-07-18 12:33:05 +0530 (Wed, 18 Jul 2018)");
  script_name("Oracle MySQL Security Updates-03 (jul2018-4258247) Windows");

  script_tag(name:"summary", value:"This host is running Oracle MySQL and is
  prone to multiple denial-of-service vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to multiple errors
  in 'Server: DML' component of MySQL Server.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to conduct a denial-of-service condition. 

  Impact Level: Application");

  script_tag(name: "affected" , value:"Oracle MySQL version 5.7.22 and earlier
  on Windows");

  script_tag(name:"solution", value:"Apply the patch from Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/security-advisory/cpujul2018-4258247.html");

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

infos = get_app_version_and_location(cpe:CPE, port:sqlPort, exit_no_version:TRUE) ;
mysqlVer = infos['version'];
path = infos['location'];

if(version_in_range(version:mysqlVer, test_version:"5.7", test_version2:"5.7.22"))
{
  report = report_fixed_ver(installed_version:mysqlVer, fixed_version: "Apply the patch");
  security_message(data:report, port:sqlPort);
  exit(0);
}
exit(0);
