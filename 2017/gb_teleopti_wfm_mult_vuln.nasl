###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_teleopti_wfm_mult_vuln.nasl 11874 2018-10-12 11:28:04Z mmartin $
#
# Teleopti WFM Multiple Vulnerabilities
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

CPE = "cpe:/a:teleopit:wfm";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106575");
  script_version("$Revision: 11874 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:28:04 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-02-07 15:18:23 +0700 (Tue, 07 Feb 2017)");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Teleopti WFM Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_teleopti_wfm_detect.nasl");
  script_mandatory_keys("teleopti_wfm/installed");

  script_tag(name:"summary", value:"Teleopti WFM is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"Teleopti WFM is prone to multiple vulnerabilities:

  - Server Response Contains Plaintext Username and Password

  - Server Response Contains Password Hashes and Authorization Tokens

  - Improper Data Validation Allowing Unauthenticated Admin User Creation");

  script_tag(name:"affected", value:"Version 7.1.0 and previous versions.");

  script_tag(name:"solution", value:"Check with the vendor which version resolves the vulnerabilities.");

  script_xref(name:"URL", value:"http://seclists.org/fulldisclosure/2017/Feb/13");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less_equal(version: version, test_version: "7.1.0")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "Check with vendor.");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
