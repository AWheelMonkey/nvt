###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_mysql_jul2018-4258247_01_lin.nasl 12068 2018-10-25 07:21:15Z mmartin $
#
# Oracle MySQL Security Updates-01 (jul2018-4258247) Linux
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
  script_oid("1.3.6.1.4.1.25623.1.0.813705");
  script_version("$Revision: 12068 $");
  script_cve_id("CVE-2018-3078", "CVE-2018-3079", "CVE-2018-3073", "CVE-2018-3074",
                "CVE-2018-3075", "CVE-2018-3084", "CVE-2018-3080", "CVE-2018-3082",
                "CVE-2018-3067");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-25 09:21:15 +0200 (Thu, 25 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-07-18 12:31:05 +0530 (Wed, 18 Jul 2018)");
  script_name("Oracle MySQL Security Updates-01 (jul2018-4258247) Linux");

  script_tag(name:"summary", value:"This host is running Oracle MySQL and is
  prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to multiple errors
  in 'Server: Optimizer', 'Server: Security: Roles', 'InnoDB', 'Server: DDL',
  'Server: Replication', 'Server: Security: Privileges' and 'Shell: Core / Client'
  components.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to have an impact on confidentiality and availability.");

  script_tag(name:"affected", value:"Oracle MySQL version 8.0.11 and earlier
  on Linux");

  script_tag(name:"solution", value:"Apply the patch from Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/security-advisory/cpujul2018-4258247.html");

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

infos = get_app_version_and_location(cpe:CPE, port:sqlPort, exit_no_version:TRUE) ;
mysqlVer = infos['version'];
path = infos['location'];

if(version_in_range(version:mysqlVer, test_version:"8.0", test_version2:"8.0.11"))
{
  report = report_fixed_ver(installed_version:mysqlVer, fixed_version: "Apply the patch");
  security_message(data:report, port:sqlPort);
  exit(0);
}
exit(0);
