###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_abb_ipgateway_detect.nasl 10896 2018-08-10 13:24:05Z cfischer $
#
# ABB Welcome IP-Gateway Detection
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
  script_oid("1.3.6.1.4.1.25623.1.0.141147");
  script_version("$Revision: 10896 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 15:24:05 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-06-06 13:57:48 +0700 (Wed, 06 Jun 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("ABB Welcome IP-Gateway Detection");

  script_tag(name:"summary", value:"Detection of ABB Welcome IP-Gateway.

The script sends a connection request to the server and attempts to detect ABB Welcome IP-Gateway and to extract
its firmware version.");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 8081);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"https://www.busch-jaeger.de");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 8081);

res = http_get_cache(port: port, item: "/");

if ("cgi-bin/getinfo.cgi" >< res && "For IP Gateway" >< res) {
  version = "unknown";

  url = '/cgi-bin/getinfo.cgi?type=getversion';

  req = http_post(port: port, item: url);
  res = http_keepalive_send_recv(port: port, data: req);

  # UPNP_V3.02_20121224_MP;ASM04_GW_V3.13_20150514_MP_TIDM365;Board_V2.04_20141216
  vers = eregmatch(pattern: "GW_V([0-9.]+)_[^;]+", string: res);
  if (!isnull(vers[1])) {
    version = vers[1];
    concUrl = url;
  }

  set_kb_item(name: "abb_ipgateway/detected", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/h:abb:ip_gateway_firmware:");
  if (!cpe)
    cpe = 'cpe:/h:abb:ip_gateway_firmware';

  register_product(cpe: cpe, location: "/", port: port);

  log_message(data: build_detection_report(app: "ABB Welcome IP-Gateway", version: version, install: "/", cpe: cpe,
                                           concluded: vers[0], concludedUrl: concUrl),
              port: port);
  exit(0);
}

exit(0);
