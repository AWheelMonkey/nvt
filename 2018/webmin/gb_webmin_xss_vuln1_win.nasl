###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_webmin_xss_vuln1_win.nasl 12116 2018-10-26 10:01:35Z mmartin $
#
# Webmin XSS Vulnerability (Windows)
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

CPE = "cpe:/a:webmin:webmin";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140651");
  script_version("$Revision: 12116 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:01:35 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-01-04 13:28:09 +0700 (Thu, 04 Jan 2018)");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");

  script_cve_id("CVE-2017-17089");
  script_bugtraq_id(102339);

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Webmin XSS Vulnerability (Windows)");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("webmin.nasl", "os_detection.nasl");
  script_mandatory_keys("webmin/installed", "Host/runs_windows");

  script_tag(name:"summary", value:"Webmin is prone to a cross-site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"custom/run.cgi in Webmin allows remote authenticated administrators to
conduct XSS attacks via the description field in the custom command functionality.");

  script_tag(name:"affected", value:"Webmin prior to version 1.870.");

  script_tag(name:"solution", value:"Update to version 1.870 or later.");

  script_xref(name:"URL", value:"https://github.com/webmin/webmin/commit/a9c97eea6c268fb83d93a817d58bac75e0d2599e");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "1.870")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "1.870");
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
