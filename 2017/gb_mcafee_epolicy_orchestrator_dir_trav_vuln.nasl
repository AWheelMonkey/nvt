###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mcafee_epolicy_orchestrator_dir_trav_vuln.nasl 12106 2018-10-26 06:33:36Z cfischer $
#
# McAfee ePolicy Orchestrator Directory Traversal Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.106824");
  script_version("$Revision: 12106 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 08:33:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-05-23 11:00:56 +0700 (Tue, 23 May 2017)");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");

  script_cve_id("CVE-2017-3980");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("McAfee ePolicy Orchestrator Directory Traversal Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_mcafee_epolicy_orchestrator_detect.nasl");
  script_mandatory_keys("mcafee_ePO/installed");

  script_tag(name:"summary", value:"McAfee ePolicy Orchestrator is prone to a directory traversal vulnerability
which allows remote authenticated users to execute a command of their choice via an authenticated ePO session.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"ePO versions 5.1.3, , 5.3.1, 5.3.2, 5.9.0 and prior.");

  script_tag(name:"solution", value:"Apply the appropriate hotfix.");

  script_xref(name:"URL", value:"https://kc.mcafee.com/corporate/index?page=content&id=SB10196");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less_equal(version: version, test_version: "5.1.3")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "Apply hotfix EPO513HF1193124.zip");
  security_message(port: port, data: report);
  exit(0);
}

if (version_is_equal(version: version, test_version: "5.3.1")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "Apply hotfix EPO531HF1194398.zip");
  security_message(port: port, data: report);
  exit(0);
}

if (version_is_equal(version: version, test_version: "5.3.2")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "Apply hotfix EPO532HF1193123.zip");
  security_message(port: port, data: report);
  exit(0);
}

if (version_is_equal(version: version, test_version: "5.9.0")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "Apply hotfix EPO590HF1193951.zip");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
