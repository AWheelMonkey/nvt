###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_pca_cisco-sa-20170607-pca.nasl 12106 2018-10-26 06:33:36Z cfischer $
#
# Cisco Prime Collaboration Assurance Cross-Site Request Forgery Vulnerability
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

CPE = "cpe:/a:cisco:prime_collaboration_assurance";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106859");
  script_cve_id("CVE-2017-6659");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_version("$Revision: 12106 $");

  script_name("Cisco Prime Collaboration Assurance Cross-Site Request Forgery Vulnerability");

  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170607-pca");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"A vulnerability in the web-based management interface of Cisco Prime
Collaboration Assurance could allow an unauthenticated, remote attacker to conduct a cross-site request forgery
(CSRF) attack and perform arbitrary actions on an affected device.");

  script_tag(name:"insight", value:"The vulnerability is due to insufficient CSRF protections for the web-based
management interface of an affected device. An attacker could exploit this vulnerability by persuading a user of
the interface to follow a crafted link.");

  script_tag(name:"impact", value:"A successful exploit could allow the attacker to perform arbitrary actions on
a targeted device via a web browser and with the privileges of the user.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-26 08:33:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-08 13:13:16 +0700 (Thu, 08 Jun 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_pca_version.nasl");
  script_mandatory_keys("cisco_pca/detected");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe: CPE))
  exit(0);

if (version =~ "^11\.[0-5]\.") {
  report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
  security_message(port: 0, data: report);
  exit(0);
}

exit(99);
