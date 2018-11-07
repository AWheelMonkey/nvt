###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_websphere_portal_dos_vuln.nasl 12096 2018-10-25 12:26:02Z asteins $
#
# IBM WebSphere Portal DoS Vulnerability
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

CPE = 'cpe:/a:ibm:websphere_portal';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106199");
  script_version("$Revision: 12096 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-25 14:26:02 +0200 (Thu, 25 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-08-25 13:21:11 +0700 (Thu, 25 Aug 2016)");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");

  script_cve_id("CVE-2015-7419");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("IBM WebSphere Portal DoS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ibm_websphere_portal_detect.nasl");
  script_mandatory_keys("ibm_websphere_portal/installed");

  script_tag(name:"summary", value:"IBM WebSphere Portal is prone to a denial of service vulnerability.");

  script_tag(name:"insight", value:"By sending malicious requests, a remote attacker could exploit this
vulnerability to cause the consumption of all memory resources to cause a denial of service.");

  script_tag(name:"impact", value:"Successful exploitation will lead to a denial of service.");

  script_tag(name:"affected", value:"IBM WebSphere Portal 8.0.0.1 before CF19 and 8.5.0 before CF09");

  script_tag(name:"solution", value:"For 8.5.0 upgrade to Cumulative Fix 09, for 8.0.0.1 upgrade to
Cumulative Fix 19.");

  script_xref(name:"URL", value:"https://www-01.ibm.com/support/docview.wss?uid=swg21969906");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version =~ "^8\.5\.0") {
  if (version_is_less(version: version, test_version: "8.5.0.0.19")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "8.5.0.0 CF19");
    security_message(port: port, data: report);
    exit(0);
  }
}

if (version =~ "^8\.0\.0\.1") {
  if (version_is_less(version: version, test_version: "8.0.0.1.9")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "8.0.0.1 CF9");
    security_message(port: port, data: report);
    exit(0);
  }
}

exit(0);
