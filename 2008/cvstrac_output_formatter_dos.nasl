###############################################################################
# OpenVAS Vulnerability Test
# $Id: cvstrac_output_formatter_dos.nasl 9330 2018-04-05 12:11:08Z cfischer $
#
# CVSTrac text output formatter DoS
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
#
# Copyright:
# Copyright (C) 2007 David Maciejak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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

CPE = "cpe:/a:cvstrac:cvstrac";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.80015");
  script_version("$Revision: 9330 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-05 14:11:08 +0200 (Thu, 05 Apr 2018) $");
  script_tag(name:"creation_date", value:"2008-10-24 19:51:47 +0200 (Fri, 24 Oct 2008)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2007-0347");
  script_bugtraq_id(22296);
  script_xref(name:"OSVDB", value:"31935");
  script_name("CVSTrac text output formatter DoS");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2007 David Maciejak");
  script_family("Web application abuses");
  script_dependencies("cvstrac_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("cvstrac/detected");

  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/458455/30/0/threaded");

  script_tag(name:"solution", value:"Upgrade to CVSTrac 2.0.1 or later.");

  script_tag(name:"summary", value:"The remote web server contains a CGI script or is itself subject to a
  denial of service attack.

  Description :

  According to its version number, the version of CVSTrac installed on
  the remote host contains a flaw related to its Wiki-style text output
  formatter that may allow an attacker to cause a partial denial of service,
  depending on the pages requested.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( ereg( pattern:"^([01]\.|2\.0\.0[^0-9.]?)", string:vers ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"1.1.4" );
  security_message( port:port, data:report );
  exit( 0 );
}  

exit( 99 );