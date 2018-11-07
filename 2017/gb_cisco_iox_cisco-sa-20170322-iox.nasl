###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_iox_cisco-sa-20170322-iox.nasl 12106 2018-10-26 06:33:36Z cfischer $
#
# Cisco IOx Data in Motion Stack Overflow Vulnerability
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

CPE = "cpe:/a:cisco:iox";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106685");
  script_cve_id("CVE-2017-3853");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_version("$Revision: 12106 $");

  script_name("Cisco IOx Data in Motion Stack Overflow Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170322-iox");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"solution", value:"Update to version 1.2.4.2");

  script_tag(name:"summary", value:"A vulnerability in the Data-in-Motion (DMo) process installed with the
Cisco IOx application environment could allow an unauthenticated, remote attacker to cause a stack overflow that
could allow remote code execution with root privileges in the virtual instance running on an affected device.");

  script_tag(name:"insight", value:"The vulnerability is due to insufficient bounds checking in the DMo process.
An attacker could exploit this vulnerability by sending crafted packets that are forwarded to the DMo process for
evaluation.");

  script_tag(name:"impact", value:"The impacts of a successful exploit are limited to the scope of the virtual
instance and do not impact the router that is hosting Cisco IOx.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-26 08:33:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-03-23 09:56:15 +0700 (Thu, 23 Mar 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_iox_web_detect.nasl");
  script_mandatory_keys("cisco_iox/installed");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe: CPE, service: "www"))
  exit(0);

if (version == '1.1.0.0' || version == '1.0.0.0') {
  report = report_fixed_ver(installed_version: version, fixed_version: "1.2.4.2");
  security_message(port: 0, data: report);
  exit(0);
}

exit(99);

