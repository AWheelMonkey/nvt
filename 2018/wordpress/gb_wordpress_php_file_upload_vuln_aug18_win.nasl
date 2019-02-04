###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_php_file_upload_vuln_aug18_win.nasl 12956 2019-01-07 10:14:49Z ckuersteiner $
#
# Wordpress PHP File Upload Vulnerability August 18 (Windows)
#
# Authors:
# Rajat Mishra <rajatm@secpod.com>
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

CPE = "cpe:/a:wordpress:wordpress";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813910");
  script_version("$Revision: 12956 $");
  script_cve_id("CVE-2018-14028");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-07 11:14:49 +0100 (Mon, 07 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-08-13 12:43:12 +0530 (Mon, 13 Aug 2018)");

  script_name("Wordpress PHP File Upload Vulnerability August 18 (Windows)");

  script_tag(name:"summary", value:"This host is running WordPress and is prone
  to PHP file upload vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists as the plugins uploaded via
  the admin area are not verified as being ZIP files.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to upload php files in a predictable wp-content/uploads location and
  execute them.");

  script_tag(name:"affected", value:"All wordpress versions through 4.9.8 on Windows");

  script_tag(name:"solution", value:"No known solution is available as of 07th January, 2019.
  Information regarding this issue will be updated once solution details are available.");

  script_tag(name:"solution_type", value:"NoneAvailable");
  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"https://rastating.github.io/unrestricted-file-upload-via-plugin-uploader-in-wordpress");
  script_xref(name:"URL", value:"https://core.trac.wordpress.org/ticket/44710");
  script_xref(name:"URL", value:"https://github.com/rastating/wordpress-exploit-framework/pull/52");
  script_xref(name:"URL", value:"https://wordpress.org");

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("os_detection.nasl", "secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed", "Host/runs_windows");
  script_require_ports("Services/www", 80);

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!wordPort = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location(cpe:CPE, port:wordPort, exit_no_version:TRUE);
vers = infos['version'];
path = infos['location'];

if(version_is_less_equal(version:vers, test_version:"4.9.8"))
{
  report = report_fixed_ver(installed_version:vers, fixed_version:"NoneAvailable", install_path:path);
  security_message(data:report, port:wordPort);
  exit(0);
}
exit(0);
