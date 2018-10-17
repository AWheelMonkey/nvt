###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_websphere_xss_vuln01_feb16.nasl 8597 2018-01-31 08:42:52Z cfischer $
#
# IBM Websphere Apllication Server Cross Site Scripting Vulnerability-01 Feb16
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
  script_oid("1.3.6.1.4.1.25623.1.0.806872");
  script_version("$Revision: 8597 $");
  script_cve_id("CVE-2015-7417");
  script_bugtraq_id(81738);
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-01-31 09:42:52 +0100 (Wed, 31 Jan 2018) $");
  script_tag(name:"creation_date", value:"2016-02-16 17:20:05 +0530 (Tue, 16 Feb 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("IBM Websphere Apllication Server Cross Site Scripting Vulnerability-01 Feb16");

  script_tag(name: "summary" , value:"This host is installed with IBM Websphere
  apllication server and is prone to XSS vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight", value:"The flaw is due to due to an improper
  validation of user-supplied input.");

  script_tag(name: "impact" , value:"Successful exploitation will allow a remote
  attacker to execute script in a victim's Web browser within the security
  context of the hosting Web site, once the URL is clicked, also could steal the
  victim's cookie-based authentication credentials

  Impact Level: Application");

  script_tag(name: "affected" , value:"IBM WebSphere Application Server (WAS)
  7.0 before 7.0.0.41, 8.0 before 8.0.0.12, and 8.5 before 8.5.5.9.");

  script_tag(name: "solution" , value:"Upgrade to IBM WebSphere Application
  Server (WAS) version 7.0.0.41, or 8.0.0.12, or 8.5.5.9, or later.
  For updates refer to http://www-03.ibm.com/software/products/en/appserv-was");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www-01.ibm.com/support/docview.wss?uid=swg21974520");
 
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

if(version_in_range(version:wasVer, test_version:"7.0", test_version2:"7.0.0.40"))
{
   fix = "7.0.0.41";
   VULN = TRUE;
}

else if(version_in_range(version:wasVer, test_version:"8.0", test_version2:"8.0.0.11"))
{
   fix = "8.0.0.12";
   VULN = TRUE;
}

else if(version_in_range(version:wasVer, test_version:"8.5", test_version2:"8.5.5.8"))
{
   fix = "8.5.5.9";
   VULN = TRUE;
}

if(VULN)
{
  report = report_fixed_ver(installed_version:wasVer, fixed_version:fix);
  security_message(data:report, port:wasPort);
  exit(0);
}
