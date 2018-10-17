###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tridium_niagara_http_detect.nasl 10911 2018-08-10 15:16:34Z cfischer $
#
# Tridium Niagara Detection (HTTP)
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
  script_oid("1.3.6.1.4.1.25623.1.0.141355");
  script_version("$Revision: 10911 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 17:16:34 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-07 16:23:44 +0700 (Tue, 07 Aug 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("Tridium Niagara Detection (HTTP)");

  script_tag(name:"summary", value:"Detection of Tridium Niagara Detection.

This script performs HTTP based detection of Tridium Niagara devices and attempts to extract its version.");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80, 443);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"https://www.tridium.com");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 80);

# Niagara 3 start page is actually "/login" (/prelogin on Niagara 4), but we handle this with the server banner
res = http_get_cache(port: port, item: "/prelogin");
if (res =~ "erver: Niagara Web Server/" || ("login/loginN4.js" >< res && "login/keys.png" >< res)) {
  version = "unknown";

  vers = eregmatch(pattern: ".erver: Niagara Web Server/([0-9.]+)", string: res);
  if (!isnull(vers[1]))
    version = vers[1];

  set_kb_item(name: "tridium_niagara/detected", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:tridium:niagra:");
  if (!cpe)
    cpe = 'cpe:/a:tridium:niagra';

  register_product(cpe: cpe, location: "/", port: port, service: "www");

  log_message(data: build_detection_report(app: "Tridium Niagara", version: version, install: "/", cpe: cpe,
                                           concluded: vers[0]),
              port: port);
  exit(0);
}

exit(0);
