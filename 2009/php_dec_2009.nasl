###############################################################################
# OpenVAS Vulnerability Test
# $Id: php_dec_2009.nasl 10459 2018-07-09 07:41:24Z cfischer $
#
# PHP < 5.2.12 Multiple Vulnerabilities
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.100409");
  script_version("$Revision: 10459 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-09 09:41:24 +0200 (Mon, 09 Jul 2018) $");
  script_tag(name:"creation_date", value:"2009-12-18 16:46:00 +0100 (Fri, 18 Dec 2009)");
  script_bugtraq_id(37390,37389);
  script_cve_id("CVE-2009-4143","CVE-2009-4142");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("PHP < 5.2.12 Multiple Vulnerabilities");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("gb_php_detect.nasl");
  script_mandatory_keys("php/installed");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/37390");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/37389");
  script_xref(name:"URL", value:"http://www.php.net/ChangeLog-5.php#5.2.12");
  script_xref(name:"URL", value:"http://www.php.net/releases/5_2_12.php");
  script_xref(name:"URL", value:"http://www.php.net");
  script_xref(name:"URL", value:"http://www.suspekt.org/downloads/POC2009-ShockingNewsInPHPExploitation.pdf");
  script_xref(name:"URL", value:"http://www.blackhat.com/presentations/bh-usa-09/ESSER/BHUSA09-Esser-PostExploitationPHP-PAPER.pdf");
  script_xref(name:"URL", value:"http://d.hatena.ne.jp/t_komura/20091004/1254665511");
  script_xref(name:"URL", value:"http://bugs.php.net/bug.php?id=49785");

  script_tag(name:"impact", value:"Attackers can exploit the code execution vulnerability to execute
  arbitrary code within the context of the PHP process. This may allow
  them to bypass intended security restrictions or gain elevated privileges.

  An attacker may leverage the cross-site scripting vulnerability to
  execute arbitrary script code in the browser of an unsuspecting user
  in the context of the affected site. This may let the attacker steal
  cookie-based authentication credentials and launch other attacks.");

  script_tag(name:"affected", value:"Versions prior to PHP 5.2.12 are vulnerable.");

  script_tag(name:"solution", value:"Updates are available. Please see the references for more information.");

  script_tag(name:"summary", value:"PHP is prone to a cross-site scripting vulnerability and to a code
  execution vulnerability.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( port = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"5.2", test_version2:"5.2.11" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"5.2.12" );
  security_message( data:report, port:port );
  exit( 0 );
}

exit( 99 );