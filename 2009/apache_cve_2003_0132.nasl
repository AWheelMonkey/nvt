##############################################################################
# OpenVAS Vulnerability Test
# $Id: apache_cve_2003_0132.nasl 9219 2018-03-27 11:58:13Z cfischer $
#
# Apache Web Server Linefeed Memory Allocation Denial Of Service
# Vulnerability
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

CPE = "cpe:/a:apache:http_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100171");
  script_version("$Revision: 9219 $");
  script_tag(name:"last_modification", value:"$Date: 2018-03-27 13:58:13 +0200 (Tue, 27 Mar 2018) $");
  script_tag(name:"creation_date", value:"2009-05-02 19:46:33 +0200 (Sat, 02 May 2009)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2003-0132");
  script_bugtraq_id(7254);
  script_name("Apache Web Server Linefeed Memory Allocation Denial Of Service Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("secpod_apache_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("apache/installed");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/7254");
  script_xref(name:"URL", value:"http://httpd.apache.org/");

  tag_solution = "This vulnerability does not affect Apache 2.0.45. Users are advised to upgrade.";

  tag_summary = "Apache 2.0 series webservers are prone to a denial-of-service
  condition.";

  tag_insight = "This issue occurs because of the way that Apache handles
  excessive amounts of consecutive linefeed characters.";

  tag_impact = "The server may allocate large amounts of memory, resulting in a denial of
  service.";

  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"impact", value:tag_impact);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less( version:vers, test_version:"2.0.45" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"2.0.45" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
