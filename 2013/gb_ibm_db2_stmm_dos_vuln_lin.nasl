###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_db2_stmm_dos_vuln_lin.nasl 11888 2018-10-12 15:27:49Z cfischer $
#
# IBM DB2 STMM Denial Of Service Vulnerability (Linux)
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
  script_oid("1.3.6.1.4.1.25623.1.0.803766");
  script_version("$Revision: 11888 $");
  script_cve_id("CVE-2011-1373");
  script_bugtraq_id(50686);
  script_tag(name:"cvss_base", value:"1.5");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 17:27:49 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-09-30 17:51:03 +0530 (Mon, 30 Sep 2013)");
  script_name("IBM DB2 STMM Denial Of Service Vulnerability (Linux)");


  script_tag(name:"summary", value:"This host is running IBM DB2 and is prone to denial of service vulnerability.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"solution", value:"Upgrade to IBM DB2 9.7 FP5 or later.");
  script_tag(name:"insight", value:"The flaw is due an error when the Self Tuning Memory Manager (STMM) feature
and the AUTOMATIC DATABASE_MEMORY setting are configured.");
  script_tag(name:"affected", value:"IBM DB2 version 9.7 before FP5 on Linux.");
  script_tag(name:"impact", value:"Successful exploitation will allow attacker to allows local users to cause a
denial of service (daemon crash) via unknown vectors.");
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/71043");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg1IC70473");
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

if(ibmVer =~ "^0907\.*")
{
  ## IBM DB2 version 9.7.x before FP5,
  if(version_is_less(version:ibmVer, test_version:"09075"))
  {
    security_message(port:ibmPort);
    exit(0);
  }
}
