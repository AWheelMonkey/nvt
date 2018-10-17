###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_gallery_bank_xss_vuln.nasl 7581 2017-10-26 11:28:22Z asteins $
#
# WordPress Gallery Bank Plugin XSS Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.112071");
  script_version("$Revision: 7581 $");
  script_tag(name: "last_modification", value: "$Date: 2017-10-26 13:28:22 +0200 (Thu, 26 Oct 2017) $");
  script_tag(name: "creation_date", value: "2017-10-09 08:27:51 +0200 (Mon, 09 Oct 2017)");
  script_tag(name: "cvss_base", value: "4.3");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:M/Au:N/C:N/I:P/A:N");

  script_cve_id("CVE-2014-8758");

  script_tag(name: "qod_type", value: "remote_banner_unreliable");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("WordPress Gallery Bank Plugin XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");

  script_tag(name: "summary", value: "WordPress plugin Gallery Bank allows remote attackers to inject arbitrary web script
      or HTML via the order_id parameter in the gallery_album_sorting page to wp-admin/admin.php.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "affected", value: "WordPress Gallery Bank plugin version 2.0.26 up to 3.0.69.");

  script_tag(name: "solution", value: "Update to version 3.0.70 or later.");

  script_xref(name: "URL", value: "https://wpvulndb.com/vulnerabilities/8236");
  script_xref(name: "URL", value: "https://g0blin.co.uk/cve-2014-8758/");

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

res = http_get_cache(port: port, item: dir + "/wp-content/plugins/gallery-bank/readme.txt");

if ("Gallery Bank" >< res && "Changelog" >< res) {

  vers = eregmatch(pattern: "Stable tag: ([0-9.]+)", string: res);

  # Stable tag is "trunk", get the latest Changelog version
  if (isnull(vers[1])) {
    limit = eregmatch(pattern: "\=\= Changelog \=\=(.*)\*", string: res);
    vers = eregmatch(pattern: "\= ([0-9.]+) \=", string: limit[1]);
  }

  if (!isnull(vers[1]) && version_in_range(version: vers[1], test_version: "2.0.26", test_version2: "3.0.69")) {
    report = report_fixed_ver(installed_version: vers[1], fixed_version: "3.0.70");
    security_message(port: port, data: report);
    exit(0);
  }
}
exit(0);
