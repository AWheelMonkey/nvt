###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_ambari_cmd_exec_vuln.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# Apache Ambari Command Execution Vulnerability
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

CPE = "cpe:/a:apache:ambari";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106712");
  script_version("$Revision: 11863 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-03-31 11:19:39 +0700 (Fri, 31 Mar 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_cve_id("CVE-2016-6807");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Apache Ambari Command Execution Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_apache_ambari_detect.nasl");
  script_mandatory_keys("Apache/Ambari/Installed");

  script_tag(name:"summary", value:"Apache Ambrari is prone to an unauthenticated custom command execution
vulnerability.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"Custom commands may be executed on the Ambari Agent hosts without
authorization, leading to unauthorized access to operations that may affect the underlying system. Such
operations are invoked by the Ambari Agent process on Ambari Agent hosts, as the user executing the Ambari Agent
process.");

  script_tag(name:"affected", value:"Apache Ambari 2.4.0 to 2.4.1");

  script_tag(name:"solution", value:"Upgrade to version 2.4.2");

  script_xref(name:"URL", value:"https://cwiki.apache.org/confluence/display/AMBARI/Ambari+Vulnerabilities#AmbariVulnerabilities-FixedinAmbari2.4.2");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_in_range(version: version, test_version: "2.4.0", test_version2: "2.4.1")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.4.2");
  security_message(port: port, data: report);
  exit(0);
}


