###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_webmedia_explorer_44598.nasl 9042 2018-03-07 12:12:57Z cfischer $
#
# Webmedia Explorer HTML Injection Vulnerability
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

CPE = "cpe:/a:webmediaexplorer:webmedia_explorer";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100891");
  script_version("$Revision: 9042 $");
  script_tag(name:"last_modification", value:"$Date: 2018-03-07 13:12:57 +0100 (Wed, 07 Mar 2018) $");
  script_tag(name:"creation_date", value:"2010-11-03 12:47:25 +0100 (Wed, 03 Nov 2010)");
  script_bugtraq_id(44598);
  script_tag(name:"cvss_base", value:"2.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:N/I:P/A:N");
  script_name("Webmedia Explorer HTML Injection Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("webmedia_explorer_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("WebmediaExplorer/detected");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/44598");
  script_xref(name:"URL", value:"http://www.webmediaexplorer.com/");

  tag_summary = "Webmedia Explorer is prone to an HTML-injection vulnerability because
  it fails to properly sanitize user-supplied input before using it in
  dynamically generated content.";

  tag_impact = "Successful exploits will allow attacker-supplied HTML and script
  code to run in the context of the affected browser, potentially
  allowing the attacker to steal cookie-based authentication
  credentials or to control how the site is rendered to the user.
  Other attacks are also possible.";

  tag_affected = "Webmedia Explorer 6.13.1 is vulnerable; other versions may also
  be affected.";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_equal( version:vers, test_version:"6.13.1" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"Unknown" );
  security_message( port:port, data:report );
  exit( 0 );
}  

exit( 99 );