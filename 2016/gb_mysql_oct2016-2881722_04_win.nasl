###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_oct2016-2881722_04_win.nasl 11837 2018-10-11 09:17:05Z asteins $
#
# Oracle MySQL Security Updates (oct2016-2881722) 04 - Windows
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
  script_oid("1.3.6.1.4.1.25623.1.0.809376");
  script_version("$Revision: 11837 $");
  script_cve_id("CVE-2016-6304");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 11:17:05 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-10-19 15:49:26 +0530 (Wed, 19 Oct 2016)");
  script_name("Oracle MySQL Security Updates (oct2016-2881722) 04 - Windows");

  script_tag(name:"summary", value:"This host is running Oracle MySQL and is
  prone to an unspecified vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to improper validation of
  large OCSP Status Request extensions.");

  script_tag(name:"impact", value:"Successful exploitation of this
  vulnerability will allow remote attackers to cause a denial of service
  (memory consumption).");

  script_tag(name:"affected", value:"Oracle Mysql version 5.6.33 and earlier,
  5.7.15 and earlier on Windows");

  script_tag(name:"solution", value:"Apply the patch");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/security-advisory/cpuoct2016-2881722.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_mandatory_keys("MySQL/installed", "Host/runs_windows");
  script_require_ports("Services/mysql", 3306);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!sqlPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!mysqlVer = get_app_version(cpe:CPE, port:sqlPort)){
  exit(0);
}

if(version_in_range(version:mysqlVer, test_version:"5.6", test_version2:"5.6.33") ||
   version_in_range(version:mysqlVer, test_version:"5.7", test_version2:"5.7.15"))
{
  report = report_fixed_ver(installed_version:mysqlVer, fixed_version: "Apply the patch");
  security_message(data:report, port:sqlPort);
  exit(0);
}
