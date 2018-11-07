###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_struts_spring_dos_vuln_win.nasl 12106 2018-10-26 06:33:36Z cfischer $
#
# Apache Struts Spring AOP DoS Vulnerability (Windows)
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

CPE = "cpe:/a:apache:struts";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106957");
  script_version("$Revision: 12106 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 08:33:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-07-18 09:09:00 +0700 (Tue, 18 Jul 2017)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");

  script_cve_id("CVE-2017-9787");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Apache Struts Spring AOP DoS Vulnerability (Windows)");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_apache_struts_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("ApacheStruts/installed", "Host/runs_windows");

  script_tag(name:"summary", value:"When using a Spring AOP functionality to secure Struts actions it is
possible to perform a DoS attack when user was properly authenticated");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"Struts 2.3.7 - Struts 2.3.32, Struts 2.5 - Struts 2.5.10.1");

  script_tag(name:"solution", value:"Upgrade to Struts 2.3.33, 2.5.12 or later.");

  script_xref(name:"URL", value:"https://struts.apache.org/docs/s2-049.html");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_in_range(version: version, test_version: "2.3.7", test_version2: "2.3.32")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.3.33");
  security_message(port: port, data: report);
  exit(0);
}

if (version_in_range(version: version, test_version: "2.5", test_version2: "2.5.10.1")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.5.12");
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
