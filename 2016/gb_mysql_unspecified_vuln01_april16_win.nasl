###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_unspecified_vuln01_april16_win.nasl 2016-04-25 15:40:24 +0530 April$
#
# Oracle MySQL Unspecified Vulnerability-01 April16 (Windows)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.807922");
  script_version("$Revision: 11837 $");
  script_cve_id("CVE-2016-0651");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 11:17:05 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-04-25 15:48:03 +0530 (Mon, 25 Apr 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Oracle MySQL Unspecified Vulnerability-01 April16 (Windows)");

  script_tag(name:"summary", value:"This host is running Oracle MySQL and is
  prone to an unspecified vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Unspecified error exist in the MySQL Server
  component via unknown vectors related to Optimizer.");

  script_tag(name:"impact", value:"Successful exploitation will allows local
  users to affect availability.");

  script_tag(name:"affected", value:"Oracle MySQL Server 5.5.46 and earlier
  on windows");

  script_tag(name:"solution", value:"Apply the patch");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/security-advisory/cpuapr2016v3-2985753.html");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Databases");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MySQL/installed", "Host/runs_windows");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!sqlPort = get_app_port(cpe:CPE)){
  CPE = "cpe:/a:mysql:mysql";
  if(!sqlPort = get_app_port(cpe:CPE)){
    exit(0);
  }
}

if(!mysqlVer = get_app_version(cpe:CPE, port:sqlPort)){
  exit(0);
}

if(mysqlVer =~ "^(5\.5)")
{
  if(version_is_less(version:mysqlVer, test_version:"5.5.47"))
  {
    report = report_fixed_ver( installed_version:mysqlVer, fixed_version: "Apply the patch" );
    security_message(data:report, port:sqlPort);
    exit(0);
  }
}
