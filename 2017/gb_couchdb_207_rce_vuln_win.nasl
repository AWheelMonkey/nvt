###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_couchdb_207_rce_vuln_win.nasl 12106 2018-10-26 06:33:36Z cfischer $
#
# CouchDB Multiple Vulnerabilities (Windows)
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:apache:couchdb";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107259");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_version("$Revision: 12106 $");

  script_name("CouchDB Multiple Vulnerabilities (Windows)");

  script_cve_id("CVE-2017-12635", "CVE-2017-12636");
  script_xref(name:"URL", value:"https://blog.couchdb.org/2017/11/14/apache-couchdb-cve-2017-12635-and-cve-2017-12636/");
  script_xref(name:"URL", value:"https://justi.cz/security/2017/11/14/couchdb-rce-npm.html");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 08:33:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-11-16 11:20:26 +0700 (Thu, 16 Nov 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_couchdb_detect.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 5984);
  script_mandatory_keys("couchdb/installed", "Host/runs_windows");

  script_tag(name:"summary", value:"This host is installed with Apache CouchDB and is prone to multiple vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"solution", value:"Upgrade to version 1.7.0 or 2.1.1 or later.");
  script_tag(name:"insight", value:"The vulnerabilities are due to differences in the Erlang-based JSON parser and JavaScript-based JSON parser.");
  script_tag(name:"affected", value:"CouchDB Versions before 1.7.0 and 2.1.1.");

  script_tag(name:"impact", value:"These Vulnerabilities can be used to give non-admin users access to arbitrary shell commands on the server as the database system user.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe:CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version =~ "^1\.")
{
 if (version_is_less(version: version, test_version: "1.7.0"))
 {
   fix = "1.7.0";
   VULN = TRUE;
 }
}

else if (version =~ "^2\.")
{
 if (version_is_less(version: version, test_version: "2.1.1"))
 {
   fix = "2.1.1";
   VULN = TRUE;
 }
}

if (VULN)
{
  report = report_fixed_ver(installed_version: version, fixed_version: fix);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);

