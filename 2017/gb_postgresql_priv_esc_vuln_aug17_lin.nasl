###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_postgresql_priv_esc_vuln_aug17_lin.nasl 7543 2017-10-24 11:02:02Z cfischer $
#
# PostgreSQL Privilege Escalation Vulnerability - August17 (Linux)
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

CPE = "cpe:/a:postgresql:postgresql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811582");
  script_version("$Revision: 7543 $");
  script_cve_id("CVE-2017-7548");
  script_bugtraq_id(100276);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:02:02 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-08-17 12:50:23 +0530 (Thu, 17 Aug 2017)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("PostgreSQL Privilege Escalation Vulnerability - August17 (Linux)");

  script_tag(name:"summary", value:"This host is running PostgreSQL and is
  prone to privilege escalation vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to the 'lo_put' function 
  which should require the same permissions as 'lowrite' function, but there
  was a missing permission check.");

  script_tag(name:"impact", value:"Successful exploitation will allow a
  remote attacker to gain extra privileges and conduct a denial of service
  condition.

  Impact Level: Application");

  script_tag(name:"affected", value:"PostgreSQL version 9.4.x before 9.4.13, 
  and 9.5.x before 9.5.8 and 9.6.x before 9.6.4 on Linux.");

  script_tag(name:"solution", value:"Upgrade to version 9.4.13 or 9.5.8 or 
  9.6.4 or higher.
  For updates refer to http://www.postgresql.org/download");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://www.postgresql.org/about/news/1772/");
  script_xref(name : "URL" , value : "https://www.postgresql.org/docs/current/static/release-9.5.8.html");
  script_xref(name : "URL" , value : "https://www.postgresql.org/docs/current/static/release-9.4.13.html");
  
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Databases");
  script_dependencies("postgresql_detect.nasl","os_detection.nasl");
  script_mandatory_keys("PostgreSQL/installed","Host/runs_unixoide");
  script_require_ports("Services/postgresql", 5432);
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## Variable Initialization
pgsqlPort = "";
pgsqlVer = "";

## Get the default port
pgsqlPort = get_app_port(cpe:CPE);
if(!pgsqlPort){
  exit(0);
}

## Get the PostgreSQL version
if(!pgsqlVer = get_app_version(cpe:CPE, port:pgsqlPort)){
  exit(0);
}

if(pgsqlVer =~ "^(9\.4)")
{
  if(version_is_less(version:pgsqlVer, test_version:"9.4.13")){ 
    fix = "9.4.13";
  }
}

else if(pgsqlVer =~ "^(9\.5)")
{
  if(version_is_less(version:pgsqlVer, test_version:"9.5.8")){
    fix = "9.5.8";
  }
}

else if(pgsqlVer =~ "^(9\.6)")
{
  if(version_is_less(version:pgsqlVer, test_version:"9.6.4")){
    fix = "9.6.4";
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:pgsqlVer, fixed_version:fix);
  security_message(data:report, port:pgsqlPort);
  exit(0);
}
exit(0);
