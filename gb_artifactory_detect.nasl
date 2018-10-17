###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_artifactory_detect.nasl 11885 2018-10-12 13:47:20Z cfischer $
#
# Artifactory Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103918");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"qod_type", value:"remote_banner");
  script_version("$Revision: 11885 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 15:47:20 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-03-13 10:13:17 +0100 (Thu, 13 Mar 2014)");
  script_name("Artifactory Detection");

  script_tag(name:"summary", value:"The script sends a connection request to the server and attempts
 to extract the version number from the reply.");

  script_category(ACT_GATHER_INFO);
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:80 );

foreach dir( make_list_unique( "/artifactory", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";
  url = dir + "/webapp/home.html?0";
  req = http_get( item:url, port:port );
  buf = http_keepalive_send_recv( port:port, data:req );
  if( buf == NULL ) continue;

  if( "Artifactory is happily serving" >< buf && "<title>Artifactory" >< buf)
  {

    vers = "unknown";
    version = eregmatch( string: buf, pattern: '<span class="version">Artifactory ([0-9.]+)',icase:TRUE );

    if ( ! isnull( version[1] ) ) vers = chomp( version[1] );

    set_kb_item(name: string( "www/", port, "/artifactory" ), value: string( vers," under ",install + '/webapp') );
    set_kb_item(name:"artifactory/installed",value:TRUE);

    cpe = build_cpe( value:vers, exp:"^([0-9.]+)", base:"cpe:/a:jfrog:artifactory:" );
    if( isnull( cpe ) ) cpe = "cpe:/a:jfrog:artifactory";

    register_product( cpe:cpe, location:install + "/webapp/", port:port );

    log_message( data: build_detection_report( app:"Artifactory",
                                               version:vers,
                                               install:install + "/webapp/",
                                               cpe:cpe,
                                               concluded: version[0] ),
                 port:port );
  }
}

exit(0);
