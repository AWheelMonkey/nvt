###############################################################################
# OpenVAS Vulnerability Test
# $Id: phpgroupware_xss.nasl 5613 2017-03-20 10:08:39Z cfi $
#
# PhpGroupWare XSS
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

CPE = "cpe:/a:phpgroupware:phpgroupware";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.14708");
  script_version("$Revision: 5613 $");
  script_tag(name:"last_modification", value:"$Date: 2017-03-20 11:08:39 +0100 (Mon, 20 Mar 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_bugtraq_id(11130);
  script_cve_id("CVE-2004-0875");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("PhpGroupWare XSS");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2004 David Maciejak");
  script_family("Web application abuses");
  script_dependencies("phpgroupware_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("phpGroupWare/installed");

  script_xref(name:"URL", value:"http://www.phpgroupware.org/");

  tag_summary = "The remote host seems to be running PhpGroupWare, is a multi-user groupware 
  suite written in PHP.";

  tag_insight = "This issue exists due to a lack of sanitization of user-supplied data.
  A malicious attacker can exploited a flaw to conduct cross-site scripting attacks.";

  tag_solution = "Update to version 0.9.16.003 or newer.";

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"insight", value:tag_insight);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( ereg( pattern:"^0\.([0-8]\.|9\.([0-9]\.|1[0-5]\.|16\.0*[0-2]([^0-9]|$)))", string:vers ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"0.9.16.003" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
