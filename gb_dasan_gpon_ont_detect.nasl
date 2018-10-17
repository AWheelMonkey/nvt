###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dasan_gpon_ont_detect.nasl 10915 2018-08-10 15:50:57Z cfischer $
#
# Dasan Networks GPON ONT Devices Detection
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.106951");
  script_version("$Revision: 10915 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 17:50:57 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-07-14 09:53:13 +0700 (Fri, 14 Jul 2017)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("Dasan Networks GPON ONT Devices Detection");

  script_tag(name:"summary", value:"Detection of Dasan Networks GPON ONT devices.

The script sends a connection request to the server and attempts to detect Dasan Networks GPON ONT devices.");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 8080);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://www.dasannetworks.com");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 8080);

res = http_get_cache(port: port, item: "/cgi-bin/login.cgi");

if ("<title>GPON ONT</title>" >< res && "dasan_logo.png" >< res && '"WebTitle", "GPON ONT"' >< res) {
  version = "unknown";

  set_kb_item(name: "dasan_gpon_ont/detected", value: TRUE);

  cpe = 'cpe:/a:dansan_networks:gpon_ont';

  register_product(cpe: cpe, location: "/", port: port);

  log_message(data: build_detection_report(app: "Dasan Networks GPON ONT", version: version, install: "/",
                                           cpe: cpe),
              port: port);
  exit(0);
}

exit(0);
