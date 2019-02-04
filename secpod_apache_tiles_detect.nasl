###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_apache_tiles_detect.nasl 10915 2018-08-10 15:50:57Z cfischer $
#
# Apache Tiles Version Detection
#
# Authors:
# Sujit Ghosal <sghosal@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.900493");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 10915 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 17:50:57 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2009-04-28 07:58:48 +0200 (Tue, 28 Apr 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Apache Tiles Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Product detection");
  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 80, 8080);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script detects the installed version of Apache Tiles and sets
  the version in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:8080 );

foreach dir( make_list_unique( "/", "/tiles", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  sndReq = http_get( item: dir + "/apidocs/index.html", port:port );
  rcvRes = http_keepalive_send_recv( port:port, data:sndReq );

  if( rcvRes =~ "HTTP/1.. 200" && ( "packageFrame" >< rcvRes || "classFrame" >< rcvRes ) ) {

    sndReq = http_get( item: dir + "/apidocs/org/apache/tiles/Definition.html", port:port );
    rcvRes = http_keepalive_send_recv( port:port, data:sndReq );

    if( rcvRes !~ "HTTP/1.. 200" ) {
      sndReq = http_get(item: dir + "/apidocs/org/apache/tiles/definition/digester" +
                                    "/DigesterDefinitionsReader.FillDefinitionRule.html", port:port );
      rcvRes = http_keepalive_send_recv( port:port, data:sndReq );
    }

    if( rcvRes =~ "HTTP/1.. 200" ) {

      version = "unknown";

      ver = eregmatch(pattern:">([0-9]\.[0-9]\.[0-9.]+)", string:rcvRes);
      if( ver[1] != NULL ) version = ver[1];

      tmp_version = version + " under " + install;
      set_kb_item( name:"www/" + port + "/Apache/Tiles", value:tmp_version );

      cpe = build_cpe( value: version, exp:"^([0-9.]+)", base:"cpe:/a:apache:tiles:" );
      if( isnull( cpe ) )
        cpe = 'cpe:/a:apache:tiles';

      register_product( cpe:cpe, location:install, port:port );

      log_message( data: build_detection_report( app:"Apache Tiles",
                                                 version:version,
                                                 install:install,
                                                 cpe:cpe,
                                                 concluded:ver[0] ),
                                                 port:port );
    }
  }
}

exit( 0 );