###############################################################################
# OpenVAS Vulnerability Test
# $Id: generic_WEB-INF.nasl 6760 2017-07-19 14:00:26Z cfischer $
#
# WEB-INF folder accessible
#
# Authors:
# Matt Moore <matt.moore@westpoint.ltd.uk>
# Script audit and contributions from Carmichael Security <http://www.carmichaelsecurity.com>
# Erik Anderson <eanders@carmichaelsecurity.com>
# Added BugtraqID
#
# Copyright:
# Copyright (C) 2002 Matt Moore
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.11037");
  script_version("$Revision: 6760 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-19 16:00:26 +0200 (Wed, 19 Jul 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_cve_id("CVE-2002-1855", "CVE-2002-1856", "CVE-2002-1857", "CVE-2002-1858",
                "CVE-2002-1859", "CVE-2002-1860", "CVE-2002-1861" );
  script_bugtraq_id(5119);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("WEB-INF folder accessible");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2002 Matt Moore");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  tag_summary = "This vulnerability affects the Win32 versions of multiple j2ee servlet
  containers / application servers. By making a particular request to the
  servers in question it is possible to retrieve files located under
  the 'WEB-INF' directory.";

  tag_insight = "Examples are:

  www.someserver.com/WEB-INF./web.xml

  or

  www.someserver.com/WEB-INF./classes/MyServlet.class";

  tag_solution = "Contact your vendor for the appropriate patch.";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value : tag_solution);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_analysis");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );

url = "/WEB-INF./web.xml";
req = http_get( item:url, port:port );
res = http_keepalive_send_recv( port:port, data:req );
if ( ! res ) exit( 0 );

if( "web-app" >< res && "?xml" >< res ) {
  report = report_vuln_url( port:port, url:url );
  security_message( port:port, data:report);
  exit( 0 );
}

exit( 99 );