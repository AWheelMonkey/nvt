###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_stored_procedure_unspecified_vuln.nasl 11883 2018-10-12 13:31:09Z cfischer $
#
# MySQL Stored Procedure Unspecified Vulnerability
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.803483");
  script_version("$Revision: 11883 $");
  script_cve_id("CVE-2013-2376", "CVE-2013-1511");
  script_bugtraq_id(59227);
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 15:31:09 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-04-22 18:36:21 +0530 (Mon, 22 Apr 2013)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_name("MySQL Stored Procedure Unspecified Vulnerability");

  script_tag(name:"impact", value:"Successful exploitation could allow remote
  attackers to affect confidentiality, integrity, and availability via unknown
  vectors.");

  script_tag(name:"affected", value:"MySQL version 5.5.x before 5.5.31 and
  5.6.x before 5.6.11. on Linux");

  script_tag(name:"insight", value:"Unspecified error in some unknown vectors
  related to Stored Procedure.");

  script_tag(name:"solution", value:"Upgrade to MySQL version 5.5.31 or 5.6.11
  or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"summary", value:"The host is running MySQL and is prone to
  multiple unspecified vulnerability.");

  script_xref(name:"URL", value:"http://secunia.com/advisories/53022");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/cpuapr2013-1899555.html");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/cpuapr2013-1899555.html#AppendixMSQL");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Databases");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MySQL/installed", "Host/runs_unixoide");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!sqlPort = get_app_port(cpe:CPE)) exit(0);
mysqlVer = get_app_version(cpe:CPE, port:sqlPort);

if(mysqlVer && mysqlVer =~ "^(5\.(5|6))")
{
  if(version_in_range(version:mysqlVer, test_version:"5.5", test_version2:"5.5.30") ||
     version_in_range(version:mysqlVer, test_version:"5.6", test_version2:"5.6.10"))
  {
    security_message(sqlPort);
    exit(0);
  }
}
