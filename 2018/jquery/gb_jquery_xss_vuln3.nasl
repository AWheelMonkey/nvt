##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_jquery_xss_vuln3.nasl 12183 2018-11-01 10:13:13Z ckuersteiner $
#
# jQuery < 1.6.3 XSS Vulnerability
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

CPE = "cpe:/a:jquery:jquery";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.141637");
  script_version("$Revision: 12183 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-01 11:13:13 +0100 (Thu, 01 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-01 16:18:55 +0700 (Thu, 01 Nov 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

  script_cve_id("CVE-2011-4969");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("jQuery < 1.6.3 XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_jquery_detect.nasl");
  script_mandatory_keys("jquery/detected");

  script_tag(name:"summary", value:"Cross-site scripting (XSS) vulnerability in jQuery before 1.6.3, when using
location.hash to select elements, allows remote attackers to inject arbitrary web script or HTML via a crafted
tag.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"jQuery prior to version 1.6.3.");

  script_tag(name:"solution", value:"Update to version 1.6.3 or later or apply the patch.");

  script_xref(name:"URL", value:"https://blog.jquery.com/2011/09/01/jquery-1-6-3-released/");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "1.6.3")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "1.6.3");
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
