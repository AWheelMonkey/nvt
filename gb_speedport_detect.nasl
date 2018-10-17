###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_speedport_detect.nasl 11885 2018-10-12 13:47:20Z cfischer $
#
# Speedport DSL-Router Detection
#
# Authors:
# Christian Kuerstiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.105900");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 11885 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 15:47:20 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-03-14 12:14:21 +0700 (Fri, 14 Mar 2014)");
  script_name("Speedport DSL-Router Detection");

  script_tag(name:"summary", value:"The script attempts to extract the version number from the SIP banner.");

  script_category(ACT_GATHER_INFO);
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("sip_detection.nasl", "find_service.nasl");
  script_mandatory_keys("sip/detected");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("sip.inc");

infos = get_sip_port_proto( default_port:"5060", default_proto:"udp" );
port = infos['port'];
proto = infos['proto'];

banner = get_sip_banner(port: port, proto: proto);
if (!banner || "Speedport" >!< banner) {
  exit(0);
}

model = 'unknown';
mo = eregmatch(pattern:'Speedport (W ([0-9]+V))', string:banner);
if (!isnull(mo[1])) {
  model = mo[1];
}

fw_version = 'unknown';
fw = eregmatch(pattern:'Speedport .* ([0-9]+\\.[0-9]+\\.[0-9]+) \\(', string:banner);
if (!isnull(fw[1]))
  fw_version = fw[1];

if (fw_version == 'unknown' && model == 'unknown') {
  set_kb_item(name:'speedport/firmware_version', value:fw_version);
  set_kb_item(name:'speedport/model', value:model);
  cpe_model = str_replace(string:tolower(model), find:" ", replace:"_");
} else {
  cpe_model = 'unknown';
}

cpe = build_cpe(value:fw_version, exp:"^([0-9.]+)", base:'cpe:/a:t-com:speedport:' + cpe_model + ':' );
if (isnull(cpe)) {
  cpe = "cpe:/a:t-com:speedport";
}

location = port + "/" + proto;

register_product(cpe: cpe, port: port, location: location, service: "sip", proto: proto);

log_message(data:build_detection_report(app:"Deutsche Telecom Speedport " + model,
                                           version:fw_version,
                                           install:location,
                                           cpe:cpe,
                                           concluded: banner ),
             port:port,
             proto:proto);


exit(0);
