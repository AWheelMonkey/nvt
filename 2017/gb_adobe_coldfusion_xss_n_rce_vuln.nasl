###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_coldfusion_xss_n_rce_vuln.nasl 71989 2017-04-26 12:35:27Z Apr$
#
# Adobe ColdFusion Remote Code Execution And Cross Site Scripting Vulnerabilities
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

CPE = "cpe:/a:adobe:coldfusion";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810938");
  script_version("$Revision: 11863 $");
  script_cve_id("CVE-2017-3008", "CVE-2017-3066");
  script_bugtraq_id(98003, 98002);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-04-26 12:35:27 +0530 (Wed, 26 Apr 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Adobe ColdFusion Remote Code Execution And Cross Site Scripting Vulnerabilities");

  script_tag(name:"summary", value:"This host is running Adobe ColdFusion and is
  prone to cross site scripting and remote code execution vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - An unspecified input validation error.

  - A java deserialization error.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary code in the context of the affected application.
  Failed exploits will result in denial-of-service conditions, steal cookie-based
  authentication credentials and to launch other attacks.");

  script_tag(name:"affected", value:"ColdFusion 11 before 11 Update 12,
  and 10 before 10 Update 23, ColdFusion 2016 before update 4.");

  script_tag(name:"solution", value:"Upgrade to version 11 Update 12 or
  10 Update 23 or 2016 update 4 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/coldfusion/apsb17-14.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_coldfusion_detect.nasl");
  script_mandatory_keys("coldfusion/installed");
  script_require_ports("Services/www", 80);
  script_xref(name:"URL", value:"http://www.adobe.com");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!cfPort = get_app_port(cpe:CPE)){
  exit(0);
}

cfdVer = get_app_version(cpe:CPE, port:cfPort);
if(!cfdVer){
  exit(0);
}

## https://helpx.adobe.com/coldfusion/kb/coldfusion-10-update-23.html
if(version_in_range(version:cfdVer, test_version:"10.0", test_version2:"10.0.23.302579"))
{
  fix = "10.0.23.302580";
  VULN = TRUE;
}
## https://helpx.adobe.com/coldfusion/kb/coldfusion-11-update-12.html
else if(version_in_range(version:cfdVer, test_version:"11.0", test_version2:"11.0.12.302574"))
{
  fix = "11.0.12.302575";
  VULN = TRUE;
}
## https://helpx.adobe.com/coldfusion/kb/coldfusion-2016-update-4.html
else if(version_in_range(version:cfdVer, test_version:"2016.0", test_version2:"2016.0.04.302560"))
{
  fix = "2016.0.04.302561";
  VULN = TRUE;
}

if(VULN)
{
  report = report_fixed_ver(installed_version:cfdVer, fixed_version:fix);
  security_message(data:report, port:cfPort);
  exit(0);
}
