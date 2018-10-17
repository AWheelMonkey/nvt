###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openshift_detect.nasl 11274 2018-09-07 06:20:26Z ckuersteiner $
#
# RedHat OpenShift Detection
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
  script_oid("1.3.6.1.4.1.25623.1.0.141450");
  script_version("$Revision: 11274 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-07 08:20:26 +0200 (Fri, 07 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-07 10:45:04 +0700 (Fri, 07 Sep 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("RedHat OpenShift Detection");

  script_tag(name:"summary", value:"Detection of RedHat OpenShift.

The script sends a connection request to the server and attempts to detect RedHat OpenShift and to extract its
version.");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80, 443, 8443);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"https://www.openshift.com/");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 443);

res = http_get_cache(port: port, item: "/console/");

if ("<title>OpenShift Web Console</title>" >< res && "console-os") {
  version = "unknown";

  url = "/console/config.js";
  req = http_get(port: port, item: url);
  res = http_keepalive_send_recv(port: port, data: req);

  vers = eregmatch(pattern: 'openshift: "v([0-9.]+)"', string: res);
  if (!isnull(vers[1])) {
    version = vers[1];
    concUrl = url;
  }

  set_kb_item(name: "rh_openshift/installed", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:redhat:openshift:");
  if (!cpe)
    cpe = 'cpe:/a:redhat:openshift';

  register_product(cpe: cpe, location: "/", port: port);

  log_message(data: build_detection_report(app: "OpenShift", version: version, install: "/", cpe: cpe,
                                           concluded: vers[0], concludedUrl: concUrl),
              port: port);
  exit(0);
}

exit(0);
