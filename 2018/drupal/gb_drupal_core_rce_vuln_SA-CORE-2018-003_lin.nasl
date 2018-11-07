###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_drupal_core_rce_vuln_SA-CORE-2018-003_lin.nasl 12012 2018-10-22 09:20:29Z asteins $
#
# Drupal Cross Site Scripting Vulnerability (SA-CORE-2018-003) (Linux)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = 'cpe:/a:drupal:drupal';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813212");
  script_version("$Revision: 12012 $");
  script_cve_id("CVE-2018-9861");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-22 11:20:29 +0200 (Mon, 22 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-04-19 14:09:14 +0530 (Thu, 19 Apr 2018)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("Drupal Cross Site Scripting Vulnerability (SA-CORE-2018-003) (Linux)");

  script_tag(name:"summary", value:"This host is running Drupal and is prone
  to a cross-site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists in 'CKEditor' used within
  the 'Enhanced Image (image2)' plugin, Which allows attackers to execute XSS
  inside CKEditor using the '<img>' tag and specially crafted HTML.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute a script on victim's Web browser within the security
  context of the hosting Web site.");

  script_tag(name:"affected", value:"Drupal core versions 8.x before 8.4.7 and

  Drupal core versions 8.5.0 before 8.5.2 on Linux.");

  script_tag(name:"solution", value:"Upgrade to Drupal core version 8.4.7,
  8.5.2 or later. For updates refer to the referenced links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://www.drupal.org/sa-core-2018-003");
  script_xref(name:"URL", value:"https://www.drupal.org/project/drupal");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("drupal_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("drupal/installed", "Host/runs_unixoide");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!drupalPort = get_app_port(cpe:CPE)) {
  exit(0);
}

if(!infos = get_app_version_and_location(cpe:CPE, port:drupalPort, version_regex:"^[0-9]\.[0-9.]+", exit_no_version:TRUE)) {
  exit(0);
}

drupalVer = infos['version'];
path = infos['location'];

if(version_in_range(version:drupalVer, test_version:"8.4.0", test_version2:"8.4.6")) {
  report = report_fixed_ver(installed_version:drupalVer, fixed_version:"8.4.7", install_path:path);
  security_message(data:report, port:drupalPort);
  exit(0);
}

if(version_in_range(version:drupalVer, test_version:"8.5.0", test_version2:"8.5.1")) {
  report = report_fixed_ver(installed_version:drupalVer, fixed_version:"8.5.2", install_path:path);
  security_message(data:report, port:drupalPort);
  exit(0);
}

exit(99);
