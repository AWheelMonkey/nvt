###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_acs_cisco-sa-20170215-acs2.nasl 12106 2018-10-26 06:33:36Z cfischer $
#
# Cisco Secure Access Control System Open Redirect Vulnerability
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
# of the License, or (at your option) any later version.
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

CPE = "cpe:/a:cisco:secure_access_control_system";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106591");
  script_cve_id("CVE-2017-3840");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_version("$Revision: 12106 $");

  script_name("Cisco Secure Access Control System Open Redirect Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170215-acs2");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in the web interface of the Cisco Secure Access Control
System (ACS) could allow an unauthenticated, remote attacker to redirect a user to a malicious web page.");

  script_tag(name:"insight", value:"The vulnerability is due to improper input validation of the parameters in
the HTTP request. An attacker could exploit this vulnerability by crafting an HTTP request that could cause the
web application to redirect the request to a specific malicious URL.");

  script_tag(name:"impact", value:"This vulnerability is known as an open redirect attack and is used in
phishing attacks to get users to visit malicious sites without their knowledge.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-26 08:33:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-02-16 11:20:11 +0700 (Thu, 16 Feb 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_acs_version.nasl");
  script_mandatory_keys("cisco_acs/version");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe:CPE))
  exit(0);

if (version == "5.8(2.5)") {
  report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
  security_message(port: 0, data: report);
  exit(0);
}

exit(99);

