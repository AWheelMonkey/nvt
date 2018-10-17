###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_db2_dos_vuln_dec17.nasl 8367 2018-01-11 07:32:43Z cfischer $
#
# IBM DB2 Denial of Service Vulnerability Dec17
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
  script_oid("1.3.6.1.4.1.25623.1.0.812264");
  script_version("$Revision: 8367 $");
  script_cve_id("CVE-2014-6097");
  script_bugtraq_id(70983);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-01-11 08:32:43 +0100 (Thu, 11 Jan 2018) $");
  script_tag(name:"creation_date", value:"2017-12-15 15:19:39 +0530 (Fri, 15 Dec 2017)");
  script_name("IBM DB2 Denial of Service Vulnerability Dec17");

  script_tag(name: "summary" , value:"This host is running IBM DB2 and is
  prone to denial of service vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version of IBM DB2
  with the help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to an error in handling
  'ALTER TABLE' statement.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to cause the application to crash, resulting in denial-of-service 
  conditions.

  Impact Level: Application");

  script_tag(name: "affected" , value:"9.7 before FP10 and 9.8 through FP5");

  script_tag(name: "solution" , value:"Apply the appropriate fix from reference link");
  script_xref(name : "URL" , value : "http://www-01.ibm.com/support/docview.wss?uid=swg21684812");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("gb_ibm_db2_remote_detect.nasl");
  script_mandatory_keys("IBM-DB2/installed");
  exit(0);
}


include("http_func.inc");
include("host_details.inc");
include("version_func.inc");

ibmVer  = "";
ibmPort = "";
fix = "";

if(!ibmPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!infos = get_app_version_and_location( cpe:CPE, port:ibmPort, exit_no_version:TRUE)) exit(0);
ibmVer = infos['version'];
path = infos['location'];

if(ibmVer =~ "^0907\.*")
{

  ## IBM DB2 9.7 before FP10
  ## IBM DB2 9.7 FP10 => 090710
  if(version_is_less(version:ibmVer, test_version:"090710")){
    fix  = "IBM DB2 9.7 FP10";
  }
}

else if(ibmVer =~ "^0908\.*")
{
  ## IBM DB2 9.8 through FP5
  if(version_is_less_equal(version:ibmVer, test_version:"09085")){
    fix  = "Apply the appropriate patch from vendor";
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:ibmVer, fixed_version:fix, install_path:path);
  security_message(data:report, port:ibmPort);
  exit(0);
}
exit(0);
