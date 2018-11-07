###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_some_vuln_may16_lin.nasl 11961 2018-10-18 10:49:40Z asteins $
#
# WordPress Same Origin Method Execution Vulnerability May16 (Linux)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.808049");
  script_version("$Revision: 11961 $");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-18 12:49:40 +0200 (Thu, 18 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-05-19 10:40:58 +0530 (Thu, 19 May 2016)");
  script_name("WordPress Same Origin Method Execution Vulnerability May16 (Linux)");

  script_tag(name:"summary", value:"This host is running WordPress and is prone
  to same origin method execution vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error in wordpress
  Plupload library used for uploading files.");

  script_tag(name:"impact", value:"Successfully exploiting this issue allow
  remote attacker to execute arbitrary script code on the endpoint's domain.");

  script_tag(name:"affected", value:"WordPress versions prior to 4.5.2 on Linux.");

  script_tag(name:"solution", value:"Upgrade to WordPress version 4.5.2 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"https://wordpress.org/news/2016/05/wordpress-4-5-2");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("os_detection.nasl", "secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed", "Host/runs_unixoide");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!wpPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!wpVer = get_app_version(cpe:CPE, port:wpPort)){
  exit(0);
}

if(version_is_less(version:wpVer, test_version:"4.5.2"))
{
  report = report_fixed_ver(installed_version:wpVer, fixed_version:"4.5.2");
  security_message(data:report, port:wpPort);
  exit(0);
}
