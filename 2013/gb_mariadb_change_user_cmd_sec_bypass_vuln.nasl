###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mariadb_change_user_cmd_sec_bypass_vuln.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# MariaDB 'COM_CHANGE_USER' Command Insecure Salt Generation Security Bypass Vulnerability
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

CPE = "cpe:/a:mariadb:mariadb";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804037");
  script_version("$Revision: 11865 $");
  script_cve_id("CVE-2012-5627");
  script_bugtraq_id(56837);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-11-06 15:34:28 +0530 (Wed, 06 Nov 2013)");
  script_name("MariaDB 'COM_CHANGE_USER' Command Insecure Salt Generation Security Bypass Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MariaDB/installed", "Host/runs_windows");

  script_xref(name:"URL", value:"http://secunia.com/advisories/52015");
  script_xref(name:"URL", value:"http://seclists.org/fulldisclosure/2012/Dec/58");
  script_xref(name:"URL", value:"https://mariadb.atlassian.net/browse/MDEV-3915");

  script_tag(name:"summary", value:"This host is running MariaDB and is prone to security bypass vulnerability.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"solution", value:"Upgrade to MariaDB version 5.2.14, 5.3.12, 5.5.29 or later.");
  script_tag(name:"insight", value:"Flaw that is triggered when a remote attacker attempts to login to a user's
  account via the COM_CHANGE_USER command. This command fails to properly
  disconnect the attacker from the server upon a failed login attempt.");
  script_tag(name:"affected", value:"MariaDB versions 5.5.x before 5.5.29, 5.3.x before 5.3.12, and
  5.2.x before 5.2.14 on Windows");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to more easily
  gain access to a user's account via a brute-force attack.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://mariadb.org");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!mariadbPort = get_app_port(cpe:CPE)){
  exit(0);
}

mariadbVer = get_app_version(cpe:CPE, port:mariadbPort);
if(isnull(mariadbVer) ||  !(mariadbVer =~ "^(5.2|5.3|5.5)")){
  exit(0);
}

if(version_in_range(version:mariadbVer, test_version:"5.2", test_version2:"5.2.13") ||
   version_in_range(version:mariadbVer, test_version:"5.3", test_version2:"5.3.11") ||
   version_in_range(version:mariadbVer, test_version:"5.5", test_version2:"5.5.28"))
{
  fix = "5.2.14, or 5.3.12, or 5.5.29";
  report = report_fixed_ver(installed_version:mariadbVer, fixed_version:fix);
  security_message(port:mariadbPort, data:report);
  exit(0);
}

exit(99);