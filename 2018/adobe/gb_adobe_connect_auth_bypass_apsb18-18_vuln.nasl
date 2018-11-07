###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_connect_auth_bypass_apsb18-18_vuln.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# Adobe Connect Authentication Bypass Vulnerability (APSB18-18)
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
  script_oid("1.3.6.1.4.1.25623.1.0.813361");
  script_version("$Revision: 12120 $");
  script_cve_id("CVE-2018-4994");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-05-11 12:59:18 +0530 (Fri, 11 May 2018)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  ## A mitigation is available to customers by modifying Tomcat filters to
  ## control remote access to system configuration files
  script_name("Adobe Connect Authentication Bypass Vulnerability (APSB18-18)");

  script_tag(name:"summary", value:"The host is installed with Adobe Connect
  and is prone to an authentication bypass vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an authentication
  bypass error.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to disclose sensitive information.");

  script_tag(name:"affected", value:"Adobe Connect versions prior to 9.8.1");

  script_tag(name:"solution", value:"Upgrade to Adobe Connect version 9.8.1 or
  later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/connect/apsb18-18.html");
  script_xref(name:"URL", value:"https://helpx.adobe.com/adobe-connect/connect-downloads-updates.html");
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

if(!acPort = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location(cpe:CPE, port:acPort, exit_no_version:TRUE);
acVer = infos['version'];
acPath = infos['location'];

if(version_is_less(version:acVer, test_version:"9.8.1"))
{
  report = report_fixed_ver(installed_version:acVer, fixed_version:"9.8.1", install_path:acPath);
  security_message(data:report, port:acPort);
  exit(0);
}
exit(0);
