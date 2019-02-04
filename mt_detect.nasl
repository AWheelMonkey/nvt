###############################################################################
# OpenVAS Vulnerability Test
# $Id: mt_detect.nasl 12861 2018-12-21 09:53:04Z ckuersteiner $
#
# Movable Type Detection
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.100429");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 12861 $");
  script_tag(name:"last_modification", value:"$Date: 2018-12-21 10:53:04 +0100 (Fri, 21 Dec 2018) $");
  script_tag(name:"creation_date", value:"2010-01-06 18:07:55 +0100 (Wed, 06 Jan 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Movable Type Detection");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_tag(name:"summary", value:"Detection of Movable Type.

The script sends a connection request to the server and attempts to
extract the version number from the reply.");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port(default:80);

foreach dir( make_list_unique( "/mt", "/cgi-bin/mt", cgi_dirs( port:port ) ) ) {

 install = dir;
 if( dir == "/" ) dir = "";

 url = dir + "/mt.cgi";
 buf = http_get_cache(item:url, port:port);

 if((egrep(pattern: "<title>Movable Type", string: buf, icase: TRUE) && "Six Apart" >< buf) ||
    "<title>Sign in | Movable Type" >< buf || 'alt="Movable Type"' >< buf) {
    vers = "unknown";
    version = eregmatch(string: buf, pattern: "Version ([0-9.]+)",icase:TRUE);
    if(isnull(version[1]))
      version = eregmatch(pattern:"mt.js\?v=([0-9.]+)", string:buf);

    if (!isnull(version[1]) )
      vers = version[1];

    set_kb_item(name:"movabletype/detected", value:TRUE);

    cpe = build_cpe(value:vers, exp:"^([0-9.]+)", base:"cpe:/a:sixapart:movable_type:");
    if(!cpe)
      cpe = 'cpe:/a:sixapart:movable_type';

    register_product(cpe:cpe, location:install, port:port);

    log_message(data: build_detection_report(app:"Movable Type", version:vers, install:install, cpe:cpe,
                                             concluded: version[0]),
                port:port);
  }
}

exit(0);
