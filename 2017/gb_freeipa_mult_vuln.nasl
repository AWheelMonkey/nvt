###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_freeipa_mult_vuln.nasl 11901 2018-10-15 08:47:18Z mmartin $
#
# freeIPA Multiple Vulnerabilities
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

CPE = "cpe:/a:freeipa:freeipa";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140335");
  script_version("$Revision: 11901 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-15 10:47:18 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-08-30 09:14:16 +0700 (Wed, 30 Aug 2017)");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");

  script_cve_id("CVE-2016-7030", "CVE-2016-9575");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("freeIPA Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_freeipa_detect.nasl");
  script_mandatory_keys("freeipa/installed");

  script_tag(name:"summary", value:"freeIPA is prone to multiple vulnerabilities.");

  script_tag(name:"insight", value:"freeIPA is prone to multiple vulnerabilities:

  - DoS attack against kerberized services by abusing password policy. (CVE-2016-7030)

  - Insufficient permission check in certprofile-mod. (CVE-2016-9575)");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"affected", value:"freeIPA prior version 4.3.3");

  script_tag(name:"solution", value:"Update to version 4.3.3 or later.");

  script_xref(name:"URL", value:"http://www.openwall.com/lists/oss-security/2017/01/02/5");
  script_xref(name:"URL", value:"https://pagure.io/freeipa/issue/6561");
  script_xref(name:"URL", value:"https://pagure.io/freeipa/issue/6560");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "40303")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "4.3.3");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
