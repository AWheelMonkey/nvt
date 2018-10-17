###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ncm_multi_sql_inj_vuln.nasl 11291 2018-09-07 14:48:41Z mmartin $
#
# SolarWinds Network Configuration Manager Multiple SQL Injection Vulnerabilities
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
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

CPE = 'cpe:/a:solarwinds:network_configuration_manager';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105968");
  script_version("$Revision: 11291 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-07 16:48:41 +0200 (Fri, 07 Sep 2018) $");
  script_tag(name:"creation_date", value:"2015-03-06 13:46:22 +0700 (Fri, 06 Mar 2015)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_cve_id("CVE-2014-9566");

  script_name("SolarWinds Network Configuration Manager Multiple SQL Injection Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_orion_ncm_detect.nasl");
  script_mandatory_keys("orion_ncm/installed");

  script_tag(name:"summary", value:"SolarWinds Network Configuration Manager is prone to multiple
SQL Injection vulnerabilities.");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"insight", value:"On both the GetAccounts and GetAccountGroups endpoints, the
'sort' and 'dir' parameters are susceptible to boolean-/time-based, and stacked injections. The attacker
has to be authenticated but it can be even exploited under a guest account.");

  script_tag(name:"impact", value:"An authenticated attacker might execute arbitrary SQL commands
to compromise the application, access or modify data, or exploit latent vulnerabilities in the
underlying database.");

  script_tag(name:"affected", value:"SolarWinds NCM 7.3.1 and previous.");

  script_tag(name:"solution", value:"Upgrade to SolarWinds NCM 7.3.1 or later.");

  script_xref(name:"URL", value:"http://seclists.org/fulldisclosure/2015/Mar/18");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe:CPE))
  exit(0);

if (!version = get_app_version(cpe:CPE, port:port))
  exit(0);

if (version_is_less(version:version, test_version:"7.3.2")) {
  report = 'Installed Version: ' + version + '\n' +
           'Fixed Version:     7.3.2\n';
  security_message(port:port, data:report);
  exit(0);
}

exit(99);
