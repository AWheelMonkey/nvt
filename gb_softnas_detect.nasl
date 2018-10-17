###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_softnas_detect.nasl 10901 2018-08-10 14:09:57Z cfischer $
#
# SoftNAS Cloud Detection
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
  script_oid("1.3.6.1.4.1.25623.1.0.141347");
  script_version("$Revision: 10901 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 16:09:57 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-03 14:38:20 +0700 (Fri, 03 Aug 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("SoftNAS Cloud Detection");

  script_tag(name:"summary", value:"Detection ofSoftNAS Cloud.

The script sends a connection request to the server and attempts to detect SoftNAS Cloud.");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 443, 8443);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"https://www.softnas.com");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 443);

res = http_get_cache(port: port, item: "/softnas/login.php");

if ("SoftNAS Login</title>" >< res && "SoftNAS StorageCenter" >< res) {
  version = "unknown";

  set_kb_item(name: "softnas_cloud/detected", value: TRUE);

  cpe = 'cpe:/a:softnas:cloud';

  register_product(cpe: cpe, location: "/softnas", port: port);

  log_message(data: build_detection_report(app: "SoftNAS Cloud", version: version, install: "/softnas", cpe: cpe),
              port: port);
  exit(0);
}

exit(0);
