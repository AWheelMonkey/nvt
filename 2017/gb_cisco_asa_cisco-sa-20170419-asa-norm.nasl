###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_asa_cisco-sa-20170419-asa-norm.nasl 11900 2018-10-15 07:44:31Z mmartin $
#
# Cisco ASA Software TCP Normalizer Denial of Service Vulnerability
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

CPE = "cpe:/a:cisco:asa";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106767");
  script_cve_id("CVE-2017-3793");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_version("$Revision: 11900 $");

  script_name("Cisco ASA Software TCP Normalizer Denial of Service Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170419-asa-norm");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in the TCP normalizer of Cisco Adaptive Security Appliance
(ASA) Software could allow an unauthenticated, remote attacker to cause Cisco ASA to drop any further incoming
traffic on all interfaces, resulting in a denial of service (DoS) condition.");

  script_tag(name:"insight", value:"The vulnerability is due to improper limitation of the global out-of-order
TCP queue for specific block sizes. An attacker could exploit this vulnerability by sending a large number of
unique permitted TCP connections with out-of-order segments.");

  script_tag(name:"impact", value:"An exploit could allow the attacker to exhaust available blocks in the global
out-of-order TCP queue, causing the dropping of any further incoming traffic on all interfaces and resulting in
a DoS condition.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-15 09:44:31 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-04-20 08:21:20 +0200 (Thu, 20 Apr 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_asa_version.nasl", "gb_cisco_asa_version_snmp.nasl");
  script_mandatory_keys("cisco_asa/version");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe: CPE, nofork: TRUE))
  exit(0);

check_vers = ereg_replace(string: version, pattern: "\(([0-9.]+)\)", replace: ".\1");

affected = make_list(
		'8.0.1.2',
		'8.0.2',
		'8.0.2.11',
		'8.0.2.15',
		'8.0.3',
		'8.0.3.12',
		'8.0.3.19',
		'8.0.3.6',
		'8.0.4',
		'8.0.4.16',
		'8.0.4.23',
		'8.0.4.25',
		'8.0.4.28',
		'8.0.4.3',
		'8.0.4.31',
		'8.0.4.32',
		'8.0.4.33',
		'8.0.4.9',
		'8.0.5',
		'8.0.5.20',
		'8.0.5.23',
		'8.0.5.25',
		'8.0.5.27',
		'8.0.5.28',
		'8.0.5.31',
		'8.1.0.104',
		'8.1.1',
		'8.1.1.6',
		'8.1.2',
		'8.1.2.13',
		'8.1.2.15',
		'8.1.2.16',
		'8.1.2.19',
		'8.1.2.23',
		'8.1.2.24',
		'8.1.2.49',
		'8.1.2.50',
		'8.1.2.55',
		'8.1.2.56',
		'8.2.0.45',
		'8.2.1',
		'8.2.1.11',
		'8.2.2',
		'8.2.2.10',
		'8.2.2.12',
		'8.2.2.16',
		'8.2.2.17',
		'8.2.2.9',
		'8.2.3',
		'8.2.4',
		'8.2.4.1',
		'8.2.4.4',
		'8.2.5',
		'8.2.5.13',
		'8.2.5.22',
		'8.2.5.26',
		'8.2.5.33',
		'8.2.5.40',
		'8.2.5.41',
		'8.2.5.46',
		'8.2.5.48',
		'8.2.5.50',
		'8.2.5.52',
		'8.2.5.55',
		'8.2.5.57',
		'8.2.5.59',
		'8.3.1',
		'8.3.1.1',
		'8.3.1.4',
		'8.3.1.6',
		'8.3.2',
		'8.3.2.13',
		'8.3.2.23',
		'8.3.2.25',
		'8.3.2.31',
		'8.3.2.33',
		'8.3.2.34',
		'8.3.2.37',
		'8.3.2.39',
		'8.3.2.4',
		'8.3.2.40',
		'8.3.2.41',
		'8.3.2.44',
		'8.4.0',
		'8.4.1',
		'8.4.1.11',
		'8.4.1.3',
		'8.4.2',
		'8.4.2.1',
		'8.4.2.8',
		'8.4.3',
		'8.4.3.8',
		'8.4.3.9',
		'8.4.4',
		'8.4.4.1',
		'8.4.4.3',
		'8.4.4.5',
		'8.4.4.9',
		'8.4.5',
		'8.4.5.6',
		'8.4.6',
		'8.4.7',
		'8.4.7.15',
		'8.4.7.22',
		'8.4.7.23',
		'8.4.7.26',
		'8.4.7.28',
		'8.4.7.29',
		'8.4.7.3',
		'8.5.1',
		'8.5.1.1',
		'8.5.1.14',
		'8.5.1.17',
		'8.5.1.18',
		'8.5.1.19',
		'8.5.1.21',
		'8.5.1.24',
		'8.5.1.6',
		'8.5.1.7',
		'8.6.1',
		'8.6.1.1',
		'8.6.1.10',
		'8.6.1.12',
		'8.6.1.13',
		'8.6.1.14',
		'8.6.1.17',
		'8.6.1.2',
		'8.6.1.5',
		'8.7.1',
		'8.7.1.1',
		'8.7.1.11',
		'8.7.1.13',
		'8.7.1.16',
		'8.7.1.17',
		'8.7.1.3',
		'8.7.1.4',
		'8.7.1.7',
		'8.7.1.8',
		'9.0.1',
		'9.0.2',
		'9.0.2.10',
		'9.0.3',
		'9.0.3.6',
		'9.0.3.8',
		'9.0.4',
		'9.0.4.1',
		'9.0.4.17',
		'9.0.4.20',
		'9.0.4.24',
		'9.0.4.26',
		'9.0.4.29',
		'9.0.4.33',
		'9.0.4.35',
		'9.0.4.37',
		'9.0.4.40',
		'9.0.4.42',
		'9.0.4.5',
		'9.0.4.7',
		'9.1.1',
		'9.1.1.4',
		'9.1.2',
		'9.1.2.8',
		'9.1.3',
		'9.1.3.2',
		'9.1.4',
		'9.1.4.5',
		'9.1.5',
		'9.1.5.10',
		'9.1.5.12',
		'9.1.5.15',
		'9.1.5.21',
		'9.1.6',
		'9.1.6.1',
		'9.1.6.10',
		'9.1.6.4',
		'9.1.6.6',
		'9.1.6.8',
		'9.1.7.11',
		'9.1.7.12',
		'9.1.7.4',
		'9.1.7.6',
		'9.1.7.7',
		'9.1.7.9',
		'9.2.0.0',
		'9.2.0.104',
		'9.2.3.1',
		'9.2.1',
		'9.2.2',
		'9.2.2.4',
		'9.2.2.7',
		'9.2.2.8',
		'9.2.3',
		'9.2.3.3',
		'9.2.3.4',
		'9.2.4',
		'9.2.4.10',
		'9.2.4.13',
		'9.2.4.14',
		'9.2.4.16',
		'9.2.4.17',
		'9.2.4.2',
		'9.2.4.4',
		'9.2.4.8',
		'9.3.1.105',
		'9.3.1.50',
		'9.3.2.100',
		'9.3.2.243',
		'9.3.1',
		'9.3.1.1',
		'9.3.2',
		'9.3.2.2',
		'9.3.3',
		'9.3.3.1',
		'9.3.3.10',
		'9.3.3.11',
		'9.3.3.2',
		'9.3.3.5',
		'9.3.3.6',
		'9.3.3.9',
		'9.3.5',
		'9.4.0.115',
		'9.4.1',
		'9.4.1.1',
		'9.4.1.2',
		'9.4.1.3',
		'9.4.1.5',
		'9.4.2',
		'9.4.2.3',
		'9.4.3',
		'9.4.3.11',
		'9.4.3.12',
		'9.4.3.3',
		'9.4.3.4',
		'9.4.3.6',
		'9.4.3.8',
		'9.4.4',
		'9.5.1',
		'9.5.2',
		'9.5.2.10',
		'9.5.2.14',
		'9.5.2.6',
		'9.5.3',
		'9.5.3.2',
		'9.5.3.3',
		'9.6.0',
		'9.6.1',
		'9.6.1.10',
		'9.6.1.3',
		'9.6.1.5',
		'9.6.2',
		'9.6.2.1',
		'9.6.2.2',
		'9.6.2.3');

foreach af (affected) {
  if (check_vers == af) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: 0, data: report);
    exit(0);
  }
}

exit(99);

