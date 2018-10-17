###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_crestron_ctp_detect.nasl 11885 2018-10-12 13:47:20Z cfischer $
#
# Crestron Device Detection (CTP)
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.141174");
  script_version("$Revision: 11885 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 15:47:20 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-06-13 08:39:58 +0700 (Wed, 13 Jun 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("Crestron Device Detection (CTP)");

  script_tag(name:"summary", value:"Detection of Crestron devices.

The script sends a Crestron Terminal Protocol (CTP) connection request to the server and attempts to detect
Crestron devices and to extract its firmware version.");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("telnet.nasl");
  script_require_ports("Services/telnet", 41795);

  script_xref(name:"URL", value:"https://www.crestron.com/");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("telnet_func.inc");

port = get_telnet_port(default: 41795);

soc = open_sock_tcp(port);
if (!soc)
  exit(0);

send(socket: soc, data: raw_string(0x0d));
recv = recv(socket: soc, length: 100);
if (recv !~ "(Control|MC3|CP3) Console") {
  close(soc);
  exit(0);
}

set_kb_item(name: "crestron_device/detected", value: TRUE);

send(socket: soc, data: raw_string(0x0d, "showhw", 0x0d));
recv = recv(socket: soc, length: 512);

mod = eregmatch(pattern: 'Processor Type:([^\r]+)', string: recv);
if (!isnull(mod[1]))
  model = ereg_replace(pattern: '(\t| )', string: mod[1], replace: '');

send(socket: soc, data: raw_string(0x0d, "ver", 0x0d));
recv = recv(socket: soc, length: 512);
close(soc);

vers = eregmatch(pattern: "\[v([0-9.]+)", string: recv);
if (!isnull(vers[1]))
  version = vers[1];

cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/o:crestron:" + tolower(model) + ":");
if (!cpe)
  cpe = 'cpe:/o:crestron:' + tolower(model);

register_product(cpe: cpe, location: port + "/tcp", port: port);

log_message(data: build_detection_report(app: "Crestron " + model, version: version, install: port + "/tcp",
                                         cpe: cpe),
            port: port);

exit(0);
