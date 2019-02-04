###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_perl_safe_40305.nasl 12740 2018-12-10 11:49:57Z cfischer $
#
# Perl Safe Module 'reval()' and 'rdo()' CVE-2010-1447 Restriction-Bypass Vulnerabilities
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

CPE = "cpe:/a:rafael_garcia-suarez:safe";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100673");
  script_version("$Revision: 12740 $");
  script_bugtraq_id(40305);
  script_cve_id("CVE-2010-1447");
  script_tag(name:"cvss_base", value:"8.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-12-10 12:49:57 +0100 (Mon, 10 Dec 2018) $");
  script_tag(name:"creation_date", value:"2010-06-14 14:19:59 +0200 (Mon, 14 Jun 2010)");
  script_name("Perl Safe Module 'reval()' and 'rdo()' Restriction-Bypass Vulnerabilities");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("gb_perl_modules_detect_lin.nasl");
  script_mandatory_keys("perl/linux/modules/safe/detected");

  script_xref(name:"URL", value:"https://www.securityfocus.com/bid/40305");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2010-1447");
  script_xref(name:"URL", value:"http://permalink.gmane.org/gmane.comp.security.oss.general/2932");
  script_xref(name:"URL", value:"http://cpansearch.perl.org/src/RGARCIA/Safe-2.27/Changes");
  script_xref(name:"URL", value:"http://search.cpan.org/~rgarcia/Safe-2.27/Safe.pm");

  script_tag(name:"summary", value:"The Perl Safe module is prone to multiple restriction-bypass
  vulnerabilities.");

  script_tag(name:"impact", value:"Successful exploits could allow an attacker
  to execute arbitrary Perl code outside of the restricted root.");

  script_tag(name:"affected", value:"Versions prior to Safe 2.27 are vulnerable.");

  script_tag(name:"solution", value:"Updates are available. Please see the references for more information.");

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

if( version_is_less( version:vers, test_version:"2.27" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"2.27", install_path:path );
  security_message( port:0, data:report );
  exit( 0 );
}
 
exit( 99 );