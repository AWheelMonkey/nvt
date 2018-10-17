###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_foreman_detect.nasl 7674 2017-11-07 06:54:24Z ckuersteiner $
#
# Foreman Detection
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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
  script_oid("1.3.6.1.4.1.25623.1.0.106384");
  script_version("$Revision: 7674 $");
  script_tag(name:"last_modification", value:"$Date: 2017-11-07 07:54:24 +0100 (Tue, 07 Nov 2017) $");
  script_tag(name:"creation_date", value:"2016-11-29 08:20:28 +0700 (Tue, 29 Nov 2016)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("Foreman Detection");

  script_tag(name:"summary", value:"Detection of Foreman

  The script sends a connection request to the server and attempts to detect the presence of Foreman
and to extract its version");

  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 443);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"https://theforeman.org/");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 443);

req = http_get(port: port, item: "/users/login");
res = http_keepalive_send_recv(port: port, data: req);

if ("Welcome to Foreman" >< res && "<title>Login</title>" >< res) {
  version = 'unknown';

  vers = eregmatch(pattern: 'id="version">Version ([0-9.]+)', string: res);
  if (!isnull(vers[1])) {
    version = vers[1];
    set_kb_item(name: "foreman/version", value: version);
  }
  else {
    vers = eregmatch(pattern: "<p>Version ([0-9.]+)", string: res);
    if (!isnull(vers[1])) {
      version = vers[1];
      set_kb_item(name: "foreman/version", value: version);
    }
  }

  set_kb_item(name: "foreman/installed", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:theforeman:foreman:");
  if (!cpe)
    cpe = 'cpe:/a:theforeman:foreman';

  register_product(cpe: cpe, location: "/", port: port);

  log_message(data: build_detection_report(app: "Foreman", version: version, install: "/", cpe: cpe,
                                           concluded: vers[0]),
              port: port);
  exit(0);
}

exit(0);
