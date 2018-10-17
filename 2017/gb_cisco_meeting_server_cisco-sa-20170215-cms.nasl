###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_meeting_server_cisco-sa-20170215-cms.nasl 11919 2018-10-16 09:49:19Z mmartin $
#
# Cisco Meeting Server API Denial of Service Vulnerability
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

CPE = "cpe:/a:cisco:meeting_server";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106595");
  script_cve_id("CVE-2017-3830");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_version("$Revision: 11919 $");

  script_name("Cisco Meeting Server API Denial of Service Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170215-cms");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in an internal API of the Cisco Meeting Server (CMS) could
allow an unauthenticated, remote attacker to cause a denial of service (DoS) condition on the affected
appliance.");

  script_tag(name:"insight", value:"The vulnerability is due to invalid data being received on a specific port.
An attacker could exploit this vulnerability by sending crafted packets to a specific port on the device.");

  script_tag(name:"impact", value:"Successful exploitation could cause the CMS to crash.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-16 11:49:19 +0200 (Tue, 16 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-02-16 12:05:59 +0700 (Thu, 16 Feb 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_meeting_server_snmp_detect.nasl");
  script_mandatory_keys("cisco/meeting_server/installed");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe: CPE))
  exit(0);

if ( version == "2.1.0") {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.1.2");
  security_message(port: 0, data: report);
  exit(0);
}

exit(99);

