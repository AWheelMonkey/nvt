###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_aironet_cisco-sa-20170118-cme2.nasl 11836 2018-10-11 08:56:08Z mmartin $
#
# Cisco Mobility Express 2800 and 3800 Denial of Service Vulnerability
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

CPE = "cpe:/o:cisco:wireless_lan_controller_software";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106626");
  script_cve_id("CVE-2016-9221");
  script_tag(name:"cvss_base", value:"3.3");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:L/Au:N/C:N/I:N/A:P");
  script_version("$Revision: 11836 $");

  script_name("Cisco Mobility Express 2800 and 3800 802.11 Denial of Service Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170118-cme2");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in 802.11 ingress connection authentication handling for the
Cisco Mobility Express 2800 and 3800 Access Points could allow an unauthenticated, adjacent attacker to cause
authentication to fail.");

  script_tag(name:"insight", value:"The vulnerability is due to improper error handling for 802.11 authentication
requests that do not complete. An attacker could exploit this vulnerability by sending a crafted 802.11 frame to
the targeted device.");

  script_tag(name:"impact", value:"An exploit could allow the attacker to impact the availability of the device
due to authentication failures.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-11 10:56:08 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-03-02 11:11:21 +0700 (Thu, 02 Mar 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_wlc_version.nasl");
  script_mandatory_keys("cisco_wlc/version", "cisco_wlc/model");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

model = get_kb_item("cisco_wlc/model");
if (!model || model !~ "^AIR-AP(2|3)8[0-9]{2}")
  exit(0);

if (!version = get_app_version(cpe:CPE))
  exit(0);

affected = make_list('8.2.121.12',
                     '8.4.1.82');

foreach af (affected) {
  if (version == af) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: 0, data: report);
    exit(0);
  }
}

exit(99);

