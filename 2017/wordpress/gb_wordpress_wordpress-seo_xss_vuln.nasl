###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_wordpress-seo_xss_vuln.nasl 8016 2017-12-07 06:31:25Z asteins $
#
# WordPress Yoast SEO Plugin XSS Vulnerability
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.112127");
  script_version("$Revision: 8016 $");
  script_tag(name: "last_modification", value: "$Date: 2017-12-07 07:31:25 +0100 (Thu, 07 Dec 2017) $");
  script_tag(name: "creation_date", value: "2017-11-17 12:00:00 +0100 (Fri, 17 Nov 2017)");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");

  script_cve_id("CVE-2017-16842");

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("WordPress Yoast SEO Plugin XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");

  script_tag(name: "summary", value: "A cross-site scripting (XSS) vulnerability in admin/google_search_console/class-gsc-table.php
in the Yoast SEO plugin for WordPress allows remote attackers to inject arbitrary web script or HTML.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "affected", value: "WordPress Yoast SEO plugin before version 5.8.0.");

  script_tag(name: "solution", value: "Update to version 5.8.0 or later.");

  script_xref(name: "URL", value: "https://wordpress.org/plugins/wordpress-seo/#developers");
  script_xref(name: "URL", value: "https://plugins.trac.wordpress.org/changeset/1766831/wordpress-seo/trunk/admin/google_search_console/class-gsc-table.php");

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

res = http_get_cache(port: port, item: dir + "/wp-content/plugins/wordpress-seo/readme.txt");

if ("Yoast SEO" >< res && "Changelog" >< res) {
  vers = eregmatch(pattern: "Stable tag: ([0-9.]+)", string: res);
  if (!isnull(vers[1])) {
    if (version_is_less(version: vers[1], test_version: "5.8.0")) {
      report = report_fixed_ver(installed_version: vers[1], fixed_version: "5.8.0");
      security_message(port: port, data: report);
      exit(0);
    }
  }
}

exit(99);
