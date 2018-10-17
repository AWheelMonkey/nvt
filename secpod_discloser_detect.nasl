###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_discloser_detect.nasl 10891 2018-08-10 12:51:28Z cfischer $
#
# Discloser Version Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902137");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 10891 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 14:51:28 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2010-03-23 15:59:14 +0100 (Tue, 23 Mar 2010)");
  script_name("Discloser Version Detection");
  script_tag(name:"cvss_base", value:"0.0");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 SecPod");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script finds the running Discloser and saves the
  result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:80 );

if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/discloser", "/", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  rcvRes = http_get_cache( item: dir + "/login.php", port:port );

  if( rcvRes =~ "HTTP/1.. 200" && "discloser admin" >< rcvRes ) {

    version = "unknown";

    sndReq = http_get(item:dir + "/CHANGELOG", port:port );
    rcvRes = http_keepalive_send_recv( port:port, data:sndReq );

    ver = eregmatch(pattern:"Version (([0-9.]+).?([a-zA-Z0-9]+)?)", string:rcvRes);
    if( isnull( ver[1] ) ) {

      sndReq = http_get(item: dir + "/docs/CHANGELOG", port:port );
      rcvRes = http_keepalive_send_recv( port:port, data:sndReq );

      ver = eregmatch( pattern:"Version (([0-9.]+).?([a-zA-z0-9]+)?)", string:rcvRes );
      if( ! isnull( ver ) ) {
        version = ver[1];
      }
    } else {
      version = ver[1];
    }

    version = ereg_replace( pattern:"-", string:version, replace:"." );
    tmp_version = version + " under " + install;
    set_kb_item( name:"www/" + port + "/Discloser", value:tmp_version );

    cpe = build_cpe( value: version, exp:"^([0-9.]+)", base:"cpe:/a:bob_jewell:discloser:" );
    if( isnull( cpe ) )
      cpe = 'cpe:/a:bob_jewell:discloser';

    register_product( cpe:cpe, location:install, port:port );

    log_message( data: build_detection_report( app:"Discloser",
                                               version:version,
                                               install:install,
                                               cpe:cpe,
                                               concluded:ver[0] ),
                                               port:port );

  }
}
