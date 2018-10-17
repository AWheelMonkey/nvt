###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_nx_os_cisco-sa-20170118-nexus.nasl 11923 2018-10-16 10:38:56Z mmartin $
#
# Cisco Nexus 5000, 6000, and 7000 Series Switches Software IS-IS Packet Processing Denial of Service Vulnerability
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

CPE = "cpe:/o:cisco:nx-os";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106528");
  script_cve_id("CVE-2017-3804");
  script_tag(name:"cvss_base", value:"5.7");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:M/Au:N/C:N/I:N/A:C");
  script_version("$Revision: 11923 $");

  script_name("Cisco Nexus 5000, 6000, and 7000 Series Switches Software IS-IS Packet Processing Denial of Service Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170118-nexus");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in Intermediate System-to-Intermediate System (IS-IS)
protocol packet processing of Cisco Nexus 5000, 6000, and 7000 Series Switches software could allow an
unauthenticated, adjacent attacker to cause a reload of the affected device.");

  script_tag(name:"insight", value:"The vulnerability is due to improper processing of crafted IS-IS protocol
packets. An attacker could exploit this vulnerability by sending a crafted IS-IS protocol packet over an
established adjacency.");

  script_tag(name:"impact", value:"An exploit could allow the attacker to cause a reload of the affected
device.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-16 12:38:56 +0200 (Tue, 16 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-01-19 11:24:12 +0700 (Thu, 19 Jan 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_nx_os_version.nasl");
  script_mandatory_keys("cisco_nx_os/version", "cisco_nx_os/model", "cisco_nx_os/device");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

device = get_kb_item("cisco_nx_os/device");
if (!device || "Nexus" >!< device)
  exit(0);

model = get_kb_item("cisco_nx_os/model");
if (!model || model !~ "^(5|6|7)[0-9]+")
  exit(0);

if (!version = get_app_version(cpe:CPE))
  exit(0);

affected = make_list(
		'7.1(3)N1(2.1)',
		'7.1(3)N1(2.1)',
		'7.1(3)N1(3.12)',
		'7.1(3)N1(3.12)',
		'7.3(2)N1(0.296)',
		'7.3(2)N1(0.296)',
		'8.0(1)S2',
		'8.0(1)S2');

foreach af (affected) {
  if (version == af) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: 0, data: report);
    exit(0);
  }
}

exit(99);

