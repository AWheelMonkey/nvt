###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openpro_detect.nasl 10911 2018-08-10 15:16:34Z cfischer $
#
# OpenPro Version Detection
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.800928");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 10911 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 17:16:34 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2009-09-07 19:45:38 +0200 (Mon, 07 Sep 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("OpenPro Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script detects the installed version of OpenPro and
  sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:80 );

if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/", "/openpro", "/forum", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  rcvRes = http_get_cache( item: dir + "/login.php", port:port );

  if( rcvRes =~ "HTTP/1.. 200" && "OpenPro" >< rcvRes && "openpro.sourceforge.net" >< rcvRes) {

    version = "unknown";

    sndReq = http_get( item: dir + "/version", port:port );
    rcvRes = http_keepalive_send_recv( port:port, data:sndReq );

    ver = eregmatch( pattern:"Content-Type:.*([0-9]\.[0-9]\.?[0-9]+)", string:rcvRes );
    if( ver[1] != NULL ) version = ver[1];

    tmp_version = version + " under " + install;
    set_kb_item( name:"www/" + port + "/OpenPro", value:tmp_version );

    cpe = build_cpe( value: version, exp:"^([0-9.]+)", base:"cpe:/a:openpro:openpro:" );
    if( isnull( cpe ) )
      cpe = 'cpe:/a:openpro:openpro';

    register_product( cpe:cpe, location:install, port:port );

    log_message( data: build_detection_report( app:"OpenPro",
                                               version:version,
                                               install:install,
                                               cpe:cpe,
                                               concluded:ver[0] ),
                                               port:port );

  }
}

exit( 0 );
