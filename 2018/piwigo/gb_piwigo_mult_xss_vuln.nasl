###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_piwigo_mult_xss_vuln.nasl 12025 2018-10-23 08:16:52Z mmartin $
#
# Piwigo 2.9.3 Multiple XSS Vulnerabilities
#
# Authors:
# Jan Philipp Schulte <jan.schulte@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, https://www.greenbone.net
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

if( description )
{
  script_oid("1.3.6.1.4.1.25623.1.0.113128");
  script_version("$Revision: 12025 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-23 10:16:52 +0200 (Tue, 23 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-03-08 14:54:00 +0100 (Thu, 08 Mar 2018)");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"NoneAvailable");

  script_cve_id("CVE-2018-7722", "CVE-2018-7723", "CVE-2018-7724");

  script_name("Piwigo 2.9.3 Multiple XSS Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_piwigo_detect.nasl");
  script_mandatory_keys("piwigo/installed");

  script_tag(name:"summary", value:"Piwigo is prone to multiple stored XSS vulnerabilities.");
  script_tag(name:"vuldetect", value:"The script checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"There are three vulnerabilities:

  - The management panel in Piwigo has stored XSS via the name parameter in a /ws.php request.

  - The management panel in Piwigo has stored XSS via the virtual_name parameter in a /admin.php request.

  - The management panel in Piwigo has stored XSS via the name parameter in a /admin.php?page request.");

  script_tag(name:"impact", value:"Successful exploitation would allow an attacker to inject arbitrary HTML and JavaScript into the website.");
  script_tag(name:"affected", value:"Piwigo through version 2.9.3.");

  script_tag(name:"solution", value:"No known solution is available as of 18th May, 2018. Information regarding
this issue will be updated once solution details are available.");

  script_xref(name:"URL", value:"https://github.com/summ3rf/Vulner/blob/master/Piwigo%20Store%20XSS.md");

  exit(0);
}

CPE = "cpe:/a:piwigo:piwigo";

include( "host_details.inc" );
include( "version_func.inc" );

if( ! port = get_app_port( cpe: CPE ) ) exit( 0 );
if( ! version = get_app_version( cpe: CPE, port: port ) ) exit( 0 );

if( version_is_less_equal( version: version, test_version: "2.9.3" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "None" );
  security_message( data: report, port: port );
  exit( 0 );
}

exit( 99 );
