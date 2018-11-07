###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_phpmyadmin_csrf_vuln_PMASA-2017-9_win.nasl 12025 2018-10-23 08:16:52Z mmartin $
#
# phpMyAdmin XSRF/CSRF Vulnerability - PMASA-2017-9 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:phpmyadmin:phpmyadmin";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812373");
  script_version("$Revision: 12025 $");
  script_cve_id("CVE-2017-1000499");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-23 10:16:52 +0200 (Tue, 23 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-01-03 12:37:16 +0530 (Wed, 03 Jan 2018)");
  script_name("phpMyAdmin XSRF/CSRF Vulnerability - PMASA-2017-9 (Windows)");

  script_tag(name:"summary", value:"This host is running phpMyAdmin and is
  prone to cross site request forgery vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists as certain requests were
  not protected against CSRF attack.");

  script_tag(name:"impact", value:"Successful exploitation of this vulnerability
  will allow remote attackers to perform harmful database operations such as
  deleting records, dropping/truncating tables, etc.");

  script_tag(name:"affected", value:"phpMyAdmin versions 4.7.x prior to 4.7.7");

  script_tag(name:"solution", value:"Upgrade to phpMyAdmin version 4.7.7 or
  later.");

  script_xref(name:"URL", value:"https://www.phpmyadmin.net/security/PMASA-2017-9/");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_phpmyadmin_detect_900129.nasl", "os_detection.nasl");
  script_mandatory_keys("phpMyAdmin/installed", "Host/runs_windows");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

phpPort = "";
infos = "";
phpVer = "";
path = "";

if(!phpPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!infos = get_app_version_and_location(cpe:CPE, port:phpPort, exit_no_version:TRUE)) exit(0);
phpVer = infos['version'];
path = infos['location'];

if((phpVer =~ "^(4\.7\.)") && (version_is_less(version:phpVer, test_version:"4.7.7")))
{
  report = report_fixed_ver(installed_version:phpVer, fixed_version:"4.7.7", install_path:path);
  security_message(port:phpPort, data:report);
  exit(0);
}
exit(0);
