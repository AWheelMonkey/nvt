###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_db_core_rdbms_component_unspecified_vuln01_mar18.nasl 12088 2018-10-25 10:57:43Z cfischer $
#
# Oracle Database Server Core RDBMS Component Unspecified Vulnerability -01 Mar18
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:oracle:database_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813006");
  script_version("$Revision: 12088 $");
  script_cve_id("CVE-2011-2242");
  script_tag(name:"cvss_base", value:"1.3");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:M/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-25 12:57:43 +0200 (Thu, 25 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-03-07 15:14:30 +0530 (Wed, 07 Mar 2018)");
  script_name("Oracle Database Server Core RDBMS Component Unspecified Vulnerability -01 Mar18");

  script_tag(name:"summary", value:"This host is running  Oracle Database Server
  and is prone to an unspecified vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an unspecified error in
  component 'Core RDBMS'.");

  script_tag(name:"impact", value:"Successfully exploitation will allow remote
  attackers to affect confidentiality via unknown vectors.");

  script_tag(name:"affected", value:"Oracle Database Server version 11.2.0.1 and
  11.2.0.2.");

  script_tag(name:"solution", value:"Apply the patche from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_xref(name:"URL", value:"https://www.oracle.com/technetwork/topics/security/cpujuly2011-313328.html");
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Databases");
  script_dependencies("oracle_tnslsnr_version.nasl");
  script_mandatory_keys("OracleDatabaseServer/installed");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!dbport = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location(cpe:CPE, port:dbport, exit_no_version:TRUE);
dbVer = infos['version'];
path = infos['location'];

if(dbVer == "11.2.0.1" ||
   dbVer == "11.2.0.2")
{
  report = report_fixed_ver(installed_version:dbVer, fixed_version: "Apply the patch", install_path:path);
  security_message(port:dbport, data:report);
  exit(0);
}
exit(0);
