###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_websphere_security_bypass_vuln01_mar16.nasl 8598 2018-01-31 09:59:32Z cfischer $
#
# IBM Websphere Apllication Server Security Bypass Vulnerability-01 Mar16
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:ibm:websphere_application_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806892");
  script_version("$Revision: 8598 $");
  script_cve_id("CVE-2014-3070");
  script_bugtraq_id(69296);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-01-31 10:59:32 +0100 (Wed, 31 Jan 2018) $");
  script_tag(name:"creation_date", value:"2016-03-03 18:23:51 +0530 (Thu, 03 Mar 2016)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("IBM Websphere Apllication Server Security Bypass Vulnerability-01 Mar16");

  script_tag(name: "summary" , value:"This host is installed with IBM Websphere 
  apllication server and is prone to Security Bypass vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight", value:"The flaw is due to an improper account creation
  with the Virtual Member Manager SPI Admin Task addFileRegistryAccount.");

  script_tag(name: "impact" , value:"Successful exploitation will allow a remote
  attacker to bypass security restrictions.  
  
  Impact Level: Application");

  script_tag(name: "affected" , value:"IBM WebSphere Application Server (WAS)
  8.0.0.6 before 8.0.0.10 and 8.5.x before 8.5.5.3.");

  script_tag(name: "solution" , value:"Upgrade to IBM WebSphere Application
  Server (WAS) version 8.0.0.10,  or 8.5.5.3, or later.
  For updates refer to http://www-01.ibm.com/support/docview.wss?uid=swg21671835");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www-01.ibm.com/support/docview.wss?uid=swg21681249");
  
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ibm_websphere_detect.nasl");
  script_mandatory_keys("ibm_websphere_application_server/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!wasPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!wasVer = get_app_version(cpe:CPE, port:wasPort)){
  exit(0);
}

if(version_in_range(version:wasVer, test_version:"8.0.0.6", test_version2:"8.0.0.9"))
{
  fix = "8.0.0.10";
  VULN = TRUE;
}

else if(version_in_range(version:wasVer, test_version:"8.5", test_version2:"8.5.5.2"))
{
  fix = "8.5.5.3";
  VULN = TRUE;  
}

if(VULN)
{
  report = report_fixed_ver(installed_version:wasVer, fixed_version:fix);
  security_message(data:report, port:wasPort);
  exit(0);
}
