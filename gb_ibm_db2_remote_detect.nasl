###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_db2_remote_detect.nasl 10888 2018-08-10 12:08:02Z cfischer $
#
# IBM DB2 Remote Version Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.801502");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 10888 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 14:08:02 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2010-09-03 15:47:26 +0200 (Fri, 03 Sep 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("IBM DB2 Remote Version Detection");

  script_tag(name:"summary", value:"Detection of IBM DB2.

The script sends a connection request to the server and attempts to
extract the version number from the reply.");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Product detection");
  script_require_udp_ports(523);
  exit(0);
}

include("cpe.inc");
include("host_details.inc");

udp_port = 523;

if(!get_udp_port_state(udp_port)){
  exit(0);
}

soc = open_sock_udp(udp_port);
if(soc)
{
  base = 11;
  ## SQL query to get version
  raw_data =string('DB2GETADDR\x00SQL08020\x00');

  send(socket:soc, data:raw_data);
  result = recv(socket:soc, length:1000);
  if(!result){
    exit(0);
  }

  if(ord(result[0]) == 68 && ord(result[1] == 66) && ord(result[2]) == 50 &&
     ord(result[11]) == 83 && ord(result[12]) == 81 && ord(result[13]== 76))
  {
    hole_data = "";
    for (i = 0 ; i < 50  ; i = i + 1){
      hole_data = hole_data + result[base+i];
    }

    set_kb_item(name:"IBM-DB2/installed", value:TRUE);
    ver =  eregmatch(pattern:"([0-9]+)", string:hole_data);
    if(ver[1])
    {
      set_kb_item(name:"IBM-DB2/Remote/ver", value:ver[1]);
      set_kb_item(name:"IBM-DB2/Remote/" + udp_port + "/ver", value:ver[1]);
      set_kb_item(name:"OpenDatabase/found", value:TRUE);

      cpe = build_cpe(value:ver[1], exp:"^([0-9.]+)", base:"cpe:/a:ibm:db2:");
      if(isnull(cpe))
        cpe = 'cpe:/a:ibm:db2';

      register_product(cpe:cpe, location:udp_port + '/udp', port:udp_port);

      log_message(data: build_detection_report(app:"IBM DB2 Server", version:ver[1],
                  install:udp_port + '/udp', cpe:cpe, concluded: ver[1]), port:udp_port);

    }
  }
}

close(soc);
