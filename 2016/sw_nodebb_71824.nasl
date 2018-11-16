###############################################################################
# OpenVAS Vulnerability Test
# $Id: sw_nodebb_71824.nasl 12338 2018-11-13 14:51:17Z asteins $
#
# NodeBB 'markdown' Plugin Stored Cross Site Scripting Vulnerability
#
# Authors:
# Christian Fischer <info@schutzwerk.com>
#
# Copyright:
# Copyright (c) 2016 SCHUTZWERK GmbH
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

CPE = "cpe:/a:nodebb:nodebb";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.111101");
  script_version("$Revision: 12338 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-13 15:51:17 +0100 (Tue, 13 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-05-07 16:00:00 +0200 (Sat, 07 May 2016)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2015-3296", "CVE-2015-3295");
  script_bugtraq_id(71824);
  script_name("NodeBB 'markdown' Plugin Stored Cross Site Scripting Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 SCHUTZWERK GmbH");
  script_family("Web application abuses");
  script_dependencies("sw_nodebb_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("NodeBB/installed");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/71824");
  script_xref(name:"URL", value:"http://seclists.org/oss-sec/2015/q2/94");

  script_tag(name:"summary", value:"This host is running NodeBB and is prone to a stored Cross Site Scripting
  vulnerability.");
  script_tag(name:"impact", value:"Exploiting this vulnerability may allow an attacker to perform cross-site scripting attacks on unsuspecting users
  in the context of the affected website. As a result, the attacker may be able to steal cookie-based authentication credentials and to launch other attacks.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"affected", value:"NodeBB version prior to 0.7.0");
  script_tag(name:"solution", value:"Update your NodeBB to a non-affected version.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable"); # markdown plugin might be disabled

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! ver = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less( version:ver, test_version:"0.7.0" ) ) {
  report = report_fixed_ver( installed_version:ver, fixed_version:"0.7.0" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );