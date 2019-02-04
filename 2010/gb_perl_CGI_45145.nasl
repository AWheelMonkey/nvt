###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_perl_CGI_45145.nasl 12740 2018-12-10 11:49:57Z cfischer $
#
# Perl CGI.pm Header Values Newline Handling Unspecified Security Vulnerability
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:andy_armstrong:cgi.pm";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100929");
  script_version("$Revision: 12740 $");
  script_bugtraq_id(45145);
  script_cve_id("CVE-2010-4410", "CVE-2010-4411");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-12-10 12:49:57 +0100 (Mon, 10 Dec 2018) $");
  script_tag(name:"creation_date", value:"2010-12-02 12:48:19 +0100 (Thu, 02 Dec 2010)");
  script_name("Perl CGI.pm Header Values Newline Handling Unspecified Security Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("gb_perl_modules_detect_lin.nasl");
  script_mandatory_keys("perl/linux/modules/cgi/detected");

  script_xref(name:"URL", value:"https://www.securityfocus.com/bid/45145");
  script_xref(name:"URL", value:"http://search.cpan.org/~lds/CGI.pm-3.50/");
  script_xref(name:"URL", value:"http://www.perl.com");
  script_xref(name:"URL", value:"http://perl5.git.perl.org/perl.git/commit/84601d63a7e34958da47dad1e61e27cb3bd467d1");

  script_tag(name:"solution", value:"Updates are available. Please see the references for more information.");

  script_tag(name:"summary", value:"Perl CGI.pm is prone to an unspecified security vulnerability related
  to handling of newlines embedded in header values.");

  script_tag(name:"qod_type", value:"executable_version_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");
 
if( ! infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE ) )
  exit( 0 );
 
vers = infos['version'];
path = infos['location'];

if( version_is_less( version:vers, test_version:"3.50" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"3.50", install_path:path );
  security_message( port:0, data:report );
  exit( 0 );
}
 
exit( 99 );