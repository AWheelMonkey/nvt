###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_thycotic_secret_server_redirect_vuln.nasl 11923 2018-10-16 10:38:56Z mmartin $
#
# Thycotic Secret Server Redirect Vulnerability
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

CPE = "cpe:/a:thycotic:secret_server";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140258");
  script_version("$Revision: 11923 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-16 12:38:56 +0200 (Tue, 16 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-07-31 14:35:01 +0700 (Mon, 31 Jul 2017)");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Thycotic Secret Server Redirect Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_thycotic_secret_server_detect.nasl");
  script_mandatory_keys("thycotic_secretserver/installed");

  script_tag(name:"summary", value:"The share function in Thycotic Secret Server mishandles the Back Button,
leading to unintended redirections. ");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"affected", value:"Thycotic Secret Server before version 10.2.000019.");

  script_tag(name:"solution", value:"Update to version 10.2.000019 or later.");

  script_xref(name:"URL", value:"https://thycotic.com/products/secret-server/resources/advisories/thy-ss-009/");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "10.2.000019")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "10.2.000019");
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
