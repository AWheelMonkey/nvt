###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nextcloud_server_nc-sa-2018-010_win.nasl 12185 2018-11-01 11:19:37Z asteins $
#
# Nextcloud Server < 14.0.0, < 13.0.6, < 12.0.11 Improper validation of permissions (NC-SA-2018-010) (Windows)
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112414");
  script_version("$Revision: 12185 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-01 12:19:37 +0100 (Thu, 01 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-01 11:49:50 +0100 (Thu, 01 Nov 2018)");
  script_tag(name:"cvss_base", value:"6.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:S/C:C/I:C/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_cve_id("CVE-2018-16466");

  script_name("Nextcloud Server < 14.0.0, < 13.0.6, < 12.0.11 Improper validation of permissions (NC-SA-2018-010) (Windows)");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_nextcloud_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("nextcloud/installed", "Host/runs_windows");

  script_tag(name:"summary", value:"This host is running Nextcloud Server
  and is prone to an improper access restriction vulnerability.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"Improper revalidation of permissions lead to not accepting access restrictions by access tokens.");
  script_tag(name:"affected", value:"Nextcloud Server before version 14.0.0, 13.0.x before 13.0.6 and 12.0.x before 12.0.11.");
  script_tag(name:"solution", value:"Upgrade Nextcloud Server to version 12.0.11, 13.0.6, or 14.0.0 respectively.");

  script_xref(name:"URL", value:"https://hackerone.com/reports/388515");
  script_xref(name:"URL", value:"https://nextcloud.com/security/advisory/?id=NC-SA-2018-010");

  exit(0);
}

CPE = "cpe:/a:nextcloud:nextcloud";

include("version_func.inc");
include("host_details.inc");

if(!port = get_app_port(cpe: CPE)) exit(0);
if(!infos = get_app_version_and_location(cpe:CPE, port:port, exit_no_version:TRUE)) exit(0);

vers = infos['version'];
path = infos['location'];

if(version_is_less(version:vers, test_version:"12.0.11")) {
  report = report_fixed_ver(installed_version:vers, fixed_version:"12.0.11", install_path:path);
  security_message(port:port, data:report);
  exit(0);
}

if(version_in_range(version:vers, test_version:"13.0.0", test_version2:"13.0.5")) {
  report = report_fixed_ver(installed_version:vers, fixed_version:"13.0.6", install_path:path);
  security_message(port:port, data:report);
  exit(0);
}

exit(99);
