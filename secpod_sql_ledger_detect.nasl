##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_sql_ledger_detect.nasl 10890 2018-08-10 12:30:06Z cfischer $
#
# SQL-Ledger Version Detection
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
################################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902009");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 10890 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 14:30:06 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2009-12-31 08:44:14 +0100 (Thu, 31 Dec 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("SQL-Ledger Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Product detection");
  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script detects the installed SQL-Ledger version and
  sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port(default:80);

foreach dir( make_list_unique( "/sql-ledger", "/ledger", "/", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  rcvRes = http_get_cache( item: dir + "/login.pl", port:port );

  if( rcvRes =~ "HTTP/1.. 200" && ( "<title>SQL-Ledger" >< rcvRes || "images/sql-ledger.gif" >< rcvRes ) ) {

    version = "unknown";

    ver = eregmatch( pattern:">Version ([0-9.]+)", string:rcvRes );

    if( isnull( ver[1] ) ) {
      sndReq = http_get( item: dir + "/VERSION", port:port );
      rcvRes = http_keepalive_send_recv( port:port, data:sndReq );
      ver = eregmatch( pattern:"([0-9.]+)", string:rcvRes );
      if( ! isnull( ver[1] ) ) version = ver[1];
    } else {
      version = ver[1];
    }

    tmp_version = version + " under " + install;
    set_kb_item( name:"www/"+ port + "/SQL-Ledger", value:tmp_version );

    cpe = build_cpe( value:version, exp:"^([0-9.]+)", base:"cpe:/a:sql-ledger:sql-ledger:" );
    if( isnull( cpe ) )
      cpe = 'cpe:/a:sql-ledger:sql-ledger';

    register_product( cpe:cpe, location:install, port:port );

    log_message( data:build_detection_report( app:"SQL-Ledger",
                                              version:version,
                                              install:install,
                                              cpe:cpe,
                                              concluded:ver[0] ),
                                              port:port );
  }
}

exit( 0 );