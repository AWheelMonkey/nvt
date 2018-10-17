###############################################################################
# OpenVAS Vulnerability Test
# $Id: net2ftp_detect.nasl 10765 2018-08-03 14:31:52Z cfischer $
#
# net2ftp Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100125");
  script_version("$Revision: 10765 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-03 16:31:52 +0200 (Fri, 03 Aug 2018) $");
  script_tag(name:"creation_date", value:"2009-04-12 20:09:50 +0200 (Sun, 12 Apr 2009)");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("net2ftp Detection");
  script_category(ACT_GATHER_INFO);
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://www.net2ftp.com");

  script_tag(name:"summary", value:"This host is running net2ftp, a web based FTP client.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/ftp", "/webftp", "/net2ftp", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";
  buf = http_get_cache( item:dir + "/index.php", port:port );
  buf2 = http_get_cache( item:dir + "/help.html", port:port );

  if( egrep( pattern:'Powered by net2ftp', string:buf, icase:TRUE ) ||
      egrep( pattern:'<title>net2ftp - a web based FTP client</title>', string:buf, icase:TRUE ) ||
      "<title>net2ftp help</title>" >< buf2 ) {

    vers = "unknown";

    version = eregmatch( string:buf, pattern:"<!-- net2ftp version ([0-9.]+) -->", icase:TRUE );

    if( ! isnull( version[1] ) ) {
      vers = chomp( version[1] );
    } else {
       res = http_get_cache( item:dir + "/version.js", port:port );
       version = eregmatch( string:res, pattern:"latest_stable_version = '([0-9.]+)';", icase:TRUE );
       if( ! isnull( version[1] ) ) vers = version[1];
    }

    tmp_version = vers + " under " + install;
    set_kb_item( name:"www/" + port + "/net2ftp", value:tmp_version );

    cpe = build_cpe( value:tmp_version, exp:"^([0-9.]+)", base:"cpe:/a:net2ftp:net2ftp:" );
    if( isnull( cpe ) )
      cpe = "cpe:/a:net2ftp:net2ftp";

    register_product( cpe:cpe, location:install, port:port );

    log_message( data:build_detection_report( app:"net2ftp",
                                              version:vers,
                                              install:install,
                                              cpe:cpe,
                                              concluded:version[0] ),
                                              port:port );
  }
}

exit( 0 );
