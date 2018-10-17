###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vpet_engine_detect.nasl 10896 2018-08-10 13:24:05Z cfischer $
#
# VPet Engine Version Detection
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.808173");
  script_version("$Revision: 10896 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 15:24:05 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2016-06-27 12:38:20 +0530 (Mon, 27 Jun 2016)");
  script_name("VPet Engine Version Detection");

  script_tag(name:"summary", value:"Detects the installed version of VPet Engine.

  This script sends HTTP GET request and try to get the version from the
  response.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  exit(0);
}

include("cpe.inc");
include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

vpet_Port = get_http_port(default:80);
if(!can_host_php(port:vpet_Port)) exit(0);

foreach dir(make_list_unique("/", "/vpet", "/vPetEngine", cgi_dirs(port:vpet_Port))) {

  install = dir;
  if(dir == "/") dir = "";

  rcvRes = http_get_cache(item: dir + "/index.php", port:vpet_Port);

  if(rcvRes =~ "HTTP/1.. 200 OK" && '<TITLE>vPetOnline - Home</TITLE>' >< rcvRes &&
     '>Login<' >< rcvRes)
  {
    ver = eregmatch(pattern:'vPet Engine V.([0-9.]+)<', string:rcvRes);
    if(ver[1]){
      version = ver[1];
    } else {
      version = "Unknown";
    }

    set_kb_item(name:"www/" + vpet_Port + install, value:version);
    set_kb_item(name:"vPet/Engine/Installed", value:TRUE);

    cpe = build_cpe(value: version, exp:"([0-9.]+)", base:"cpe:/a:vpet:vpet_engine:");
    if(!cpe)
   	cpe = "cpe:/a:vpet:vpet_engine";

    register_product(cpe:cpe, location:install, port:vpet_Port);

    log_message( data:build_detection_report( app:"vPet Engine",
                                              version:version,
                                              install:install,
                                              cpe:cpe,
                                              concluded:version),
                                              port:vpet_Port);
  }
}
exit(0);
