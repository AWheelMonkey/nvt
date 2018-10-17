###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_db_core_rdbms_component_unspecified_vuln.nasl 10669 2018-07-30 02:51:08Z ckuersteiner $
#
# Oracle Database Server 'Core RDBMS' Component Unspecified Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.813692");
  script_version("$Revision: 10669 $");
  script_cve_id("CVE-2018-2939");
  script_tag(name:"cvss_base", value:"3.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-07-30 04:51:08 +0200 (Mon, 30 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-18 12:59:43 +0530 (Wed, 18 Jul 2018)");
  script_name("Oracle Database Server 'Core RDBMS' Component Unspecified Vulnerability");

  script_tag(name:"summary", value:"This host is running Oracle Database Server
  and is prone to an unspecified vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to an unspecified error in
  component 'Core RDBMS'.");

  script_tag(name:"impact", value:"Successfully exploitation will allow remote
  attackers to have an impact on availability and integrity via unknown vectors.

  Impact Level: Application");

  script_tag(name:"affected", value:"Oracle Database Server versions 12.2.0.1,
  12.1.0.2, 11.2.0.4, 18.1 and 18.2");

  script_tag(name:"solution", value:"Apply appropriate patch provided by the vendor.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/security-advisory/cpujul2018-4258247.html#AppendixDB");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/database/in-memory/downloads/index.html");
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

affected = make_list('11.2.0.4', '12.1.0.2', '12.2.0.1', '18.1', '18.2');
foreach version (affected)
{
  if(dbVer == version)
  {
    report = report_fixed_ver(installed_version:dbVer, fixed_version: "Apply the patch", install_path:path);
    security_message(port:dbport, data:report);
    exit(0);
  }
}
exit(0);
