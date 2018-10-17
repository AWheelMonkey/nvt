###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_struts_mult_vuln_nov16_win.nasl 60709 2016-11-18 14:28:02 +0530 Nov$
#
# Apache Struts Multiple Vulnerabilities Nov16 (Windows)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:apache:struts";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808536");
  script_version("$Revision: 7545 $");
  script_cve_id("CVE-2016-4438", "CVE-2016-4431", "CVE-2016-4433", "CVE-2016-4430");
  script_bugtraq_id(91275, 91284, 91282, 91281);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:45:30 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2016-11-18 14:28:02 +0530 (Fri, 18 Nov 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Apache Struts Multiple Vulnerabilities Nov16 (Windows)");

  script_tag(name:"summary", value:"This host is running Apache Struts and is
  prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,
  - An error in REST Plugin.
  - An improper input validation.
  - An improper input validation in Getter method.
  - Mishandles token validation.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to inject arbitrary code or to bypass intended access restrictions
  and conduct redirection attacks or to conduct cross-site request forgery.

  Impact Level: Application");

  script_tag(name:"affected", value:"Apache Struts Version 2.3.20 through
  2.3.28.1 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Apache Struts Version 2.3.29 or
  later. For updates refer to http://struts.apache.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://struts.apache.org/docs/s2-037.html");
  script_xref(name : "URL" , value : "https://struts.apache.org/docs/s2-038.html");
  script_xref(name : "URL" , value : "https://struts.apache.org/docs/s2-039.html");
  script_xref(name : "URL" , value : "https://struts.apache.org/docs/s2-040.html");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_apache_struts_detect.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 8080);
  script_mandatory_keys("ApacheStruts/installed", "Host/runs_windows");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
appVer = "";
appPort = "";

## Get Port
if(!appPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get version
if(!appVer = get_app_version(cpe:CPE, port:appPort)){
  exit(0);
}

## Vulnerable version according to Advisory
## Check the vulnerable version
if(appVer =~ "^(2\.3)")
{
  if(version_in_range(version:appVer, test_version:"2.3.20", test_version2:"2.3.28.1"))
  {
    report = report_fixed_ver(installed_version:appVer, fixed_version:"2.3.29");
    security_message(data:report, port:appPort);
    exit(0);
  }
}
