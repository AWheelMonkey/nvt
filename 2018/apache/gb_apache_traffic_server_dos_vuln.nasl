###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_traffic_server_dos_vuln.nasl 11166 2018-08-30 10:05:19Z ckuersteiner $
#
# Apache Traffic Server (ATS) < 6.2.3 DoS Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH
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

CPE = "cpe:/a:apache:traffic_server";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.141414");
  script_version("$Revision: 11166 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-30 12:05:19 +0200 (Thu, 30 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-30 16:54:51 +0700 (Thu, 30 Aug 2018)");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");

  script_cve_id("CVE-2018-8022");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Apache Traffic Server (ATS) < 6.2.3 DoS Vulnerability");

  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_apache_traffic_detect.nasl");
  script_mandatory_keys("apache_trafficserver/installed");

  script_tag(name:"summary", value:"Apache Traffic Server (ATS) is prone to a denial of service vulnerability.");

  script_tag(name:"insight", value:"A carefully crafted invalid TLS handshake can cause Apache Traffic Server
(ATS) to segfault.");

  script_tag(name:"affected", value:"Apache Traffic Server versions 6.0.0 to 6.2.2.");

  script_tag(name:"solution", value:"Update to version 6.2.3 or later.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_xref(name:"URL", value:"http://seclists.org/oss-sec/2018/q3/195");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_in_range(version: version, test_version: "6.0.0", test_version2: "6.2.2")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "6.2.3");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
