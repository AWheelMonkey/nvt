##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_monit_csrf_vuln.nasl 11310 2018-09-11 04:42:07Z ckuersteiner $
#
# Monit < 5.20.0 CSRF Vulnerability
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

CPE = "cpe:/a:tildeslash:monit";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.141468");
  script_version("$Revision: 11310 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-11 06:42:07 +0200 (Tue, 11 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-11 11:29:46 +0700 (Tue, 11 Sep 2018)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:P/A:N");

  script_cve_id("CVE-2016-7067");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Monit < 5.20.0 CSRF Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_monit_detect.nasl");
  script_mandatory_keys("monit/detected");

  script_tag(name:"summary", value:"Monit is vulnerable to a cross site request forgery attack. Successful
exploitation will enable an attacker to disable/enable all monitoring for a particular host or disable/enable
monitoring for a specific service.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"Monit version 5.19.0 and prior.");

  script_tag(name:"solution", value:"Update to version 5.20.0 or later.");

  script_xref(name:"URL", value:"https://seclists.org/oss-sec/2016/q4/267");
  script_xref(name:"URL", value:"https://mmonit.com/monit/changes/");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "5.20.0")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "5.20.0");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
