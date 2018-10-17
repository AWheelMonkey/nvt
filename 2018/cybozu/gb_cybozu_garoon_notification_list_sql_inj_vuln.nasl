###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cybozu_garoon_notification_list_sql_inj_vuln.nasl 10658 2018-07-27 11:41:40Z santu $
#
# Cybozu Garoon Notification List SQL Injection Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

CPE = 'cpe:/a:cybozu:garoon';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813267");
  script_version("$Revision: 10658 $");
  script_cve_id("CVE-2018-0607");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-07-27 13:41:40 +0200 (Fri, 27 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-27 11:06:53 +0530 (Fri, 27 Jul 2018)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Cybozu Garoon Notification List SQL Injection Vulnerability");

  script_tag(name: "summary" , value:"This host is installed with Cybozu Garoon
  and is prone to sql injection vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight", value:"The flaw is due to an input validation 
  error in 'Notification List'.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to execute arbitrary SQL commands via unspecified vectors.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Cybozu Garoon versions 3.5.0 to 4.6.2");

  script_tag(name: "solution" , value:"Upgrade to the Cybozu Garoon version 4.2.3
  or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "http://jvn.jp/en/jp/JVN13415512/index.html");
  script_xref(name : "URL" , value : "https://kb.cybozu.support/article/33120");
  script_xref(name : "URL" , value : "https://manual.cybozu.co.jp/en/desktop/install/install.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_cybozu_products_detect.nasl");
  script_mandatory_keys("CybozuGaroon/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!cyPort = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location(cpe:CPE, port:cyPort, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

if(version_in_range(version:vers, test_version:"3.5.0", test_version2:"4.6.2"))
{
  report = report_fixed_ver(installed_version:vers, fixed_version:"4.6.3 or later.", install_path:path);
  security_message(data:report, port:cyPort);
  exit(0);
}
