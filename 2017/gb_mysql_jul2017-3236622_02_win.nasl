###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_jul2017-3236622_02_win.nasl 11874 2018-10-12 11:28:04Z mmartin $
#
# Oracle Mysql Security Updates (jul2017-3236622) 02 - Windows
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.811432");
  script_version("$Revision: 11874 $");
  script_cve_id("CVE-2017-3651", "CVE-2017-3653", "CVE-2017-3652", "CVE-2017-3635",
		"CVE-2017-3648", "CVE-2017-3641");
  script_bugtraq_id(99802, 99810, 99805, 99730, 99789, 99767);
  script_tag(name:"cvss_base", value:"4.9");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:28:04 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-07-19 11:04:26 +0530 (Wed, 19 Jul 2017)");
  script_name("Oracle Mysql Security Updates (jul2017-3236622) 02 - Windows");

  script_tag(name:"summary", value:"This host is running Oracle MySQL and is
  prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to

  - A flaw in the Client mysqldump component.

  - A flaw in the Server: DDL component.

  - A flaw in the C API component.

  - A flaw in the Connector/C component.

  - A flaw in the Server: Charsets component.");

  script_tag(name:"impact", value:"Successful exploitation of this vulnerability
  will allow remote attackers to have an impact on confidentiality, integrity and
  availablility.");

  script_tag(name:"affected", value:"Oracle MySQL version 5.5.56 and earlier,
  5.6.36 and earlier, 5.7.18 and earlier, on Windows");

  script_tag(name:"solution", value:"Apply the patch");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/security-advisory/cpujul2017-3236622.html#AppendixMSQL");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(!mysqlVer = get_app_version(cpe:CPE, port:sqlPort)){
  exit(0);
}

if(version_in_range(version:mysqlVer, test_version:"5.5.0", test_version2:"5.5.56") ||
   version_in_range(version:mysqlVer, test_version:"5.6.0", test_version2:"5.6.36") ||
   version_in_range(version:mysqlVer, test_version:"5.7.0", test_version2:"5.7.18"))
{
  report = report_fixed_ver(installed_version:mysqlVer, fixed_version: "Apply the patch");
  security_message(data:report, port:sqlPort);
  exit(0);
}
