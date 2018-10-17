###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_postgresql_interactive_installer_code_exec_vuln_win.nasl 11933 2018-10-17 07:09:44Z asteins $
#
# PostgreSQL 'Interactive Installer' Arbitrary Code Execution Vulnerability (Windows)
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

CPE = "cpe:/a:postgresql:postgresql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814221");
  script_version("$Revision: 11933 $");
  script_cve_id("CVE-2016-7048");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-17 09:09:44 +0200 (Wed, 17 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-09-28 10:51:36 +0530 (Fri, 28 Sep 2018)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("PostgreSQL 'Interactive Installer' Arbitrary Code Execution Vulnerability (Windows)");

  script_tag(name:"summary", value:"This host is running PostgreSQL and is
  prone to arbitrary code execution vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exists as interactive installer
  downloads software over plain HTTP and then executes it.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to execute arbitrary code on the affected system.");

  script_tag(name:"affected", value:"PostgreSQL versions 9.3.x prior to 9.3.15,
  9.4.x prior to 9.4.10 and 9.5.x prior to 9.5.5 on Windows.");

  script_tag(name:"solution", value:"Upgrade to PostgreSQL version 9.3.15 or
  9.4.10 or 9.5.5 or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://access.redhat.com/security/cve/cve-2016-7048");
  script_xref(name:"URL", value:"https://www.postgresql.org/support/security");
  script_xref(name:"URL", value:"https://www.postgresql.org");

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Databases");
  script_dependencies("postgresql_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("PostgreSQL/installed", "Host/runs_windows");
  script_require_ports("Services/postgresql", 5432);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

pgsqlPort = get_app_port(cpe:CPE);
if(!pgsqlPort){
  exit(0);
}

infos = get_app_version_and_location(cpe:CPE, port:pgsqlPort, exit_no_version:TRUE);
pgsqlVer = infos['version'];
pgsqlPath = infos['location'];

if(pgsqlVer =~ "^9\.5\.")
{
  if(version_is_less(version:pgsqlVer, test_version: "9.5.5")){
    fix = "9.5.5";
 }
}

else if(pgsqlVer =~ "^9\.4\.")
{
  if(version_is_less(version:pgsqlVer, test_version: "9.4.10")){
    fix = "9.4.10";
  }
}

else if (pgsqlVer =~ "^9\.3")
{
  if(version_is_less(version:pgsqlVer, test_version: "9.3.15")){
    fix = "9.3.15";
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:pgsqlVer, fixed_version:fix, install_path:pgsqlPath);
  security_message(port:pgsqlPort, data:report);
  exit(0);
}
