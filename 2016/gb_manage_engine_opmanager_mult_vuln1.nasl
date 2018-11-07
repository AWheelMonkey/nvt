##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_manage_engine_opmanager_mult_vuln1.nasl 12096 2018-10-25 12:26:02Z asteins $
#
# ManageEngine OpManager Multiple Vulnerabilities
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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

CPE = 'cpe:/a:zohocorp:manageengine_opmanager';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106402");
  script_version("$Revision: 12096 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-25 14:26:02 +0200 (Thu, 25 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-11-22 11:33:23 +0700 (Tue, 22 Nov 2016)");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"WillNotFix");

  script_name("ManageEngine OpManager Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_manage_engine_opmanager_detect.nasl");
  script_mandatory_keys("OpManager/installed");

  script_tag(name:"summary", value:"ManageEngine OpManager is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple vulnerabilities were found in ManageEngine OpManager:

  - Denial of Service: When certain characters are in the EncryptPassword value the server process will go into an
infinite loop.

  - Multiple Cross-Site Scripting vulnerabilities: The User Defined DNS Names table in System Settings -> DNS fails
to sanitize user input. The ping and traceroute buttons on the MonitoringDevice page fail to sanitize the name of
the host being monitored.");

  script_tag(name:"impact", value:"A unauthenticated attacker may conduct a denial of service condition.
Unauthenticated attackers may inject web script or HTML and steal sensitive data and credentials");

  script_tag(name:"affected", value:"Version v12.2 and prior.");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer release, disable respective features, remove the product or replace the product by another one.");
  script_xref(name:"URL", value:"http://seclists.org/bugtraq/2016/Nov/70");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less_equal(version: version, test_version: "12.2")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "None available");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
