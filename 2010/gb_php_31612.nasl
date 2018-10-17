###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_31612.nasl 10459 2018-07-09 07:41:24Z cfischer $
#
# PHP FastCGI Module File Extension Denial Of Service Vulnerabilities
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
  script_oid("1.3.6.1.4.1.25623.1.0.100582");
  script_version("$Revision: 10459 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-09 09:41:24 +0200 (Mon, 09 Jul 2018) $");
  script_tag(name:"creation_date", value:"2010-04-19 20:46:01 +0200 (Mon, 19 Apr 2010)");
  script_bugtraq_id(31612);
  script_cve_id("CVE-2008-3660");
  script_name("PHP FastCGI Module File Extension Denial Of Service Vulnerabilities");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("gb_php_detect.nasl");
  script_mandatory_keys("php/installed");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/31612");
  script_xref(name:"URL", value:"http://www.openwall.com/lists/oss-security/2008/08/08/2");
  script_xref(name:"URL", value:"http://www.php.net/ChangeLog-5.php#5.2.8");
  script_xref(name:"URL", value:"http://www.php.net");
  script_xref(name:"URL", value:"http://support.avaya.com/elmodocs2/security/ASA-2009-161.htm");

  script_tag(name:"impact", value:"Attackers can exploit this issue to crash the affected application,
  denying service to legitimate users.");

  script_tag(name:"affected", value:"PHP 4.4 prior to 4.4.9 and PHP 5.2 through 5.2.6 are vulnerable.");

  script_tag(name:"solution", value:"Updates are available. Please see the references for more information.");

  script_tag(name:"summary", value:"PHP is prone to a denial-of-service vulnerability because the
  application fails to handle certain file requests.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( port = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( vers =~ "^4\.4" ) {
  if( version_is_less( version:vers, test_version: "4.4.9" ) ) {
    vuln = TRUE;
    fix = "4.4.9";
  }
} else if( vers =~ "^5\.2" ) {
  if( version_is_less( version:vers, test_version: "5.2.8" ) ) {
    vuln = TRUE;
    fix = "5.2.8";
  }
}

if( vuln ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:fix );
  security_message( data:report, port:port );
  exit( 0 );
}

exit( 99 );