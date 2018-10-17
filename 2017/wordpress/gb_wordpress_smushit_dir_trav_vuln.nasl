###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_smushit_dir_trav_vuln.nasl 7466 2017-10-18 05:09:06Z teissa $
#
# WordPress Smush Image Compression and Optimization Plugin Directory Traversal Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.112073");
  script_version("$Revision: 7466 $");
  script_tag(name: "last_modification", value: "$Date: 2017-10-18 07:09:06 +0200 (Wed, 18 Oct 2017) $");
  script_tag(name: "creation_date", value: "2017-10-09 09:55:51 +0200 (Mon, 09 Oct 2017)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_cve_id("CVE-2017-15079");

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("WordPress Smush Image Compression and Optimization Plugin Directory Traversal Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");

  script_tag(name: "summary", value: "WordPress plugin Smush Image Compression and Optimization is vulnerable to a directory traversal vulnerability.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "affected", value: "WordPress Smush Image Compression and Optimization plugin before version 2.7.6.");

  script_tag(name: "solution", value: "Update to version 2.7.6 or later.");

  script_xref(name: "URL", value: "https://wordpress.org/plugins/wp-smushit/#developers");
  script_xref(name: "URL", value: "https://wordpress.org/support/topic/file-transversal-bug/");

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

res = http_get_cache(port: port, item: dir + "/wp-content/plugins/wp-smushit/readme.txt");
if ("Smush Image Compression and Optimization" >< res && "Changelog" >< res) {
  vers = eregmatch(pattern: "Stable tag: ([0-9.]+)", string: res);
  if (!isnull(vers[1])) {
    if (version_is_less(version: vers[1], test_version: "2.7.6")) {
      report = report_fixed_ver(installed_version: vers[1], fixed_version: "2.7.6");
      security_message(port: port, data: report);
      exit(0);
    }
  }
}

exit(0);
