###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_squid_dos_vuln_squid_2018_3.nasl 10302 2018-06-22 13:15:51Z cfischer $
#
# Squid Proxy Cache Denial of Service Vulnerability (SQUID-2018:3)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = 'cpe:/a:squid-cache:squid';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813402");
  script_version("$Revision: 10302 $");
  script_cve_id("CVE-2018-1172");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-06-22 15:15:51 +0200 (Fri, 22 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-05-22 12:25:41 +0530 (Tue, 22 May 2018)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("Squid Proxy Cache Denial of Service Vulnerability (SQUID-2018:3)");

  script_tag(name: "summary" , value:"The host is installed with Squid and is
  prone to  denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to incorrect pointer
  handling.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause a denial of service.

  Impact Level: Application");

  script_tag(name:"affected", value:"Squid versions 3.1.12.2 through 3.1.23,
  3.2.0.8 through 3.2.14 and 3.3 through 4.0.12");

  script_tag(name:"solution", value:"Upgrade to Squid version 4.0.13 or later.
  Patch and workaround is also available. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "http://www.squid-cache.org/Advisories/SQUID-2018_3.txt");
  script_xref(name : "URL" , value : "http://www.squid-cache.org");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_squid_detect.nasl");
  script_mandatory_keys("squid_proxy_server/installed");
  script_require_ports("Services/www", 3128, 8080);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!port = get_app_port(cpe: CPE)){
  exit(0);
}

infos = get_app_version_and_location( cpe:CPE, port:port, exit_no_version:TRUE );
version = infos['version'];
path = infos['location'];

if(version_in_range(version:version, test_version:"3.1.12.2", test_version2: "3.1.23")||
   version_in_range(version:version, test_version:"3.2.0.8", test_version2: "3.2.14")||
   version_in_range(version:version, test_version:"3.3", test_version2: "4.0.12"))
{
  report = report_fixed_ver(installed_version:version, fixed_version:"4.0.13", install_path:path);
  security_message(port:port, data:report);
  exit(0);
}
exit(0);
