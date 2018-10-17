###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tomcat_securitymanager_sec_bypass_vuln_june15_lin.nasl 2015-06-16 15:04:10 +0530 Jun$
#
# Apache Tomcat SecurityManager Security Bypass Vulnerability - Jun15 (Linux)
#
# Authors:
# Deependra Bapna <bdeependra@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:apache:tomcat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805701");
  script_version("$Revision: 11872 $");
  script_cve_id("CVE-2014-7810");
  script_bugtraq_id(74665);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-06-16 15:04:10 +0530 (Tue, 16 Jun 2015)");
  script_name("Apache Tomcat SecurityManager Security Bypass Vulnerability - Jun15 (Linux)");

  script_tag(name:"summary", value:"This host is installed with Apache Tomcat
  and is prone to security bypass vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to the Expression Language
  does not properly consider the possibility of an accessible interface
  implemented by an inaccessible class.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to bypass certain authentication and obtain sensitive information.");

  script_tag(name:"affected", value:"Apache Tomcat 6.x before 6.0.44,
  7.x before 7.0.58, and 8.x before 8.0.16 on Linux.");

  script_tag(name:"solution", value:"Upgrade to version 6.0.44 or 7.0.58 or
  8.0.16 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-6.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-7.html");
  script_xref(name:"URL", value:"http://openwall.com/lists/oss-security/2015/04/10/1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("gb_apache_tomcat_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("ApacheTomcat/installed", "Host/runs_unixoide");
  script_require_ports("Services/www", 8080);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!appPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!appVer = get_app_version(cpe:CPE, port:appPort)){
  exit(0);
}

if(appVer =~ "^6\.0")
{
  if(version_in_range(version:appVer, test_version:"6.0", test_version2:"6.0.43"))
  {
    fix = "6.0.44";
    VULN = TRUE;
  }
}

if(appVer =~ "^7\.0")
{
  if(version_in_range(version:appVer, test_version:"7.0", test_version2:"7.0.57"))
  {
    fix = "7.0.58";
    VULN = TRUE;
  }
}

if(appVer =~ "^8\.0")
{
  if(version_in_range(version:appVer, test_version:"8.0", test_version2:"8.0.15"))
  {
    fix = "8.0.16";
    VULN = TRUE;
  }
}

if(VULN)
{
  report = 'Installed version: ' + appVer + '\n' +
           'Fixed version:     ' + fix  + '\n';
  security_message(data:report, port:appPort);
  exit(0);
}
