###############################################################################
# OpenVAS Vulnerability Test
# $Id: sw_icingaweb_detect.nasl 10913 2018-08-10 15:35:20Z cfischer $
#
# Icinga Web Detection
#
# Authors:
# Christian Fischer <info@schutzwerk.com>
#
# Copyright:
# Copyright (c) 2015 SCHUTZWERK GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.111056");
  script_version("$Revision: 10913 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 17:35:20 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2015-11-22 13:00:00 +0100 (Sun, 22 Nov 2015)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_name("Icinga Web Detection");

  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2015 SCHUTZWERK GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"The script sends a HTTP request
  to the server and attempts to extract the version from the reply.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");
include("cpe.inc");

port = get_http_port( default:80 );

if( !can_host_php( port:port ) ) exit( 0 );

foreach dir ( make_list_unique( "/", "/icinga", "/icinga-web", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  buf = http_get_cache( item: dir + "/index.php", port:port );

  if( eregmatch( pattern:'<title>Icinga</title>', string:buf, icase:TRUE ) ||
      "Icinga Developer Team" >< buf || "Welcome to icinga-web" >< buf ) {

    version = 'unknown';

    ver = eregmatch( pattern:"icinga-web/v([0-9.]+)", string:buf, icase:TRUE );

    if( ! isnull( ver[1] ) ) version = ver[1];

    #CPE not registered/available yet
    cpe = build_cpe( value:version, exp:"^([0-9.]+)", base:"cpe:/a:icinga:icingaweb:");
    if( isnull( cpe ) )
      cpe = 'cpe:/a:icinga:icingaweb';

    set_kb_item( name:"www/" + port + "/icingaweb", value:version );
    set_kb_item( name:"icingaweb/installed", value:TRUE );

    register_product( cpe:cpe, location:install, port:port );

    log_message( data: build_detection_report( app:"Icinga Web",
                                               version:version,
                                               concluded:ver[0],
                                               install:install,
                                               cpe:cpe),
                                               port:port);
  }
}

exit(0);
