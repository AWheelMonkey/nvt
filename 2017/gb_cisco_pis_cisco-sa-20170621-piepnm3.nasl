###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_pis_cisco-sa-20170621-piepnm3.nasl 11836 2018-10-11 08:56:08Z mmartin $
#
# Cisco Prime Infrastructure Reflected Cross-Site Scripting Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.106899");
  script_cve_id("CVE-2017-6699");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_version("$Revision: 11836 $");

  script_name("Cisco Prime Infrastructure Reflected Cross-Site Scripting Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170621-piepnm3");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"Update to version 3.1.5, 3.2 or later.");

  script_tag(name:"summary", value:"A vulnerability in the web-based management interface of Cisco Prime
Infrastructure (PI) could allow an unauthenticated, remote attacker to conduct a reflected cross-site scripting
(XSS) attack against a user of the web-based management interface of an affected device.");

  script_tag(name:"insight", value:"The vulnerability is due to insufficient validation of user-supplied input
by the web-based management interface of an affected device. An attacker could exploit this vulnerability by
persuading a user of the interface to click a crafted link.");

  script_tag(name:"impact", value:"A successful exploit could allow the attacker to execute arbitrary script
code in the context of the interface or allow the attacker to access sensitive browser-based information.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-11 10:56:08 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-22 13:32:46 +0700 (Thu, 22 Jun 2017)");
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

affected = make_list(
		'3.1.0.128',
		'3.1.0',
		'3.1.1');

foreach af (affected) {
  if (version == af) {
    report = report_fixed_ver(installed_version: version, fixed_version: "3.1.5");
    security_message(port: 0, data: report);
    exit(0);
  }
}

exit(99);

