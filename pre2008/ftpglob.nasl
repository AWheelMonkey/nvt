# OpenVAS Vulnerability Test
# $Id: ftpglob.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: FTPD glob Heap Corruption
#
# Authors:
# EMAZE Networks S.p.A. 
# changes by rd: added risk factor & fix
#
# Copyright:
# Copyright (C) 2001 EMAZE Networks S.p.A.
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

bracket = raw_string(0x7B);
tag_summary = "The FTPD glob vulnerability manifests itself in handling of the glob command. 
The problem is not a typical buffer overflow or format string vulnerability, 
but a combination of two bugs: an implementation of the glob command that does not
 properly return an error condition when interpreting the string ~" + bracket + ",
and then frees memory which may contain user supplied data. This 
vulnerability is potentially exploitable by any user who is able to log in to 
a vulnerable server, including users with anonymous access. If successful, an 
attacker may be able to execute arbitrary code with the privileges of FTPD, 
typically root.";

if (description)
{
 	script_oid("1.3.6.1.4.1.25623.1.0.10821");
 	script_version("$Revision: 9348 $");
 	script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 	script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
    script_xref(name:"IAVA", value:"2001-b-0004");
 	script_bugtraq_id(2550, 3581);
	script_cve_id("CVE-2001-0249", "CVE-2001-0550");
    script_tag(name:"cvss_base", value:"10.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_tag(name:"qod_type", value:"remote_banner_unreliable");
	script_name("FTPD glob Heap Corruption");


 	script_category(ACT_MIXED_ATTACK); 
 	script_family( "FTP");

 	script_copyright("Copyright (C) 2001 E*Maze");

 	script_dependencies("find_service.nasl", "secpod_ftp_anonymous.nasl", "os_detection.nasl");
 	script_require_ports("Services/ftp", 21);

    script_tag(name : "solution" , value : "Contact your vendor for a fix");
    script_tag(name : "summary" , value : tag_summary);
 	exit(0);
}

include("global_settings.inc");
include("ftp_func.inc");
include("host_details.inc");

port = get_kb_item("Services/ftp");
if (!port)
	port = 21;

if (!get_port_state(port))
	exit(0);

login = get_kb_item("ftp/login");
password = get_kb_item("ftp/password");

if(safe_checks())login = 0;


if (login)
{
	soc = open_sock_tcp(port);
	if (!soc)
		exit(0);

	if (ftp_authenticate(socket:soc, user:login, pass:password))
	{
 		c = string("CWD ~", bracket, "\r\n");
     		d = string("CWD ~*", bracket, "\r\n");
			
		send(socket:soc, data:c);
     		b = ftp_recv_line(socket:soc);

 		send(socket:soc, data:d);
		e = ftp_recv_line(socket:soc);

		#
		# Buggy version. no known exploits
		#
		
		buggy = string(
		"You seem to be running an FTP server which is vulnerable to the 'glob heap corruption'\n",
		"flaw, but which can not be exploited on this server.\n",
		"Solution: Upgrade your ftp server software to the latest version.\n");

		

		#
		# Vulnerable version. Working exploit has been written
		#
		vuln = string(
		"You seem to be running an FTP server which is vulnerable to the 'glob heap corruption'\n",
		"flaw, which is known to be exploitable remotely against this server. An attacker may use \n",
		"this flaw to execute arbitrary commands on this host.\n\n",
		"Solution: Upgrade your ftp server software to the latest version.\n");

			
		#
		# Check if the connetcion is lost
		# if it is, the daemon is vulnerable
		# linux/bsd: wuftpd, beroftpd
		# solaris ftpd
		#

		if ((!b) || (!e))
		{
			security_message(port:port, data:vuln); 
			exit(0);
		}

		#
		# Freebsd / Openbsd command successful. 
		# buggy version
		#
		if ((b >< "250 CWD command successful") ||
		    (e >< "250 CWD command successful"))
		{
		   	security_message(port:port, data:buggy); 
			exit(0);
		}
				
		#	
		# Netbsd vulnerable
		#
		if((b >< ":") || (e >< ":"))
		{
			security_message(port:port, data:vuln);
			exit(0);
		}

		#
		# Aix buggy
		#
		if ((b >< "550 Unknown user name after ~") ||
		    (e >< "550 Unknown user name after ~"))
		{
			security_message(port:port, data:buggy);
			exit(0);
		}

		#
		# MacOS X Darwin buggy
		#
		if ((b >< "550 ~: No such file or directory") ||
		    (e >< "550 ~: No such file or directory"))
		{
		   	security_message(port:port, data:buggy);
			exit(0);
		}

		#
		# The non vulnerable version
		#
     		ftp_close(socket:soc);

		exit(0);
	}

	ftp_close(socket: soc);
}


if (host_runs(".*FreeBSD (4\.[5-9]|5\..*).*") == "yes") exit(0);




#  		
# We weren't able to login into the ftp server.
# check the banner instead
#
banner = get_ftp_banner(port: port);

if (!banner)
	exit(0);

#
# FTP server 4.1 (aix/ultrix), 1.1. (hp-ux), 6.00 (darwin), 6.00LS (freebsd)
#

# wu-ftpd 2.6.1-20 is not vulnerable
if(egrep(pattern:".*wu-2\.6\.1-[2-9][0-9].*", string:banner))exit(0);


if ( "PHNE_27765" >< banner ||
     "PHNE_29461" >< banner ||
     "PHNE_30432" >< banner ||
     "PHNE_31931" >< banner ||
     "PHNE_30990" >< banner ) exit(0);

if (
	egrep(pattern: 
		".*wu-([0-1]|(2\.([0-5][^0-9]|6\.[0-1]))).*", 
	string:banner) ||
	egrep(pattern: 
		".*BeroFTPD.*", 
	string:banner) ||
	egrep(pattern: 
		".*NetBSD-ftpd (199[0-9]|200[0-1]).*", 
	string:banner) ||
	egrep(pattern: 
		".*Digital UNIX Version [0-5]\..*", 
	string:banner) ||
	egrep(pattern: 
		".*SunOS [0-5]\.[0-8].*", 
	string:banner) ||
	egrep(pattern: 
		".*FTP server.*Version (1\.[0-1]\.|4\.1|6\.00|6\.00LS).*",
	string:banner)	||
	egrep(pattern:
		".*FTP server .SRPftp 1\.[0-3].*", 
	      string:banner)) 
	{
	banvuln = string(
		"You seem to be running an FTP server which is vulnerable to the\n",
		"'glob heap corruption' flaw.\n",
		"An attacker may use this problem to execute arbitrary commands on this host.\n\n",
		"*** OpenVAS relied solely on the banner of the server to issue this warning,\n",
		"*** so this alert might be a false positive\n",
		"*** NOTE: must have a valid username/password to fully check this vulnerability\n\n",
		"Solution: Upgrade your ftp server software to the latest version.\n");

	security_message(port:port, data:banvuln); 
	exit(0);
}

