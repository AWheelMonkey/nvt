###############################################################################
# OpenVAS Vulnerability Test
# $Id: linksys_ap_default_password.nasl 6277 2017-06-04 15:34:49Z cfischer $
#
# Default password (admin) for Linksys Router
#
# Authors:
# Renaud Deraison
#
# Copyright:
# Copyright (C) 2003 Renaud Deraison
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
  script_oid("1.3.6.1.4.1.25623.1.0.80070");
  script_version("$Revision: 6277 $");
  script_tag(name:"last_modification", value:"$Date: 2017-06-04 17:34:49 +0200 (Sun, 04 Jun 2017) $");
  script_tag(name:"creation_date", value:"2008-10-24 23:33:44 +0200 (Fri, 24 Oct 2008)");
  script_xref(name:"OSVDB", value:"821");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Default password (admin) for Linksys Router");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2003 Renaud Deraison");
  script_family("Default Accounts");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"solution", value:"Connect to this port with a web browser, and click on the 'Password'
  section to set a strong password");

  script_tag(name:"summary", value:"The remote Linksys device has its default password (no username / 'admin') set.");

  script_tag(name:"impact", value:"An attacker may connect to it and reconfigure it using this account.");

  script_tag(name:"solution_type", value:"Workaround");
  script_tag(name:"qod_type", value:"remote_vul");

 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );

res = http_get_cache( item:"/", port:port );
if( isnull( res ) ) exit( 0 );
if( res !~ "^HTTP/1\.[0-1] 401" ) exit( 0 );

req = http_get( item:"/", port:port );
req -= string("\r\n\r\n");
req += string("\r\nAuthorization: Basic OmFkbWlu\r\n\r\n");
res = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );
if( isnull (res ) ) exit( 0 );

if( res =~ "^HTTP/1\.[0-1] 200" ) {
  security_message( port:port );
  exit( 0 );
}

exit( 99 );