###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mediawiki_38617.nasl 6284 2017-06-06 11:43:39Z cfischer $
#
# MediaWiki 'thumb.php' Security Bypass Vulnerability
#
# Authors:
# Michael Meyer
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

CPE = "cpe:/a:mediawiki:mediawiki";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100535");
  script_version("$Revision: 6284 $");
  script_tag(name:"last_modification", value:"$Date: 2017-06-06 13:43:39 +0200 (Tue, 06 Jun 2017) $");
  script_tag(name:"creation_date", value:"2010-03-15 19:33:39 +0100 (Mon, 15 Mar 2010)");
  script_bugtraq_id(38617);
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:N");
  script_name("MediaWiki 'thumb.php' Security Bypass Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("secpod_mediawiki_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("mediawiki/installed");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/38617");
  script_xref(name:"URL", value:"http://lists.wikimedia.org/pipermail/mediawiki-announce/2010-March/000088.html");
  script_xref(name:"URL", value:"http://wikipedia.sourceforge.net/");

  tag_summary = "MediaWiki is prone to a security-bypass vulnerability because it fails
  to properly restrict access to restricted content.";

  tag_impact = "An attacker can exploit this issue to bypass intended security
  measures to view restricted content in private wikis.";

  tag_affected = "Versions after MediaWiki 1.15 and prior to MediaWiki 1.15.2 are vulnerable.";

  tag_solution = "Updates are available. Please see the references for more information.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"1.15.0", test_version2:"1.15.1" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"1.15.2" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );