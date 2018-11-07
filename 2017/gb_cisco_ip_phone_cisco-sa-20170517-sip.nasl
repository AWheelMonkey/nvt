###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ip_phone_cisco-sa-20170517-sip.nasl 12106 2018-10-26 06:33:36Z cfischer $
#
# Cisco IP Phone 8851 Session Initiation Protocol Denial of Service Vulnerability
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106814");
  script_version("$Revision: 12106 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 08:33:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-05-18 10:24:33 +0700 (Thu, 18 May 2017)");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");

  script_cve_id("CVE-2017-6630");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Cisco IP Phone 8851 Session Initiation Protocol Denial of Service Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("CISCO");
  script_dependencies("gb_cisco_ip_phone_detect.nasl");
  script_mandatory_keys("cisco/ip_phone/model");

  script_tag(name:"summary", value:"A vulnerability in the Session Initiation Protocol (SIP) implementation of
Cisco IP Phone 8851 could allow an unauthenticated, remote attacker to cause a denial of service (DoS)
condition.");

  script_tag(name:"insight", value:"The vulnerability is due to an abnormal SIP message. An attacker could
exploit this vulnerability by manipulating the CANCEL packet.");

  script_tag(name:"impact", value:"An exploit could allow the attacker to cause a disruption of service to the
phone.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170517-sip");

  exit(0);
}

include("version_func.inc");

if (!model = get_kb_item("cisco/ip_phone/model"))
  exit(0);

if (model =~ "^CP-8851") {
  if (!version = get_kb_item("cisco/ip_phone/version"))
    exit(0);

  version = eregmatch(pattern: "sip88xx\.([0-9-]+)", string: version);
  if (version[1] && version[1] =~ "^11-0-0-1") {
    report = report_fixed_ver(installed_version: version[1], fixed_version: "See advisory");
    security_message(port: 0, data: report);
  }
}

exit(0);
