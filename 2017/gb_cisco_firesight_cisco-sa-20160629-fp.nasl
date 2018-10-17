###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_firesight_cisco-sa-20160629-fp.nasl 11039 2018-08-17 12:26:47Z cfischer $
#
# Cisco Firepower System Software Static Credential Vulnerability
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

CPE = "cpe:/a:cisco:firepower_management_center";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106807");
  script_cve_id("CVE-2016-1394");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_version("$Revision: 11039 $");

  script_name("Cisco Firepower System Software Static Credential Vulnerability");

  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160629-fp");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in Cisco Firepower System Software could allow an
  unauthenticated, remote attacker to log in to the device with a default account. This account does not have full
  administrator privileges.");

  script_tag(name:"insight", value:"The vulnerability is due to a user account that has a default and static
  password. This account is created during installation. An attacker could exploit this vulnerability by connecting
  either locally or remotely to the affected system.");

  script_tag(name:"impact", value:"A successful exploit could allow the attacker to log in to the device using
  the default account. The default account allows the execution of a subset of command-line interface (CLI)
  commands that would allow the attacker to partially compromise the device.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-08-17 14:26:47 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-05-17 08:51:13 +0700 (Wed, 17 May 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_firepower_management_center_version.nasl");
  script_mandatory_keys("cisco_firepower_management_center/version");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe:CPE))
  exit(0);

affected = make_list(
		'6.0.0',
		'6.0.0.1',
		'6.0.1',
		'6.1.0');

foreach af (affected) {
  if (version == af) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: 0, data: report);
    exit(0);
  }
}

exit(99);
