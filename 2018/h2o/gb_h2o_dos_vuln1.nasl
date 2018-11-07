###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_h2o_dos_vuln1.nasl 12116 2018-10-26 10:01:35Z mmartin $
#
# H2O HTTP Server DoS Vulnerability-01
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH
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

CPE = "cpe:/a:h2o_project:h2o";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140822");
  script_version("$Revision: 12116 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:01:35 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-02-27 16:25:17 +0700 (Tue, 27 Feb 2018)");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");

  script_cve_id("CVE-2016-7835");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("H2O HTTP Server DoS Vulnerability-01");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("gb_h2o_http_server_detect.nasl");
  script_mandatory_keys("h2o/installed");

  script_tag(name:"summary", value:"Use-after-free vulnerability in H2O allows remote attackers to cause a
denial-of-service (DoS) or obtain server certificate private keys and possibly other information.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"H2O version 2.0.4 and prior.");

  script_tag(name:"solution", value:"Update to version 2.0.5 or later.");

  script_xref(name:"URL", value:"https://github.com/h2o/h2o/issues/1144");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "2.0.5")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.0.5");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
