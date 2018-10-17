###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_fcms_detect.nasl 11823 2018-10-10 13:57:02Z asteins $
#
# Haudenschilt Family Connections CMS (FCMS) Version Detection
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902309");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 11823 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-10 15:57:02 +0200 (Wed, 10 Oct 2018) $");
  script_tag(name:"creation_date", value:"2010-09-23 08:13:58 +0200 (Thu, 23 Sep 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Haudenschilt Family Connections CMS (FCMS) Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script detects the installed version of Haudenschilt Family
  Connections CMS (FCMS) and sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:80 );

if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/fcms", "/FCMS", "/", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  rcvRes = http_get_cache( item: dir + "/index.php", port:port );

  if( rcvRes =~ "HTTP/1.. 200" && "- powered by Family Connections" >< rcvRes ) {

    set_kb_item(name:"fcms/detected", value:TRUE);

    version = "unknown";

    ver = eregmatch( pattern:"Family Connections ([0-9.]+)", string:rcvRes );
    if( ver[1] != NULL ) version = ver[1];

    cpe = build_cpe( value: version, exp:"^([0-9.]+)", base:"cpe:/a:haudenschilt:family_connections_cms:" );
    if( isnull( cpe ) )
      cpe = 'cpe:/a:haudenschilt:family_connections_cms';

    register_product( cpe:cpe, location:install, port:port );

    log_message( data: build_detection_report( app:"Family Connections",
                                               version:version,
                                               install:install,
                                               cpe:cpe,
                                               concluded:ver[0] ),
                                               port:port );
  }
}

exit( 0 );
