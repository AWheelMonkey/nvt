###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_ultimate-member_mult_xss_vuln.nasl 11156 2018-08-29 09:25:17Z asteins $
#
# WordPress Ultimate Member Plugin 2.0 Multiple XSS Vulnerabilities
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH
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

CPE = "cpe:/a:wordpress:wordpress";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112226");
  script_version("$Revision: 11156 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-29 11:25:17 +0200 (Wed, 29 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-02-19 10:15:00 +0100 (Mon, 19 Feb 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

  script_cve_id("CVE-2018-6943", "CVE-2018-6944");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("WordPress Ultimate Member Plugin 2.0 Multiple XSS Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");

  script_tag(name:"summary", value:"Ultimate Member plugin for WordPress is prone to cross-site scripting (XSS) vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"WordPress Ultimate Member plugin version 2.0.");

  script_tag(name:"solution", value:"Upgrade to version 2.0.1 or later.");

  script_xref(name:"URL", value:"https://packetstormsecurity.com/files/146403/WordPress-UltimateMember-2.0-Cross-Site-Scripting.html");
  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!dir = get_app_location(cpe: CPE, port: port))
  exit(0);

if (dir == "/")
  dir = "";

res = http_get_cache(port: port, item: dir + "/wp-content/plugins/ultimate-member/readme.txt");

if ("=== Ultimate Member - User Profile & Membership Plugin" >< res && "Changelog" >< res) {

  vers = eregmatch(pattern: "Stable tag: ([0-9.]+)", string: res);

  if (!isnull(vers[1]) && version_is_equal(version: vers[1], test_version: "2.0")) {
    report = report_fixed_ver(installed_version: vers[1], fixed_version: "2.0.1");
    security_message(port: port, data: report);
    exit(0);
  }
}
exit(0);
