###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_mult_dos_vuln_jan11.nasl 12018 2018-10-22 13:31:29Z mmartin $
#
# MySQL Multiple Denial of Service Vulnerabilities
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
CPE = "cpe:/a:mysql:mysql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801571");
  script_version("$Revision: 12018 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-22 15:31:29 +0200 (Mon, 22 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-01-21 14:38:54 +0100 (Fri, 21 Jan 2011)");
  script_cve_id("CVE-2010-3833", "CVE-2010-3834", "CVE-2010-3836",
                "CVE-2010-3837", "CVE-2010-3838");
  script_bugtraq_id(43676);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("MySQL Multiple Denial of Service Vulnerabilities");
  script_xref(name:"URL", value:"http://secunia.com/advisories/42875");
  script_xref(name:"URL", value:"http://bugs.mysql.com/bug.php?id=54568");
  script_xref(name:"URL", value:"http://dev.mysql.com/doc/refman/5.5/en/news-5-5-6.html");
  script_xref(name:"URL", value:"http://dev.mysql.com/doc/refman/5.0/en/news-5-0-92.html");
  script_xref(name:"URL", value:"http://dev.mysql.com/doc/refman/5.1/en/news-5-1-51.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("mysql_version.nasl");
  script_require_ports("Services/mysql", 3306);
  script_tag(name:"impact", value:"Successful exploitation could allow an attacker to cause a denial of service
  and to execute arbitrary code.");
  script_tag(name:"affected", value:"MySQL 5.0 before 5.0.92, 5.1 before 5.1.51, and 5.5 before 5.5.6");
  script_tag(name:"insight", value:"The flaws are due to:

  - An error in propagating the type errors, which allows remote attackers
     to cause a denial of service via crafted arguments to extreme-value functions
     such as 'LEAST' or 'GREATEST'.

  - An unspecified error in vectors related to materializing a derived table
     that required a temporary table for grouping and user variable
     assignments.

  - An error in handling prepared statements that uses GROUP_CONCAT with the
     WITH ROLLUP modifier.

  - An error in handling a query that uses the GREATEST or LEAST function
     with a mixed list of numeric and LONGBLOB arguments.");
  script_tag(name:"solution", value:"Upgrade to MySQL version 5.0.92, or 5.1.51 or 5.5.6");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"The host is running MySQL and is prone to multiple denial of
  service vulnerabilities.");
  script_xref(name:"URL", value:"http://dev.mysql.com/downloads");
  exit(0);
}


include("misc_func.inc");
include("version_func.inc");

include("host_details.inc");

sqlPort = get_app_port(cpe:CPE);
if(!sqlPort){
  sqlPort = 3306;
}

if(!get_port_state(sqlPort)){
  exit(0);
}

mysqlVer = get_app_version(cpe:CPE, port:sqlPort);
if(isnull(mysqlVer)){
  exit(0);
}

mysqlVer = eregmatch(pattern:"([0-9.a-z]+)", string:mysqlVer);
if(!isnull(mysqlVer[1]))
{
  if(version_in_range(version:mysqlVer[1], test_version:"5.0",test_version2:"5.0.91") ||
     version_in_range(version:mysqlVer[1], test_version:"5.1",test_version2:"5.1.50") ||
     version_in_range(version:mysqlVer[1], test_version:"5.5",test_version2:"5.5.5")){
    security_message(sqlPort);
  }
}
