###############################################################################
# OpenVAS Vulnerability Test
# $Id: sw_nodebb_detect.nasl 9608 2018-04-25 13:33:05Z jschulte $
#
# NodeBB Forum Version Detection
#
# Authors:
# Christian Fischer <info@schutzwerk.com>
#
# Copyright:
# Copyright (c) 2016 SCHUTZWERK GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.111100");
  script_version("$Revision: 9608 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-25 15:33:05 +0200 (Wed, 25 Apr 2018) $");
  script_tag(name:"creation_date", value:"2016-05-07 16:00:00 +0200 (Sat, 07 May 2016)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("NodeBB Forum Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 SCHUTZWERK GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"https://nodebb.org/");

  script_tag(name:"summary", value:"This script detects the installed version of NodeBB Forum
  and sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:80 );

foreach dir( make_list_unique( "/" , "/forum" , "/forums" , "/nodebb" , "/NodeBB" , "/board" , "/boards" , cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  res = http_get_cache( item: dir + "/", port:port );

  if( "Not Found</strong>" >!< res && ( "/nodebb.min.js" >< res || "require(['forum/footer']);" >< res ) ) {

    version = "unknown";

    ver = eregmatch( pattern:'version":"([0-9.]+)"', string:res );
    if( ver[1] != NULL ) version = ver[1];

    set_kb_item( name:"NodeBB/installed",value:TRUE );
    tmp_version = version + " under " + install;
    set_kb_item( name:"www/" + port + "/NodeBB", value:tmp_version );

    cpe = build_cpe( value:version, exp:"^([0-9.]+)", base:"cpe:/a:nodebb:nodebb:" );
    if( isnull( cpe ) )
      cpe = 'cpe:/a:nodebb:nodebb';

    register_product( cpe:cpe, location:install, port:port );

    log_message( data: build_detection_report( app:"NodeBB",
                                               version:version,
                                               install:install,
                                               cpe:cpe,
                                               concluded:ver[0] ),
                                               port:port );
    exit( 0 );
  }
}

exit( 0 );
