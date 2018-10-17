###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_orion_npm_detect.nasl 10929 2018-08-11 11:39:44Z cfischer $
#
# SolarWinds Orion Network Performance Monitor Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Updated by : Antu Sanadi <santu@secpod.com> on 2011-09-15
#  Updated to detect for the sp versions
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100940");
  script_version("$Revision: 10929 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-11 13:39:44 +0200 (Sat, 11 Aug 2018) $");
  script_tag(name:"creation_date", value:"2010-12-09 13:44:03 +0100 (Thu, 09 Dec 2010)");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"cvss_base", value:"0.0");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("SolarWinds Orion Network Performance Monitor Detection");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 8787);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"Checks for the presence of SolarWinds Orion Network Performance Monitor.");
  script_xref(name:"URL", value:"http://www.solarwinds.com/products/orion/");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

include("cpe.inc");
include("host_details.inc");

port = get_http_port(default:8787);

if (!can_host_asp(port:port))
  exit(0);

dir = "/Orion";
url = string(dir, "/Login.aspx");
buf = http_get_cache(item:url, port:port);

if (buf == NULL)
  exit(0);

if ("SolarWinds Platform" >< buf || "SolarWinds Orion" >< buf || "Orion Platform" >< buf) {
  npm = eregmatch(string: buf, pattern: "(NPM|Network Performance Monitor) (([0-9.]+).?([A-Z0-9]+))",
                  icase:TRUE);

  if (!isnull(npm)) {
    vers = string("unknown");
    if (!isnull(npm[2])) {
      vers=chomp(npm[2]);
    }

    set_kb_item(name: string("www/", port, "/orion_npm"), value: vers);
    set_kb_item(name: "orion_npm/installed", value: TRUE);

    cpe = build_cpe(value: vers, exp:"^([0-9.]+).?([A-Z0-9]+)?",
                    base: "cpe:/a:solarwinds:orion_network_performance_monitor:");
    if (isnull(cpe))
      cpe = 'cpe:/a:solarwinds:orion_network_performance_monitor';

    register_product(cpe:cpe, location:dir, port:port);

    log_message(data: build_detection_report(app:"SolarWinds Network Performance Monitor", version: vers,
                                             install: dir, cpe: cpe,
                                             concluded: npm[0]), port:port);
  }
}

exit(0);

