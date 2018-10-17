###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_filemanager_detect.nasl 10913 2018-08-10 15:35:20Z cfischer $
#
# PHP File Manager Detection
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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
  script_oid("1.3.6.1.4.1.25623.1.0.106033");
  script_version("$Revision: 10913 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 17:35:20 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2015-07-29 10:33:31 +0700 (Wed, 29 Jul 2015)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("PHP File Manager Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80, 443);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"Detection of PHP File Manager

  The script sends a connection request to the server and attempts to detect PHP File Manager.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

port = get_http_port( default:80 );

if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/filemanager", "/fm", cgi_dirs( port:port ) ) ) {

  rep_dir = dir;
  if( dir == "/" ) dir = "";

  url = dir + '/index.php';
  res = http_get_cache( item:url, port:port );

  if( "php File Manager - Admin Control Panel" >< res && "gfx/logo_FileManager.gif" >< res ) {

    vers = "unknown";
    set_kb_item( name:"www/" + port + "/phpfilemanager", value:vers );
    set_kb_item( name:"phpfilemanager/installed", value:TRUE );

    cpe = 'cpe:/a:revived_wire_media:php_file_manager';

    register_product( cpe:cpe, location:rep_dir, port:port );

    log_message( data:build_detection_report( app:"PHP File Manager",
                                              version:vers,
                                              install:rep_dir,
                                              cpe:cpe ),
                                              port:port );
  }
}

exit( 0 );
