###############################################################################
# OpenVAS Vulnerability Test
# $Id: zeroboard_flaws.nasl 10862 2018-08-09 14:51:58Z cfischer $
#
# Zeroboard flaws
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
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

# Ref: Jeremy Bae

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.16059");
  script_version("$Revision: 10862 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-09 16:51:58 +0200 (Thu, 09 Aug 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_cve_id("CVE-2004-1419");
  script_bugtraq_id(12103);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("Zeroboard flaws");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("This script is Copyright (C) 2004 David Maciejak");
  script_family("Web application abuses");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_dependencies("find_service.nasl", "http_version.nasl", "cross_site_scripting.nasl");
  script_tag(name:"solution", value:"Upgrade to Zeroboard 4.1pl5 or later.");
  script_tag(name:"summary", value:"The remote web server contains several PHP scripts that are prone to
arbitrary PHP code execution and cross-site scripting attacks.

Description :

The remote host runs Zeroboard, a web BBS application popular in
Korea.

The remote version of this software is vulnerable to cross-site
scripting and remote script injection due to a lack of sanitization of
user-supplied data.

Successful exploitation of this issue may allow an attacker to execute
arbitrary code on the remote host or to use it to perform an attack
against third-party users.");
  script_xref(name:"URL", value:"http://marc.theaimsgroup.com/?l=bugtraq&m=110391024404947&w=2");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if ( ! can_host_php(port:port) ) exit(0);

host = http_host_name( dont_add_port:TRUE );
if( get_http_has_generic_xss( port:port, host:host ) ) exit( 0 );

foreach dir( make_list_unique( "/bbs", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = string(dir, "/check_user_id.php?user_id=<script>foo</script>");

  req = http_get(item:url, port:port);
  r = http_keepalive_send_recv(port:port, data:req);
  if( isnull( r ) ) continue;

  if(r =~ "^HTTP/1\.[01] 200" && "ZEROBOARD.COM" >< r && "<script>foo</script>" >< r) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );