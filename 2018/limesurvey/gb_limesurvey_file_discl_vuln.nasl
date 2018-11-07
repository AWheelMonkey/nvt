##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_limesurvey_file_discl_vuln.nasl 12116 2018-10-26 10:01:35Z mmartin $
#
# LimeSurvey File Disclosure Vulnerability
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

CPE = "cpe:/a:limesurvey:limesurvey";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140848");
  script_version("$Revision: 12116 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:01:35 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-03-05 09:07:18 +0700 (Mon, 05 Mar 2018)");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:N");

  script_cve_id("CVE-2018-7556");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("LimeSurvey File Disclosure Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_limesurvey_detect.nasl");
  script_mandatory_keys("limesurvey/installed");

  script_tag(name:"summary", value:"LimeSurvey mishandles application/controller/InstallerController.php after
installation, which allows remote attackers to access the configuration file.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"solution", value:"Update to version 2.6.7 LTS, 2.73.1, 3.4.2 or later.");

  script_xref(name:"URL", value:"https://www.limesurvey.org/about-us/news/2075-limesurvey-security-advisory-02-2018");

  exit(0);
}

include("host_details.inc");
include("revisions-lib.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

# Just get the major version without build
vers = eregmatch(pattern: "^([0-9.]+)", string: version);
if (isnull(vers[1]))
  exit(0);

check_vers = vers[1];

if (check_vers =~ "^2\.6") {
  if (version_is_less(version: check_vers, test_version: "2.6.7")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "2.6.7");
    security_message(port: port, data: report);
    exit(0);
  }
}

if (check_vers =~ "^2\.7") {
  if (version_is_less(version: check_vers, test_version: "2.73.1")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "2.73.1");
    security_message(port: port, data: report);
    exit(0);
  }
}

if (check_vers =~ "^3\.") {
  if (version_is_less(version: check_vers, test_version: "3.4.2")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "3.4.2");
    security_message(port: port, data: report);
    exit(0);
  }
}

exit(0);
