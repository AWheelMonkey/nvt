###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_41265.nasl 10472 2018-07-10 05:32:43Z cfischer $
#
# PHP 'strrchr()' Function Information Disclosure Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

CPE = "cpe:/a:php:php";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100695");
  script_version("$Revision: 10472 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 07:32:43 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2010-07-05 12:40:56 +0200 (Mon, 05 Jul 2010)");
  script_bugtraq_id(41265);
  script_cve_id("CVE-2010-2484");
  script_name("PHP 'strrchr()' Function Information Disclosure Vulnerability");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("gb_php_detect.nasl");
  script_mandatory_keys("php/installed");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/41265");
  script_xref(name:"URL", value:"http://permalink.gmane.org/gmane.comp.security.oss.general/3109");
  script_xref(name:"URL", value:"http://www.php.net/");

  script_tag(name:"impact", value:"Attackers can exploit this issue to obtain sensitive information that
  may lead to further attacks.");

  script_tag(name:"affected", value:"PHP 5 through 5.3.2 are vulnerable.");

  script_tag(name:"solution", value:"Updates are available. Please see the references for details.");

  script_tag(name:"summary", value:"PHP is prone to an information-disclosure vulnerability.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( port = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"5", test_version2:"5.3.2" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"5.3.3" );
  security_message( data:report, port:port );
  exit( 0 );
}

exit( 99 );