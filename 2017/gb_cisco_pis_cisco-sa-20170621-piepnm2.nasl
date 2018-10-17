###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_pis_cisco-sa-20170621-piepnm2.nasl 11874 2018-10-12 11:28:04Z mmartin $
#
# Cisco Prime Infrastructure SQL Injection Vulnerability
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

CPE = "cpe:/a:cisco:prime_infrastructure";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106898");
  script_cve_id("CVE-2017-6698");
  script_tag(name:"cvss_base", value:"5.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:N");
  script_version("$Revision: 11874 $");

  script_name("Cisco Prime Infrastructure SQL Injection Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170621-piepnm2");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"Update to version 3.1.6, 3.2 or later.");

  script_tag(name:"summary", value:"A vulnerability in the Cisco Prime Infrastructure (PI) SQL database interface
could allow an authenticated, remote attacker to impact the confidentiality and integrity of the application by
executing arbitrary SQL queries.");

  script_tag(name:"insight", value:"The vulnerability is due to a lack of proper validation on user-supplied
input within SQL queries. An attacker could exploit this vulnerability by sending crafted URLs that contain
malicious SQL statements to the affected application.");

  script_tag(name:"impact", value:"An exploit could allow the attacker to determine the presence of certain
values and write malicious input to the SQL database.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:28:04 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-22 13:24:18 +0700 (Thu, 22 Jun 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_pis_version.nasl");
  script_mandatory_keys("cisco_pis/version");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe:CPE))
  exit(0);

if (version == "3.1.1") {
  report = report_fixed_ver(installed_version: version, fixed_version: "3.1.6");
  security_message(port: 0, data: report);
  exit(0);
}


exit(99);

