###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_db2_priv_esc_vuln_dec17.nasl 12142 2018-10-29 08:28:54Z cfischer $
#
# IBM DB2 Privilege Escalation Vulnerability Dec17
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:ibm:db2";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812265");
  script_version("$Revision: 12142 $");
  script_cve_id("CVE-2014-0907");
  script_bugtraq_id(67617);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-29 09:28:54 +0100 (Mon, 29 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-12-15 15:44:32 +0530 (Fri, 15 Dec 2017)");
  script_name("IBM DB2 Privilege Escalation Vulnerability Dec17");

  script_tag(name:"summary", value:"This host is running IBM DB2 and is
  prone to privilege escalation vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to multiple untrusted
  search path vulnerabilities in unspecified (1) setuid and (2) setgid programs.");

  script_tag(name:"impact", value:"Successful exploitation will allow local
  attackers to gain root privileges.");

  script_tag(name:"affected", value:"IBM DB2 9.5, 9.7 before FP9a, 9.8, 10.1
  before FP3a, and 10.5 before FP3.");

  script_tag(name:"solution", value:"Apply the appropriate fix from reference link");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21672100");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("gb_ibm_db2_remote_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("IBM-DB2/installed", "Host/runs_unixoide");
  exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("version_func.inc");

if(!ibmPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!infos = get_app_version_and_location( cpe:CPE, port:ibmPort, exit_no_version:TRUE)) exit(0);
ibmVer = infos['version'];
path = infos['location'];

if(ibmVer =~ "^1005\.*")
{
  ## IBM DB2 10.5 before FP3a
  ## IBM DB2 10.5 FP3 => 10053
  if(version_is_less_equal(version:ibmVer, test_version:"10053")){
    fix  = "IBM DB2 10.5 FP3a";
  }
}

else if(ibmVer =~ "^1001\.*")
{
  ## IBM DB2 10.1 before FP3a
  ## IBM DB2 10.1 FP3 => 10013
  if(version_is_less_equal(version:ibmVer, test_version:"10013")){
    fix  = "IBM DB2 10.1 FP3a or IBM DB2 10.1 FP4";
  }
}

else if(ibmVer =~ "^0907\.*")
{

  ## IBM DB2 9.7 before FP9a
  ## IBM DB2 9.7 FP9 => 09079
  if(version_is_less_equal(version:ibmVer, test_version:"09079")){
    fix  = "IBM DB2 9.7 FP9a";
  }
}

else if(ibmVer =~ "^(0905|0908)\.*"){
  ## A special build with an interim patch for this issue may be requested.
  fix  = "Apply the appropriate patch from vendor";
}

if(fix)
{
  report = report_fixed_ver(installed_version:ibmVer, fixed_version:fix, install_path:path);
  security_message(data:report, port:ibmPort);
  exit(0);
}

exit(0);
