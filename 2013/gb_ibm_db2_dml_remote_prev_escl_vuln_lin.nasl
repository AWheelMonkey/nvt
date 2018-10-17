###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_db2_dml_remote_prev_escl_vuln_lin.nasl 11878 2018-10-12 12:40:08Z cfischer $
#
# IBM DB2 DML Statement Execution Remote Privilege Escalation Vulnerability (Linux)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################
CPE = "cpe:/a:ibm:db2";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803758");
  script_version("$Revision: 11878 $");
  script_cve_id("CVE-2013-4033");
  script_bugtraq_id(62018);
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:40:08 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-09-05 17:50:25 +0530 (Thu, 05 Sep 2013)");
  script_name("IBM DB2 DML Statement Execution Remote Privilege Escalation Vulnerability (Linux)");


  script_tag(name:"summary", value:"This host is running IBM DB2 and is prone to privilege escalation
vulnerability.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"solution", value:"Apply the appropriate fix");
  script_tag(name:"insight", value:"The flaw is due to the program failing to limit users from the EXPLAIN
authority, which will allow a remote attacker to potentially execute the SELECT,
INSERT, UPDATE or DELETE DML statements with elevated privileges.");
  script_tag(name:"affected", value:"IBM DB2 versions 9.8 through FP5 on Linux.");
  script_tag(name:"impact", value:"Successful exploitation will allow attacker to gain escalated privileges and
bypass certain security restrictions.");
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/54644");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/86093");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21646809");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
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

if(!ibmVer = get_app_version(cpe:CPE, port:ibmPort)){
  exit(0);
}

if(ibmVer =~ "^0908\.*")
{
  ## IBM DB2 9.8 through FP5
  ## IBM DB2 9.8 FP5 => 09085
  if(version_is_less_equal(version:ibmVer, test_version:"09085"))
  {
    security_message(port:ibmPort);
    exit(0);
  }
}
