###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_discourse_2.2.0beta3.nasl 13336 2019-01-29 07:11:23Z ckuersteiner $
#
# Discourse < 2.2.0.beta3 Multiple Vulnerabilities
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2019 Greenbone Networks GmbH
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

CPE = "cpe:/a:discourse:discourse";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.141937");
  script_version("$Revision: 13336 $");
  script_tag(name:"last_modification", value:"$Date: 2019-01-29 08:11:23 +0100 (Tue, 29 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-29 13:55:04 +0700 (Tue, 29 Jan 2019)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Discourse < 2.2.0.beta3 Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_discourse_detect.nasl");
  script_mandatory_keys("discourse/detected");

  script_tag(name:"summary", value:"Discourse is prone to multiple vulnerabilities.");

  script_tag(name:"affected", value:"Discourse before version 2.2.0.beta3.");

  script_tag(name:"solution", value:"Update to version 2.2.0.beta3.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_xref(name:"URL", value:"https://meta.discourse.org/t/discourse-2-2-0-beta3-release-notes/99380");
  script_xref(name:"URL", value:"https://github.com/discourse/discourse/pull/6417");
  script_xref(name:"URL", value:"https://github.com/discourse/discourse/commit/7d6b348d0b6cd85b474a53299dc378d58c70b865");
  script_xref(name:"URL", value:"https://github.com/discourse/discourse/commit/0e9841b9951a8bd6f8bdf83b5b13eccdafc675ec");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "2.2.0.beta3")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.2.0.beta3");
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
