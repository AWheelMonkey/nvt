###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_connect_cmd_inj_n_file_upload_vuln.nasl 10349 2018-06-27 15:50:28Z cfischer $
#
# Adobe Connect Command Injection And Unrestricted File Upload Vulnerabilities
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:adobe:connect";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813038");
  script_version("$Revision: 10349 $");
  script_cve_id("CVE-2018-4921", "CVE-2018-4923");
  script_bugtraq_id(103393, 103391);
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-06-27 17:50:28 +0200 (Wed, 27 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-03-15 11:20:29 +0530 (Thu, 15 Mar 2018)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Adobe Connect Command Injection And Unrestricted File Upload Vulnerabilities");

  script_tag(name: "summary" , value:"The host is installed with Adobe Connect
  and is prone to a command injection and unrestricted file upload 
  vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,

  - An unrestricted SWF file upload.

  - An OS command-injection vulnerability because it fails to properly sanitize 
    user-supplied input.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to inject and execute arbitrary commands within the context of the 
  affected application; this may aid in further attacks and upload arbitrary files 
  to the affected computer.

  Impact Level: Application");

  script_tag(name:"affected", value:"Adobe Connect versions 9.7 and earlier");

  script_tag(name:"solution", value:"Upgrade to Adobe Connect version 9.7.5 or 
  later, For updates refer to http://www.adobe.com");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "https://helpx.adobe.com/security/products/connect/apsb18-06.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_adobe_connect_detect.nasl");
  script_mandatory_keys("adobe/connect/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

acPort = "";
acVer = "";

if(!acPort = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location(cpe:CPE, port:acPort, exit_no_version:TRUE);
acVer = infos['version'];
acPath = infos['location'];

if(version_is_less_equal(version:acVer, test_version:"9.7"))
{
  report = report_fixed_ver(installed_version:acVer, fixed_version:"9.7.5", install_path:acPath);
  security_message(data:report, port:acPort);
  exit(0);
}
exit(0);
