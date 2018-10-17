###############################################################################
# OpenVAS Vulnerability Test
# $Id: cvstrac_ticket_title.nasl 9330 2018-04-05 12:11:08Z cfischer $
#
# CVSTrac ticket title arbitrary command execution
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
# based on work from (C) Tenable Network Security
#
# Copyright:
# Copyright (C) 2004 David Maciejak
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
  script_oid("1.3.6.1.4.1.25623.1.0.14290");
  script_version("$Revision: 9330 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-05 14:11:08 +0200 (Thu, 05 Apr 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name:"OSVDB", value:"8645");
  script_name("CVSTrac ticket title arbitrary command execution");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2004 David Maciejak");
  script_family("Web application abuses");
  script_dependencies("cvstrac_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("cvstrac/detected");

  script_tag(name:"solution", value:"Update to version 1.1.4 or disable this CGI suite.");

  script_tag(name:"summary", value:"The remote host seems to be running cvstrac,
  a web-based bug and patch-set tracking system for CVS.

  This version contains a flaw related to ticket titles
  containing a semi-colon that may allow an attacker
  to execute arbitrary commands on the system.

  ***** OpenVAS has determined the vulnerability exists on the target
  ***** simply by looking at the version number(s) of CVSTrac
  ***** installed there.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( ereg( pattern:"^(0\.|1\.(0|1\.[0-3]([^0-9]|$)))", string:vers ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"1.1.4" );
  security_message( port:port, data:report );
  exit( 0 );
}  

exit( 99 );