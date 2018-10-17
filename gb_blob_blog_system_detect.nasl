###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_blob_blog_system_detect.nasl 10913 2018-08-10 15:35:20Z cfischer $
#
# BLOB Blog System Version Detection
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
  script_oid("1.3.6.1.4.1.25623.1.0.800955");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 10913 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 17:35:20 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2009-10-20 14:26:56 +0200 (Tue, 20 Oct 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("BLOB Blog System Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script detects the installed version of BLOB Blog System
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

foreach dir( make_list_unique("/", "/blob", "/blog", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  sndReq = http_get( item: dir + "/blob.php", port:port );
  rcvRes = http_keepalive_send_recv( port:port, data:sndReq );

  if( rcvRes =~ "HTTP/1.. 200" && "The BLOB Blog System" >< rcvRes ) {

    version = "unknown";

    ver = eregmatch( pattern:"Version ([0-9.]+)", string:rcvRes );
    if( ! isnull( ver[1] ) ) version = ver[1];

    tmp_version = version + " under " + install;
    set_kb_item( name:"www/" + port + "/BLOB-Blog-System", value:tmp_version );

    cpe = build_cpe( value:version, exp:"^([0-9.]+)", base:"cpe:/a:blob:blog_system:" );
    if( isnull( cpe ) )
      cpe = 'cpe:/a:blob:blog_system';

    register_product( cpe:cpe, location:install, port:port );

    log_message( data:build_detection_report( app:"BLOB Blog System",
                                              version:version,
                                              install:install,
                                              cpe:cpe,
                                              concluded:ver[0] ),
                                              port:port );
  }
}

exit( 0 );