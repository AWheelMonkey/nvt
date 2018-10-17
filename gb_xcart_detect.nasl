###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_xcart_detect.nasl 11015 2018-08-17 06:31:19Z cfischer $
#
# X_CART Shopping Cart Version Detection
#
# Authors:
# Rinu Kuriaksoe <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806067");
  script_version("$Revision: 11015 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 08:31:19 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2015-10-05 11:33:14 +0530 (Mon, 05 Oct 2015)");
  script_name("X_CART Shopping Cart Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"Detects the installed version of
  X_CART Shopping Cart.

  This script sends HTTP GET request and try to get the version from the
  response, and sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("cpe.inc");
include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );

if( ! can_host_php( port:port ) ) exit(0);

foreach dir( make_list_unique("/", "/xcart", "/xcart_ecommerce", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  sndReq = http_get( item: dir + "/cart.php", port:port);
  rcvRes = http_keepalive_send_recv( port:port, data:sndReq);

  if( rcvRes =~ "HTTP/1.. 200" && rcvRes =~ "content.*X-Cart" && rcvRes =~ "class.*Powered by X-Cart" ) {

    version = "unknown";

    set_kb_item( name:"www/" + port + "/X_CART", value:version );
    set_kb_item( name:"X_CART/Installed", value:TRUE );

    cpe = build_cpe( value:version, exp:"^([0-9.]+)", base:"cpe:/a:qualiteam:x-cart:" );
    if( ! cpe )
      cpe = "cpe:/a:qualiteam:x-cart";

    register_product( cpe:cpe, location:install, port:port );

    log_message( data:build_detection_report( app:"X_CART",
                                              version:version,
                                              install:install,
                                              cpe:cpe ),
                                              port:port );
  }
}

exit( 0 );