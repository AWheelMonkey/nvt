###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_phpnagios_detect.nasl 10915 2018-08-10 15:50:57Z cfischer $
#
# phpNagios Version Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
#
#This program is free software; you can redistribute it and/or modify
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
  script_oid("1.3.6.1.4.1.25623.1.0.800437");
  script_version("$Revision: 10915 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 17:50:57 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2010-01-22 09:23:45 +0100 (Fri, 22 Jan 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("phpNagios Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script finds the running phpNagios version and saves
  the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

port = get_http_port(default:80);

if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/", "/phpNagios", "/phpnagios", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  rcvRes = http_get_cache( item: dir + "/index.php", port:port );

  if( "<title>phpNagios</title>" >< rcvRes || "<td>Nagios Version" >< rcvRes ) {

    version = "unknown";

    ver = eregmatch(pattern:"Nagios Version : ([0-9.]+)",string:rcvRes);
    if( ! isnull(ver[1] ) ) extra = "Supported Nagios Version: " + ver[1];

    tmp_version = version + " under " + install;
    set_kb_item(name:"www/" + port + "/phpNagios", value:tmp_version);

    cpe = 'cpe:/a:phpnagios:phpnagios';

    register_product( cpe:cpe, location:install, port:port );

    log_message( data: build_detection_report( app:"phpNagios",
                                               version:version,
                                               install:install,
                                               cpe:cpe,
                                               extra:extra ),
                                               port:port );
  }
}

exit( 0 );

