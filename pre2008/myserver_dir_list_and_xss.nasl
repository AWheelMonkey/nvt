###############################################################################
# OpenVAS Vulnerability Test
# $Id: myserver_dir_list_and_xss.nasl 10862 2018-08-09 14:51:58Z cfischer $
#
# myServer Directory Listing and XSS flaws
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
#
# Copyright:
# Copyright (C) 2005 David Maciejak
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

#  Ref: Dr_insane

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.18218");
  script_version("$Revision: 10862 $");
  script_cve_id("CVE-2005-1658", "CVE-2005-1659");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-09 16:51:58 +0200 (Thu, 09 Aug 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_bugtraq_id(13579, 13578);
  script_name("myServer Directory Listing and XSS flaws");
  script_category(ACT_ATTACK);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2005 David Maciejak");
  script_dependencies("find_service.nasl", "http_version.nasl", "cross_site_scripting.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"solution", value:"Upgrade to version 0.8.1 when available");
  script_tag(name:"summary", value:"The remote host is running myServer, an open-source http server.
  This version is vulnerable to a directory listing flaw and XSS.

  An attacker can execute a cross site scripting attack,
  or gain knowledge of certain system information of the
  server.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod", value:"50"); # No extra check, prone to false positives and doesn't match existing qod_types

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );

host = http_host_name( dont_add_port:TRUE );
if( get_http_has_generic_xss( port:port, host:host ) ) exit( 0 );

foreach dir( make_list_unique( "/", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = dir + "/";

  buf = http_get_cache( item:url, port:port );

  if( "<title>MyServer</title>" >< buf ) {

    url = string( dir, '/.../.../"onmouseover="<script>foo</script>"' );

    if( http_vuln_check( port:port, url:url, pattern:"<script>foo</script>", check_header:TRUE ) ) {
      report = report_vuln_url( port:port, url:url );
      security_message( port:port, data:report );
      exit( 0 );
    }
  }
}

exit( 99 );
