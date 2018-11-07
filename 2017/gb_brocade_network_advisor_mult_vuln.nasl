###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_brocade_network_advisor_mult_vuln.nasl 12106 2018-10-26 06:33:36Z cfischer $
#
# Brocade Network Advisor Multiple Vulnerabilities
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

CPE = "cpe:/a:brocade:network_advisor";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106516");
  script_version("$Revision: 12106 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 08:33:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-01-16 10:12:31 +0700 (Mon, 16 Jan 2017)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_cve_id("CVE-2016-8204", "CVE-2016-8205", "CVE-2016-8206", "CVE-2016-8207");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Brocade Network Advisor Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_brocade_network_advisor_detect.nasl");
  script_mandatory_keys("brocade_network_advisor/installed");

  script_tag(name:"summary", value:"Brocade Network Advisor is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Brocade Network Advisor is prone to multiple vulnerabilities:

  - Directory Traversal vulnerability in FileReceiveServlet (CVE-2016-8204)

  - Directory Traversal vulnerability in DashboardFileReceiveServlet (CVE-2016-8205)

  - Directory Traversal vulnerability in servlet SoftwareImageUpload (CVE-2016-8206)

  - Directory Traversal vulnerability in CliMonitorReportServlet (CVE-2016-8207)");

  script_tag(name:"impact", value:"A remote attacker may upload and execute malicious files, read or delete
arbitrary files.");

  script_tag(name:"affected", value:"Brocade Network Advisor 14.0.2 and prior.");

  script_tag(name:"solution", value:"Upgrade to Version 14.0.3, 14.1.1 or later");

  script_xref(name:"URL", value:"https://www.brocade.com/content/dam/common/documents/content-types/security-bulletin/brocade-security-advisory-2016-177.htm");
  script_xref(name:"URL", value:"https://www.brocade.com/content/dam/common/documents/content-types/security-bulletin/brocade-security-advisory-2016-178.htm");
  script_xref(name:"URL", value:"https://www.brocade.com/content/dam/common/documents/content-types/security-bulletin/brocade-security-advisory-2016-179.htm");
  script_xref(name:"URL", value:"https://www.brocade.com/content/dam/common/documents/content-types/security-bulletin/brocade-security-advisory-2016-180.htm");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "14.0.3")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "14.0.3");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
