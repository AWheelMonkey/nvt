##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_puppet_enterprise_detect.nasl 11885 2018-10-12 13:47:20Z cfischer $
#
# Puppet Enterprise Detection
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106362");
  script_version("$Revision: 11885 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 15:47:20 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-11-01 13:44:38 +0700 (Tue, 01 Nov 2016)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("Puppet Enterprise Detection");

  script_tag(name:"summary", value:"Detection of Puppet Enterprise

The script sends a connection request to the server and attempts to detect the presence of Puppet Enterprise and
to extract its version.");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 443);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"https://puppet.com/");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 443);

req = http_get(port: port, item: "/auth/login?redirect=/");
res = http_keepalive_send_recv(port: port, data: req);

if ("Log In | Puppet Enterprise" >< res && "usernameError" >< res) {
  version = "unknown";

  vers = eregmatch(pattern: "([0-9.]+)/install_system_requirements.html", string: res);
  if (!isnull(vers[1])) {
    version = vers[1];
    set_kb_item(name: "puppet_enterprise/version", value: version);
  }

  set_kb_item(name: "puppet_enterprise/installed", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:puppet:enterprise:");
  if (!cpe)
    cpe = 'cpe:/a:puppet:enterprise';

  register_product(cpe: cpe, location: "/", port: port);

  log_message(data: build_detection_report(app: "Puppet Enterprise", version: version, install: "/", cpe: cpe,
                                           concluded: vers[0]),
              port: port);
  exit(0);
}

exit(0);
