##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_simatic_s7_300_dos_vuln.nasl 11523 2018-09-21 13:37:35Z asteins $
#
# Siemens SIMATIC S7-300 DoS Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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

CPE = 'cpe:/a:siemens:simatic_s7_300';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106100");
  script_version("$Revision: 11523 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 15:37:35 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-06-20 09:41:29 +0700 (Mon, 20 Jun 2016)");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");

  script_cve_id("CVE-2016-3949");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Siemens SIMATIC S7-300 DoS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_simatic_s7_version.nasl");
  script_mandatory_keys("simatic_s7/detected");

  script_tag(name:"summary", value:"Siemens SIMATIC S7-300 is prone to a denial of service
vulnerability.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"An exploit of this vulnerability could cause the affected device
to go into defect mode, requiring a cold restart to recover the system.");

  script_tag(name:"impact", value:"A remote attacker may cause a DoS condition.");

  script_tag(name:"affected", value:"Version prior to 3.3.12");

  script_tag(name:"solution", value:"Upgrade to version 3.3.12 or later");

  script_xref(name:"URL", value:"https://www.siemens.com/cert/pool/cert/siemens_security_advisory_ssa-818183.pdf");
  script_xref(name:"URL", value:"https://ics-cert.us-cert.gov/advisories/ICSA-16-161-01");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "3.3.12")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "3.3.12");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);

