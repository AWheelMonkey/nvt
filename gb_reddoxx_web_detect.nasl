###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_reddoxx_web_detect.nasl 10898 2018-08-10 13:38:13Z cfischer $
#
# REDDOXX Web Detection
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
  script_oid("1.3.6.1.4.1.25623.1.0.106982");
  script_version("$Revision: 10898 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 15:38:13 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-07-25 09:54:05 +0700 (Tue, 25 Jul 2017)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("REDDOXX Web Detection");

  script_tag(name:"summary", value:"Detection of REDDOX Appliance Web Interface.

The script sends a connection request to the server and attempts to detect the web interface of REDDOXX
Appliance.");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 443);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"https://www.reddoxx.com/");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 443);

res = http_get_cache(port: port, item: "/rws/user/");

if (("<title>REDDOXX" >< res || "<title>ApplianceUI" >< res) && ("RemObjectsSDK.js" >< res || 'bada:"Bada"' >< res)) {
  version = "unknown";

  set_kb_item(name: "reddoxx/detected", value: TRUE);

  cpe = 'cpe:/a:reddoxx:reddox_appliance';

  register_product(cpe: cpe, location: "/", port: port, service: "www");

  log_message(data: build_detection_report(app: "REDDOXX Appliance", version: version, install: "/", cpe: cpe),
              port: port);
  exit(0);
}

exit(0);
