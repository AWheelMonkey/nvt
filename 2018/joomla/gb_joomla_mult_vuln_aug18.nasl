###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_joomla_mult_vuln_aug18.nasl 11161 2018-08-30 08:23:24Z asteins $
#
# Joomla! < 3.8.12 Multiple Vulnerabilities
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112371");
  script_version("$Revision: 11161 $");
  script_cve_id("CVE-2018-15880", "CVE-2018-15882");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-30 10:23:24 +0200 (Thu, 30 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-30 10:12:03 +0200 (Thu, 30 Aug 2018)");

  script_name("Joomla! < 3.8.12 Multiple Vulnerabilities");

  script_tag(name:"summary", value:"This host is running Joomla and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The following vulnerabilities exist:

  - Inadequate output filtering on the user profile page could lead to a stored XSS attack. (CVE-2018-15880)

  - Inadequate checks in the InputFilter class could allow specifically prepared PHAR files to pass the upload filter. (CVE-2018-15882)");

  script_tag(name:"affected", value:"Joomla! CMS versions 1.5.0 through 3.8.11");

  script_tag(name:"solution", value:"Upgrade to version 3.8.12 or later.
  For updates refer to https://www.joomla.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"https://developer.joomla.org/security-centre/744-20180802-core-stored-xss-vulnerability-in-the-frontend-profile.html");
  script_xref(name:"URL", value:"https://developer.joomla.org/security-centre/743-20180801-core-hardening-the-inputfilter-for-phar-stubs.html");

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("joomla_detect.nasl");
  script_mandatory_keys("joomla/installed");
  script_require_ports("Services/www", 80);

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

CPE = "cpe:/a:joomla:joomla";

if(!port = get_app_port(cpe:CPE))
  exit(0);

infos = get_app_version_and_location(cpe:CPE, port:port, exit_no_version:TRUE);
ver = infos['version'];
path = infos['location'];

if(version_in_range(version:ver, test_version:"1.5.0", test_version2:"3.8.11")) {
  report = report_fixed_ver(installed_version:ver, fixed_version:"3.8.12", install_path:path);
  security_message(port:port, data:report);
  exit(0);
}

exit(99);
