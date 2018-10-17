###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_mysql_multiple_vuln04_nov12_win.nasl 11580 2018-09-25 06:06:13Z cfischer $
#
# Oracle MySQL Server Multiple Vulnerabilities-04 Nov12 (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803114");
  script_version("$Revision: 11580 $");
  script_cve_id("CVE-2012-3147", "CVE-2012-3149", "CVE-2012-3144");
  script_bugtraq_id(56022, 56006, 56008);
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-25 08:06:13 +0200 (Tue, 25 Sep 2018) $");
  script_tag(name:"creation_date", value:"2012-11-26 17:58:56 +0530 (Mon, 26 Nov 2012)");
  script_name("Oracle MySQL Server Multiple Vulnerabilities-04 Nov12 (Windows)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/51008/");
  script_xref(name:"URL", value:"http://www.securelist.com/en/advisories/51008");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/cpuoct2012-1515893.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("Databases");
  script_tag(name:"qod_type", value:"remote_banner");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MySQL/installed", "Host/runs_windows");
  script_tag(name:"impact", value:"Successful exploitation will allow an attacker to disclose potentially
  sensitive information, manipulate certain data, and cause a DoS
  (Denial of Service).");
  script_tag(name:"affected", value:"Oracle MySQL version 5.5.x to 5.5.26 on windows");
  script_tag(name:"insight", value:"The flaws are due to multiple unspecified errors in MySQL server component
  vectors related to MySQL client and server.");
  script_tag(name:"solution", value:"Apply the patch or upgrade to latest version,
  https://support.oracle.com/rs?type=doc&id=1475188.1");
  script_tag(name:"summary", value:"The host is running Oracle MySQL server and is prone to multiple
  vulnerabilities.");
  script_tag(name:"solution_type", value:"VendorFix");
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
if(mysqlVer[1])
{
  ## Oracle MySQL version 5.5.x to 5.5.26
  if(version_in_range(version:mysqlVer[1], test_version:"5.5.0 ", test_version2:"5.5.26")){
    security_message(port:sqlPort);
  }
}
