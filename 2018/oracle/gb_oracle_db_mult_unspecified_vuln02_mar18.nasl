###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_db_mult_unspecified_vuln02_mar18.nasl 12410 2018-11-19 10:06:05Z cfischer $
#
# Oracle Database Server Multiple Unspecified Vulnerabilities-02 March18
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
  script_oid("1.3.6.1.4.1.25623.1.0.812796");
  script_version("$Revision: 12410 $");
  script_cve_id("CVE-2011-0870", "CVE-2011-0848", "CVE-2011-0831", "CVE-2011-0816",
                "CVE-2011-0876", "CVE-2011-0879", "CVE-2011-2244", "CVE-2011-2257");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-11-19 11:06:05 +0100 (Mon, 19 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-03-07 15:14:30 +0530 (Wed, 07 Mar 2018)");
  script_name("Oracle Database Server Multiple Unspecified Vulnerabilities-02 March18");

  script_tag(name:"summary", value:"This host is running Oracle Database Server
  and is prone to multiple unspecified security vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to multiple unspecified
  errors in components 'Instance Management', 'Enterprise Manager Console',
  'Enterprise Config Management', 'CMDB Metadata & Instance APIs', 'Security
  Framework', 'Schema Management' and 'Database Target Type Menus'.");

  script_tag(name:"impact", value:"Successfully exploitation will allow remote
  attackers to affect confidentiality, integrity, and availability via unknown
  vectors.");

  script_tag(name:"affected", value:"Oracle Database Server versions
  10.1.0.5, 10.2.0.3, 10.2.0.4, 10.2.0.5, 11.1.0.7, 11.2.0.1, and 11.2.0.2");

  script_tag(name:"solution", value:"Apply the patch from the referenced advisory.");

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

affected = make_list('10.1.0.5', '10.2.0.3', '10.2.0.4', '10.2.0.5', '11.1.0.7', '11.2.0.1', '11.2.0.2');
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
