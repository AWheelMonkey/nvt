###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_calls_to_action_xss_vuln.nasl 12106 2018-10-26 06:33:36Z cfischer $
#
# WordPress Calls To Action Plugin XSS Vulnerability
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
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

CPE = "cpe:/a:wordpress:wordpress";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112045");
  script_version("$Revision: 12106 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 08:33:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-09-12 11:23:51 +0200 (Tue, 12 Sep 2017)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

  script_cve_id("CVE-2015-8350");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("WordPress Calls To Action Plugin XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");

  script_tag(name:"summary", value:"WordPress plugin Calls To Action is vulnerable to cross-site scripting (XSS) resulting in
attackers being able to inject arbitrary web script or HTML via the (1) open-tab parameter in a wp_cta_global_settings action to wp-admin/edit.php or (2) wp-cta-variation-id parameter to ab-testing-call-to-action-example/.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"WordPress Calls To Action plugin before 2.5.1.");

  script_tag(name:"solution", value:"Update to version 2.5.1 or later.");

  script_xref(name:"URL", value:"https://packetstormsecurity.com/files/134598/WordPress-Calls-To-Action-2.4.3-Cross-Site-Scripting.html");
  script_xref(name:"URL", value:"https://wordpress.org/plugins/cta/#developers");

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

res = http_get_cache(port: port, item: dir + "/wp-content/plugins/cta/readme.txt");

if ("WordPress Calls to Action" >< res && "Changelog" >< res) {
  vers = eregmatch(pattern: "Stable tag: ([0-9.]+)", string: res);
  if (!isnull(vers[1])) {
    if (version_is_less(version: vers[1], test_version: "2.5.1")) {
      report = report_fixed_ver(installed_version: vers[1], fixed_version: "2.5.1");
      security_message(port: port, data: report);
      exit(0);
    }
  }
}

exit(0);
