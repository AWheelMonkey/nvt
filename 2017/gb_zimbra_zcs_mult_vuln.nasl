###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_zimbra_zcs_mult_vuln.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# Zimbra Collaboration Multiple Vulnerabilities
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

CPE = "cpe:/a:zimbra:zimbra_collaboration_suite";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106744");
  script_version("$Revision: 11863 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-04-12 08:26:22 +0200 (Wed, 12 Apr 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_cve_id("CVE-2017-6821", "CVE-2017-6813", "CVE-2016-9924");
  script_bugtraq_id(97121);

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Zimbra Collaboration Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_zimbra_admin_console_detect.nasl");
  script_mandatory_keys("zimbra_web/installed");

  script_tag(name:"summary", value:"Zimbra Collaboration is pronte to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"Zimbra Collaboration is pronte to multiple vulnerabilities:

  - Improper handling of privileges (CVE-2017-6813)

  - Improper limitation of file paths (CVE-2017-6821)

  - XML External Entity (XXE) (CVE-2016-9924)");

  script_tag(name:"affected", value:"Zimbra Collaboration versions before 8.7.6.");

  script_tag(name:"solution", value:"Upgrade to version 8.7.6 or later.");

  script_xref(name:"URL", value:"https://wiki.zimbra.com/wiki/Security_Center");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE, service: "www"))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "8.7.6")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "8.7.6");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
