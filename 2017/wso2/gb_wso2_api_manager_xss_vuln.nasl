###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wso2_api_manager_xss_vuln.nasl 12106 2018-10-26 06:33:36Z cfischer $
#
# WSO2 API Manager XSS Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:wso2:carbon_api_manager";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140392");
  script_version("$Revision: 12106 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 08:33:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-09-22 15:30:59 +0700 (Fri, 22 Sep 2017)");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");

  script_cve_id("CVE-2017-14651");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("WSO2 API Manager XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_wso2_carbon_detect.nasl");
  script_mandatory_keys("wso2_carbon_api_manager/installed");

  script_tag(name:"summary", value:"WSO2 API Manager is prone to a cross-site scripting vulnerability.");

  script_tag(name:"insight", value:"A potential Reflected Cross-Site Scripting (XSS) vulnerability has been identified in the Management Console.");

  script_tag(name:"impact", value:"By leveraging an XSS attack, an attacker can make the browser get redirected
to a malicious website, make changes in the UI of the web page, retrieve information from the browser or harm
otherwise.");

  script_tag(name:"affected", value:"WSO2 API Manager 2.1.0 and probably prior.");

  script_tag(name:"solution", value:"Apply the provide patch.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_xref(name:"URL", value:"https://docs.wso2.com/display/Security/Security+Advisory+WSO2-2017-0265");
  script_xref(name:"URL", value:"https://github.com/cybersecurityworks/Disclosed/issues/15");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less_equal(version: version, test_version: "2.1.0")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "Apply patch");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
