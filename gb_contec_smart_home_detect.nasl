###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_contec_smart_home_detect.nasl 10911 2018-08-10 15:16:34Z cfischer $
#
# Contec Smart Home Detection
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.140936");
  script_version("$Revision: 10911 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 17:16:34 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-04-03 14:04:04 +0700 (Tue, 03 Apr 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("Contec Smart Home Detection");

  script_tag(name:"summary", value:"Detection of Contec Smart Home.

The script sends a connection request to the server and attempts to detect Contec Smart Home and to extract its
version.");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 9000);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://www.contec-touch.com/");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 9000);

res = http_get_cache(port: port, item: "/content/smarthome.php");

if ("contec.camera.js" >< res && "The room content was changed" >< res) {
  version = "unknown";

  vers = eregmatch(pattern: ">Version ([0-9.]+)<", string: res);
  if (!isnull(vers[1]))
    version = vers[1];

  set_kb_item(name: "contec_smart_home/detected", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:contec:smart_home:");
  if (!cpe)
    cpe = 'cpe:/a:contec:smart_home';

  register_product(cpe: cpe, location: "/", port: port);

  log_message(data: build_detection_report(app: "Contec Smart Home", version: version, install: "/", cpe: cpe,
                                                concluded: vers[0]),
                   port: port);
  exit(0);
}

exit(0);
