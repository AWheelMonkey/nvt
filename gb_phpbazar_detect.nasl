###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_phpbazar_detect.nasl 9608 2018-04-25 13:33:05Z jschulte $
#
# phpBazar version detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.800464");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 9608 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-25 15:33:05 +0200 (Wed, 25 Apr 2018) $");
  script_tag(name:"creation_date", value:"2010-02-17 08:26:50 +0100 (Wed, 17 Feb 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("phpBazar version detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script finds the running phpBazar version and saves
  the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:80 );

if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/", "/phpBazar", "/PHPBazar", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  rcvRes = http_get_cache(item: dir + "/index.php", port:port);

  if( rcvRes =~ "HTTP/1.. 200" && "Welcome to phpBazar!" >< rcvRes ) {

    version = "unknown";

    sndReq = http_get( item: dir + "/admin/admin.php", port:port );
    rcvRes = http_keepalive_send_recv( port:port, data:sndReq );

    if( "phpBazar-AdminPanel" >< rcvRes ) {
      ver = eregmatch( pattern:"phpBazar Ver. ([0-9.]+)", string:rcvRes );
      if( ver[1] != NULL ) {
        version = ver[1];
      }
    } else {
      sndReq = http_get(item: dir + "/classified.php", port:port );
      rcvRes = http_keepalive_send_recv( port:port, data:sndReq );

      if( ! isnull( rcvRes ) ) {
        ver = eregmatch( pattern:"phpBazar Ver. ([0-9.]+)", string:rcvRes );
        if( ver[1] != NULL ) {
          version = ver[1];
        }
      }
    }

    tmp_version = version + " under " + install;
    set_kb_item( name:"www/" + port + "/phpBazar", value:tmp_version) ;

    cpe = build_cpe( value: version, exp:"^([0-9.]+)", base:"cpe:/a:smartisoft:phpbazar:" );
    if( isnull( cpe ) )
      cpe = 'cpe:/a:smartisoft:phpbazar';

    register_product( cpe:cpe, location:install, port:port );

    log_message( data: build_detection_report( app:"phpBazar",
                                               version:version,
                                               install:install,
                                               cpe:cpe,
                                               concluded:ver[0] ),
                                               port:port );

  }
}

exit(0);