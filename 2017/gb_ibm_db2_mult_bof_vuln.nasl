###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_db2_mult_bof_vuln.nasl 11835 2018-10-11 08:38:49Z mmartin $
#
# IBM DB2 Multiple Buffer OVerflow Vulnerabilities
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

CPE = "cpe:/a:ibm:db2";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811403");
  script_version("$Revision: 11835 $");
  script_cve_id("CVE-2017-1297");
  script_bugtraq_id(99264);
  script_tag(name:"cvss_base", value:"4.4");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 10:38:49 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-29 13:12:55 +0530 (Thu, 29 Jun 2017)");
  script_name("IBM DB2 Command Line Processor Buffer Overflow Vulnerability Jun17");

  script_tag(name:"summary", value:"This host is running IBM DB2 and is
  prone to buffer overflow vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an improper
  bounds checking.");

  script_tag(name:"impact", value:"Successful exploitation will allow a local
  attacker to execute arbitrary code.");

  script_tag(name:"affected", value:"IBM DB2 versions 9.7 before FP11
  IBM DB2 versions 10.1 before FP6
  IBM DB2 versions 10.5 before FP8
  IBM DB2 versions 11.1.2 before FP2");

  script_tag(name:"solution", value:"Apply the appropriate fix");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg22004878");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("gb_ibm_db2_remote_detect.nasl");
  script_mandatory_keys("IBM-DB2/installed");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swq22004878");
  exit(0);
}


include("http_func.inc");
include("host_details.inc");
include("version_func.inc");

if(!ibmPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!ibmVer = get_app_version(cpe:CPE, port:ibmPort)){
  exit(0);
}

if(ibmVer =~ "^0907\.*")
{
  ## IBM DB2 9.7 FP11 => 090711
  if(version_is_less(version:ibmVer, test_version:"090711")){
    fix  = "9.7 FP11";
  }
}

else if(ibmVer =~ "^1001\.*")
{
  ## IBM DB2 10.1 FP6 => 10016
  if(version_is_less(version:ibmVer, test_version:"10016")) {
    fix  = "IBM DB2 10.1 FP6";
  }
}

else if(ibmVer =~ "^1005\.*")
{
  ## IBM DB2 10.5 FP8=> 10058
  if(version_is_less(version:ibmVer, test_version:"10058")) {
    fix  = "IBM DB2 10.5 FP8";
  }
}

else if(ibmVer =~ "^1101\.*")
{
  ## IBM DB2 11.1.2 FP2 => 110122
  if(version_is_less(version:ibmVer, test_version:"110122")){
    fix  = "IBM DB2 11.1.2 FP2";
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:ibmVer, fixed_version:fix);
  security_message(data:report, port:ibmPort);
  exit(0);
}
