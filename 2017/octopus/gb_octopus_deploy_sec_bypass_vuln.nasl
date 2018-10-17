###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_octopus_deploy_sec_bypass_vuln.nasl 8107 2017-12-14 04:53:47Z ckuersteiner $
#
# Octopus Deploy Access Control Bypass Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.140601");
  script_version("$Revision: 8107 $");
  script_tag(name: "last_modification", value: "$Date: 2017-12-14 05:53:47 +0100 (Thu, 14 Dec 2017) $");
  script_tag(name: "creation_date", value: "2017-12-14 11:07:09 +0700 (Thu, 14 Dec 2017)");
  script_tag(name: "cvss_base", value: "6.5");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:S/C:P/I:P/A:P");

  script_cve_id("CVE-2017-17665");

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("Octopus Deploy Access Control Bypass Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_octopus_deploy_detect.nasl");
  script_mandatory_keys("octopus_deploy/installed");

  script_tag(name: "summary", value: "In Octopus Deploy, the machine update process doesn't check that the user
has access to all environments. This allows an access-control bypass because the set of environments to which a
machine is scoped may include environments in which the user lacks access.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "affected", value: "Octopus Deploy versions prior to 4.1.3.");

  script_tag(name: "solution", value: "Update to version 4.1.3 or later.");

  script_xref(name: "URL", value: "https://github.com/OctopusDeploy/Issues/issues/4073");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "4.1.3")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "4.1.3");
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
