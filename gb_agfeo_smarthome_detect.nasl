###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_agfeo_smarthome_detect.nasl 10913 2018-08-10 15:35:20Z cfischer $
#
# AGFEO SmartHome Detection
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
  script_oid("1.3.6.1.4.1.25623.1.0.106964");
  script_version("$Revision: 10913 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 17:35:20 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-07-18 14:42:43 +0700 (Tue, 18 Jul 2017)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("AGFEO SmartHome Detection");

  script_tag(name:"summary", value:"Detection of AGFEO SmartHome.

The script sends a connection request to the server and attempts to detect AGFEO SmartHome and to extract its
version.");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"https://www.agfeo.de");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 80);

res = http_get_cache(port: port, item: "/tkset/login.html");

if (">SmartHomeServer<" >< res && 'id="companylinkanchor"' >< res) {
  version = "unknown";

  req = http_post(port: port, item: "/tkset/systemstatus", data: "");
  res = http_keepalive_send_recv(port: port, data: req);

  mod = eregmatch(pattern: '"pbxtype":( )?"([^"]+)', string: res);
  if (!isnull(mod[2])) {
    model = mod[2];
    set_kb_item(name: "agfeo_smarthome/model", value: model);
  }

  url = '/pbxapi/update.php/v01/firmware/info';
  req = http_get(port: port, item: url);
  res = http_keepalive_send_recv(port: port, data: req);

  vers = eregmatch(pattern: '"VERSION":"([0-9a-z.]+)"', string: res);
  if (!isnull(vers[1])) {
    version = vers[1];
    set_kb_item(name: "agfeo_smarthome/version", value: version);
    conclUrl = url;
  }
  else {
    url = '/update/api/update.php/v01/firmware/info';
    req = http_get(port: port, item: url);
    res = http_keepalive_send_recv(port: port, data: req);

    vers = eregmatch(pattern: '"VERSION":"([0-9a-z.]+)"', string: res);
      if (!isnull(vers[1])) {
      version = vers[1];
      set_kb_item(name: "agfeo_smarthome/version", value: version);
      conclUrl = url;
    }
  }

  set_kb_item(name: "agfeo_smarthome/detected", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9a-z.]+)", base: "cpe:/a:agfeo:smarthome:");
  if (!cpe)
    cpe = 'cpe:/a:agfeo:smarthome';

  register_product(cpe: cpe, location: "/", port: port);

  log_message(data: build_detection_report(app: "AGFEO SmartHome " + model, version: version, install: "/",
                                           cpe: cpe, concluded: vers[0], concludedUrl: conclUrl),
              port: port);
  exit(0);
}

exit(0);
