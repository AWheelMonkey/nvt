###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_opera_detect.nasl 11885 2018-10-12 13:47:20Z cfischer $
#
# Oracle OPERA Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106482");
  script_version("$Revision: 11885 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 15:47:20 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-12-20 08:18:50 +0700 (Tue, 20 Dec 2016)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("Oracle OPERA Detection");

  script_tag(name:"summary", value:"Detection of Oracle OPERA

The script sends a HTTP connection request to the server and attempts to detect the presence of Oracle OPERA and
to extract its version.");

  script_category(ACT_GATHER_INFO);
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 80);

req = http_get(port: port, item: "/OperaLogin/Welcome.do");
res = http_keepalive_send_recv(port: port, data: req);

if ("<title>OPERA Login</title>" >< res) {
  version = "unknown";

  req = http_get(port: port, item: "/OperaHelp/welcome_to_opera_hotel_edition.htm");
  res = http_keepalive_send_recv(port: port, data: req);

  vers = eregmatch(pattern: '<p class="bodytextcentered">V([0-9.]+) ', string: res);
  if (!isnull(vers[1])) {
    version = vers[1];
    set_kb_item(name: "oracle/opera/version", value: version);
  }

  set_kb_item(name: "oracle/opera/installed", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:oracle:hospitality_opera_5_property_services:");
  if (!cpe)
    cpe = 'cpe:/a:oracle:hospitality_opera_5_property_services';

  register_product(cpe: cpe, location: "/", port: port);

  log_message(data: build_detection_report(app: "Oracle OPERA", version: version, install: "/", cpe: cpe,
                                           concluded: vers[0]),
              port: port);
  exit(0);
}

exit(0);
