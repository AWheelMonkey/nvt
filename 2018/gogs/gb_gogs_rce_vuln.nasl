##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_gogs_rce_vuln.nasl 13394 2019-02-01 07:36:10Z mmartin $
#
# Gogs <= 0.11.66 RCE Vulnerability
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

CPE = "cpe:/a:gogs:gogs";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.141678");
  script_version("$Revision: 13394 $");
  script_tag(name:"last_modification", value:"$Date: 2019-02-01 08:36:10 +0100 (Fri, 01 Feb 2019) $");
  script_tag(name:"creation_date", value:"2018-11-13 12:10:41 +0700 (Tue, 13 Nov 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_cve_id("CVE-2018-18925");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"NoneAvailable");

  script_name("Gogs <= 0.11.66 RCE Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_gogs_detect.nasl");
  script_mandatory_keys("gogs/detected");

  script_tag(name:"summary", value:"Gogs allows remote code execution because it does not properly validate
session IDs, as demonstrated by a '..' session-file forgery in the file session provider in file.go. This is
related to session ID handling in the go-macaron/session code for Macaron.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"Gogs version 0.11.66 and prior.");

  script_tag(name:"solution", value:"No known solution is available as of 13th November, 2018. Information
regarding this issue will be updated once solution details are available.");

  script_xref(name:"URL", value:"https://github.com/gogs/gogs/issues/5469");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less_equal(version: version, test_version: "0.11.66")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "None");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
