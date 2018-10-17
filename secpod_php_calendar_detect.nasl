###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_php_calendar_detect.nasl 10915 2018-08-10 15:50:57Z cfischer $
#
# PHP-Calendar Version Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.901089");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 10915 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 17:50:57 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2009-12-31 08:44:14 +0100 (Thu, 31 Dec 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("PHP-Calendar Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script detects the installed version of PHP-Calendar
  and sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:80 );

if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/", "/php-calendar", "/calendar", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  rcvRes = http_get_cache( item: dir + "/index.php", port:port );

  if( rcvRes =~ "HTTP/1.. 200" && "PHP-Calendar" >< rcvRes ) {

    version = "unknown";

    foreach file( make_list( "/NEWS", "/docs/NEWS" ) ) {

      sndReq = http_get( item: dir + file, port:port );
      rcvRes = http_keepalive_send_recv( port:port, data:sndReq );

      if( rcvRes =~ "HTTP/1.. 200" && "calendar" >< rcvRes ) {

        ver = eregmatch( pattern:"(([0-9.]+).?([a-zA-Z0-9]+)?)", string:rcvRes );
        if( ! isnull( ver[1] ) ) {
          version = ver[1];
          break;
        }
      }
    }

    version = ereg_replace( pattern:"-", replace:".", string:version );
    tmp_version = version + " under " + install;
    set_kb_item( name:"www/" + port + "/PHP-Calendar", value:tmp_version );
    set_kb_item( name:"PHP-Calendar/installed", value:TRUE );

    cpe = build_cpe( value:version, exp:"^([0-9.]+)", base:"cpe:/a:php-calendar:php-calendar:" );
    if( isnull( cpe ) )
      cpe = 'cpe:/a:php-calendar:php-calendar';

    register_product( cpe:cpe, location:install, port:port );

    log_message( data:build_detection_report( app:"PHP-Calendar",
                                              version:version,
                                              install:install,
                                              cpe:cpe,
                                              concluded:ver[0] ),
                                              port:port );
  }
}

exit( 0 );