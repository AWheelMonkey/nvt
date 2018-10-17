###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_tomcat_mod_jk_bof_vuln_win.nasl 8975 2018-02-28 10:27:08Z santu $
#
# Apache Tomcat JK Connector Buffer Overflow Vulnerability (Windows)
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

CPE = "cpe:/a:apache:mod_jk";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812786");
  script_version("$Revision: 8975 $");
  script_cve_id("CVE-2016-6808");
  script_bugtraq_id(93429);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-02-28 11:27:08 +0100 (Wed, 28 Feb 2018) $");
  script_tag(name:"creation_date", value:"2018-02-27 10:49:53 +0530 (Tue, 27 Feb 2018)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Apache Tomcat JK Connector Buffer Overflow Vulnerability (Windows)");

  script_tag(name:"summary", value:"This host is installed with Apache Tomcat
  JK connector and is prone to buffer overflow vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists as IIS/ISAPI specific code
  implements special handling when a virtual host is present. The virtual host 
  name and the URI are concatenated to create a virtual host mapping rule.
  The length checks prior to writing to the target buffer for this rule did not 
  take account of the length of the virtual host name.");

  script_tag(name:"impact", value:"Successfully exploiting this issue will allow
  remote attackers to execute arbitrary code in the context of the user running the 
  application. Failed exploit attempts will likely result in denial-of-service 
  conditions.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Apache Tomcat JK Connector 1.2.0 through 1.2.41 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Apache Tomcat JK Connector 
  version 1.2.42 or later. For updates refer to
  http://tomcat.apache.org/security-jk.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://tomcat.apache.org/security-jk.html");
  script_xref(name:"URL", value:"https://packetstormsecurity.com/files/139071");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("gb_apache_mod_jk_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("apache_modjk/installed","Host/runs_windows");
  script_require_ports("Services/www", 8080);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

tomPort = "";
appVer = "";

if(!tomPort = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location(cpe:CPE, port:tomPort, exit_no_version:TRUE);
appVer = infos['version'];
path = infos['location'];

if(appVer =~ "1\.2")
{
  if(version_in_range(version:appVer, test_version: "1.2.0", test_version2: "1.2.41"))
  {
    report = report_fixed_ver(installed_version:appVer, fixed_version:"1.2.42", install_path:path);
    security_message(port:tomPort, data: report);
    exit(0);
  }  
}
exit(0);
