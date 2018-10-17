###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mcafee_epolicy_orchestrator_sql_inj_vuln.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# McAfee ePolicy Orchestrator SQL Injection Vulnerability
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

CPE = 'cpe:/a:mcafee:epolicy_orchestrator';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106681");
  script_version("$Revision: 11863 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-03-22 13:37:15 +0700 (Wed, 22 Mar 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_cve_id("CVE-2016-8027");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("McAfee ePolicy Orchestrator SQL Injection Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_mcafee_epolicy_orchestrator_detect.nasl");
  script_mandatory_keys("mcafee_ePO/installed");

  script_tag(name:"summary", value:"McAfee ePolicy Orchestrator is prone to a blind SQL injection
vulnerability");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"An exploitable blind SQL injection vulnerability exists within ePolicy
Orchestrator. A specially crafted HTTP post can allow an attacker to alter a SQL query, which can result in
disclosure of information within the database or impersonation of an agent without authentication.");

  script_tag(name:"affected", value:"ePO versions 5.1.3, 5.3.2 and prior.");

  script_tag(name:"solution", value:"Apply the appropriate hotfix.");

  script_xref(name:"URL", value:"https://kc.mcafee.com/corporate/index?page=content&id=SB10187");
  script_xref(name:"URL", value:"http://blog.talosintelligence.com/2017/02/vulnerability-spotlight-mcafee-epolicy.html");
  script_xref(name:"URL", value:"http://www.talosintelligence.com/reports/TALOS-2016-0229/");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

build = get_kb_item("mcafee_ePO/build");

if (version_is_less(version: version, test_version: "5.1.3")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "5.1.3 build 188");
  security_message(port: port, data: report);
  exit(0);
}

if (version_is_equal(version: version, test_version: "5.1.3")) {
  if (build && version_is_greater_equal(version: build, test_version: "188"))
    exit(99);

  report = report_fixed_ver(installed_version: version, fixed_version: "5.1.3 build 188");
  security_message(port: port, data: report);
  exit(0);
}

if (version_in_range(version: version, test_version: "5.2.0", test_version2: "5.3.2")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "See advisory.");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
