###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_phpmailer_xss_vuln.nasl 11485 2018-09-20 06:25:34Z cfischer $
#
# PHPMailer XSS Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

CPE = "cpe:/a:phpmailer_project:phpmailer";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106987");
  script_version("$Revision: 11485 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-20 08:25:34 +0200 (Thu, 20 Sep 2018) $");
  script_tag(name:"creation_date", value:"2017-07-27 15:21:49 +0700 (Thu, 27 Jul 2017)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2017-11503");
  script_bugtraq_id(99293);
  script_name("PHPMailer XSS Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_phpmailer_detect.nasl");
  script_mandatory_keys("phpmailer/detected");

  script_xref(name:"URL", value:"https://github.com/PHPMailer/PHPMailer/releases");
  script_xref(name:"URL", value:"https://cxsecurity.com/issue/WLB-2017060181");
  script_xref(name:"URL", value:"https://github.com/PHPMailer/PHPMailer/blob/master/SECURITY.md");

  script_tag(name:"summary", value:"PHPMailer is prone to a cross-site scripting vulneragility in the
  'From Email Address' and 'To Email Address' fields of code_generator.php.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"affected", value:"PHPMailer version 5.2.23 and prior.");

  script_tag(name:"solution", value:"Update to version 5.2.24 or later.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! infos = get_app_version_and_location( cpe:CPE, port:port, exit_no_version:TRUE ) ) exit( 0 );
version  = infos['version'];
location = infos['location'];

if( version_is_less( version:version, test_version:"5.2.24" ) ) {
  report = report_fixed_ver( installed_version:version, fixed_version:"5.2.24", install_url:location );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );