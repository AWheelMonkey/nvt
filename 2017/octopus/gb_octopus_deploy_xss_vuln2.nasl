###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_octopus_deploy_xss_vuln2.nasl 7992 2017-12-05 08:34:22Z teissa $
#
# Octopus Deploy XSS Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

CPE = "cpe:/a:octopus:deploy";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140519");
  script_version("$Revision: 7992 $");
  script_tag(name: "last_modification", value: "$Date: 2017-12-05 09:34:22 +0100 (Tue, 05 Dec 2017) $");
  script_tag(name: "creation_date", value: "2017-11-21 14:00:04 +0700 (Tue, 21 Nov 2017)");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");

  script_cve_id("CVE-2017-16810");

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("Octopus Deploy XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_octopus_deploy_detect.nasl");
  script_mandatory_keys("octopus_deploy/installed");

  script_tag(name: "summary", value: "Cross-site scripting (XSS) vulnerability in the All Variables tab in Octopus
Deploy allows remote attackers to inject arbitrary web script or HTML via the Variable Set Name parameter.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "affected", value: "Octopus Deploy version 3.4.0 until 3.13.6.");

  script_tag(name: "solution", value: "Update to version 3.13.7 or later.");

  script_xref(name: "URL", value: "https://github.com/OctopusDeploy/Issues/issues/3919");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_in_range(version: version, test_version: "3.4.0", test_version2: "3.13.6")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "3.13.7");
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
