###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_archiva_csrf_vuln.nasl 11472 2018-09-19 11:20:06Z mmartin $
#
# Apache Archiva CSRF Vulnerability
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

CPE = 'cpe:/a:apache:archiva';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106825");
  script_version("$Revision: 11472 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-19 13:20:06 +0200 (Wed, 19 Sep 2018) $");
  script_tag(name:"creation_date", value:"2017-05-23 14:41:11 +0700 (Tue, 23 May 2017)");
  script_tag(name:"cvss_base", value:"6.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:P/A:P");

  script_cve_id("CVE-2017-5657");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Apache Archiva CSRF Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_apache_archiva_detect.nasl");
  script_mandatory_keys("apache_archiva/installed");

  script_tag(name:"summary", value:"Apache Archiva is prone to CSRF vulnerabilities for various REST
endpoints.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"Several REST service endpoints of Apache Archiva are not protected against
CSRF attacks.");

  script_tag(name:"impact", value:"A malicious site opened in the same browser as the archiva site, may send
HTML response that performs arbitrary actions on archiva services, with the same rights as the active archiva
session (e.g. administrator rights).");

  script_tag(name:"affected", value:"Apache Archiva prior to version 2.2.3.");

  script_tag(name:"solution", value:"Upgrade to version 2.2.3 or later.");

  script_xref(name:"URL", value:"https://archiva.apache.org/security.html#CVE-2017-5657");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "2.2.3")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.2.3");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
