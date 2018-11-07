###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_db_java_vm_component_unspecified_vuln_aug18.nasl 12068 2018-10-25 07:21:15Z mmartin $
#
# Oracle Database Server 'Java VM' Component Unspecified Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.813823");
  script_version("$Revision: 12068 $");
  script_cve_id("CVE-2018-3110");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-25 09:21:15 +0200 (Thu, 25 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-08-13 15:10:36 +0530 (Mon, 13 Aug 2018)");
  script_name("Oracle Database Server 'Java VM' Component Unspecified Vulnerability");

  script_tag(name:"summary", value:"This host is running Oracle Database Server
  and is prone to an unspecified security vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an unspecified error in
  component 'Java VM'.");

  script_tag(name:"impact", value:"Successfully exploitation will allow remote
  attackers to affect confidentiality, integrity and availability via unknown
  vectors.");

  script_tag(name:"affected", value:"Oracle Database Server versions 12.1.0.2");
  script_tag(name:"solution", value:"Apply the patch from Reference link.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/security-advisory/alert-cve-2018-3110-5032149.html");
  script_xref(name:"URL", value:"https://blogs.oracle.com/oraclesecurity/security-alert-cve-2018-3110-released");
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

if(dbVer == "12.1.0.2")
{
  report = report_fixed_ver(installed_version:dbVer, fixed_version:"Apply the appropriate patch.", install_path:path);
  security_message(data:report, port:dbport);
  exit(0);
}
exit(0);
