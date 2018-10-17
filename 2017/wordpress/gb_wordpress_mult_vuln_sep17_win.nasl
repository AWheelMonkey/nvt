###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_mult_vuln_sep17_win.nasl 7640 2017-11-03 07:40:38Z asteins $
#
# WordPress Multiple Vulnerabilities - Sep 2017 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:wordpress:wordpress";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811783");
  script_version("$Revision: 7640 $");
  script_cve_id("CVE-2017-14723");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-11-03 08:40:38 +0100 (Fri, 03 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-09-21 12:01:02 +0530 (Thu, 21 Sep 2017)");
  script_name("WordPress Multiple Vulnerabilities - Sep 2017 (Windows)");

  script_tag(name:"summary", value:"This host is running WordPress and is prone
  to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  the detect NVT and check if the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - '$wpdb->prepare' can create unexpected and unsafe queries.

  - An unspecified error in the customizer.

  - Multiple other unspecified errors.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to conduct cross site scripting, SQL injection, directory traversal
  and open redirect attacks.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"WordPress versions 4.8.1 and earlier");

  script_tag(name: "solution" , value:"Upgrade to WordPress version 4.8.2 or later.
  For details refer to,  https://wordpress.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");
  script_xref(name : "URL" , value : "https://codex.wordpress.org/Version_4.8.2");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("os_detection.nasl", "secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed", "Host/runs_windows");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

##Get Port
if(!wordPort = get_app_port(cpe:CPE)){
  exit(0);
}

##Get Version
if(!vers = get_app_version(cpe:CPE, port:wordPort)){
  exit(0);
}

##Check for version
if(version_is_less(version:vers, test_version:"4.8.2"))
{
  report = report_fixed_ver(installed_version:vers, fixed_version:"4.8.2");
  security_message(data:report, port:wordPort);
  exit(0);
}
exit(0);
