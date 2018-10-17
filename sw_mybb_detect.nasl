###############################################################################
# OpenVAS Vulnerability Test
# $Id: sw_mybb_detect.nasl 10899 2018-08-10 13:49:35Z cfischer $
#
# MyBB Forum Version Detection
#
# Authors:
# Christian Fischer <info@schutzwerk.com>
#
# Copyright:
# Copyright (c) 2015 SCHUTZWERK GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.111023");
  script_version("$Revision: 10899 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 15:49:35 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2015-07-20 13:14:40 +0200 (Mon, 20 Jul 2015)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_name("MyBB Forum Version Detection");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 SCHUTZWERK GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script detects the installed version of MyBB Forum
  and sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port(default:80);

if(!can_host_php(port:port)) exit(0);

foreach dir( make_list_unique( "/" , "/forum" , "/forums" , "/mybb" , "/MyBB" , "/board" , "/boards" , cgi_dirs(port:port) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  rcvRes = http_get_cache( item: dir + "/index.php", port:port );

  if( ">MyBB" >< rcvRes && ">MyBB Group<" >< rcvRes ) {

    mybbVer = "unknown";

    version = eregmatch( pattern:">MyBB ([0-9.]+).?<", string:rcvRes);
    if( version[1] != NULL ) {
      mybbVer = version[1];
    } else {
      version = eregmatch(pattern: "general.js\?ver=([0-9]+)", string: rcvRes);
      if (!isnull(version[1])) {
        ver = version[1];
        # we get e.g. 1803 for 1.8.3 so strip the 0
        if (strlen(ver) > 3 && ver[2] == 0)
          i = 3;
        else
          i = 2;
        mybbVer = ver[0] + '.' + ver[1] + '.' + substr(ver, i);
      }
    }

    set_kb_item(name:"MyBB/installed",value:TRUE);
    tmp_version = mybbVer + " under " + install;
    set_kb_item( name:"www/" + port + "/MyBB", value:tmp_version );

    cpe = build_cpe( value:mybbVer, exp:"^([0-9.]+)", base:"cpe:/a:mybb:mybb:" );
    if( isnull( cpe ) )
      cpe = 'cpe:/a:mybb:mybb';

    register_product( cpe:cpe, location:install, port:port );

    log_message( data: build_detection_report( app:"MyBB",
                                               version:mybbVer,
                                               install:install,
                                               cpe:cpe,
                                               concluded:version[0] ),
                                               port:port );
  }
}

exit( 0 );
