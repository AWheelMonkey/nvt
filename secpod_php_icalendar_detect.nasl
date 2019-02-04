###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_php_icalendar_detect.nasl 9329 2018-04-05 11:36:57Z cfischer $
#
# PHP iCalendar Version Detection
#
# Authors:
# Sharath S <sharaths@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.900198");
  script_version("$Revision: 9329 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-05 13:36:57 +0200 (Thu, 05 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-01-29 15:16:47 +0100 (Thu, 29 Jan 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("PHP iCalendar Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script detects the installed version of PHP iCalendar and
  sets the version in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/phpicalendar", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  rcvRes = http_get_cache( item:dir + "/print.php", port:port );

  if( rcvRes =~ "^HTTP/1\.[01] 200" && "PHP iCalendar" >< rcvRes ) {

    version = "unknown";

    ver = eregmatch( pattern:"PHP iCalendar ([0-9.]+)", string:rcvRes );
    if( ver[1] != NULL ) version = ver[1];

    set_kb_item( name:"PHP/iCalendar/Ver", value:ver[1] );
    set_kb_item( name:"PHP/iCalendar/detected", value:TRUE );

    cpe = build_cpe( value: version, exp:"^([0-9.]+)", base:"cpe:/a:phpicalendar:phpicalendar:" );
    if( isnull( cpe ) )
      cpe = 'cpe:/a:phpicalendar:phpicalendar';

    register_product( cpe:cpe, location:install, port:port );

    log_message( data:build_detection_report( app:"PHP iCalendar",
                                              version:version,
                                              install:install,
                                              cpe:cpe,
                                              concluded:ver[0] ),
                                              port:port );
  }
}

exit( 0 );