##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_aerohive_hiveos_detect.nasl 10888 2018-08-10 12:08:02Z cfischer $
#
# Aerohive Networks HiveOS Detection
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.106875");
  script_version("$Revision: 10888 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 14:08:02 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-06-16 11:44:13 +0700 (Fri, 16 Jun 2017)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("Aerohive Networks HiveOS Detection");

  script_tag(name:"summary", value:"Detection of Aerohive Networks HiveOS.

The script sends a connection request to the server and attempts to detect Aerohive Networks HiveOS and to
extract its version.");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 443);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://www.aerohive.com/");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 443);

res = http_get_cache(port: port, item: "/index.php5");

if (("<title>Aerohive NetConfig UI</title>" >< res || "<title>Aerohive HiveUI</title>" >< res) &&
    "><b>Hive</b>OS</td>" >< res) {
  version = "unknown";

  vers = eregmatch(pattern: "version=([0-9r.]+)", string: res);
  if (!isnull(vers[1])) {
    version = vers[1];
    set_kb_item(name: "aerohive_hiveos/version", value: version);
  }

  set_kb_item(name: "aerohive_hiveos/detected", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9r.]+)", base: "cpe:/o:aerohive:hiveos:");
  if (!cpe)
    cpe = 'cpe:/o:aerohive:hiveos';

  register_product(cpe: cpe, location: "/", port: port, service: "www");
  register_and_report_os(os: "Aerohive Networks HiveOS", cpe: cpe, port: port, banner_type: "HTTP login page",
                         desc: "Aerohive Networks HiveOS Detection", runs_key: "unixoide");

  log_message(data: build_detection_report(app: "Aerohive Networks HiveOS", version: version, install: "/",
                                           cpe: cpe, concluded: vers[0]),
              port: port);
  exit(0);
}

exit(0);
