###############################################################################
# OpenVAS Vulnerability Test
# $Id: ssh_ssf.nasl 5274 2017-02-12 13:52:52Z cfi $
#
# SSF Detection
#
# Authors:
# Michel Arboi
#
# Copyright:
# Copyright (C) 2008 Michel Arboi
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
###############################################################################

# http://perso.univ-rennes1.fr/bernard.perrot/SSF/index.html
# http://ccweb.in2p3.fr/secur/ssf/

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.80087");
  script_version("$Revision: 5274 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-12 14:52:52 +0100 (Sun, 12 Feb 2017) $");
  script_tag(name:"creation_date", value:"2008-10-24 23:33:44 +0200 (Fri, 24 Oct 2008)");
  script_tag(name:"cvss_base", value:"2.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:N/I:N/A:P");
  script_name("SSF Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2008 Michel Arboi");
  script_family("Service detection");
  script_dependencies("ssh_detect.nasl", "gb_dropbear_ssh_detect.nasl");
  script_require_ports("Services/ssh", 22);
  script_exclude_keys("openssh/detected", "dropbear/installed");

  script_xref(name:"URL", value:"http://ccweb.in2p3.fr/secur/ssf/");
  script_xref(name:"URL", value:"http://perso.univ-rennes1.fr/bernard.perrot/SSF/");

  tag_summary = "The remote version of the SSH server is not maintained
  any more.

  Description :

  According to its banner, the remote SSH server is the
  SSF derivative.

  SSF had been written to be compliant with restrictive 
  laws on cryptography in some European countries, France 
  especially. 

  These regulations have been softened and OpenSSH received 
  a formal authorisation from the French administration in 
  2002 and the development of SSF has been discontinued.

  SSF is based upon an old version of OpenSSH and it implements
  an old version of the protocol. As it is not maintained any
  more, it might be vulnerable to dangerous flaws.";

  tag_solution = "Remove SSF and install an up to date version of OpenSSH.";

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"Mitigation");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("ssh_func.inc");

port = get_ssh_port( default:22 );
banner = get_kb_item( "SSH/banner/" + port );
if( ! banner ) exit( 0 );

if( egrep( string:banner, pattern:"^SSH-[0-9.]+-SSF" ) ) {
  security_message( port:port, data:"Banner: " + banner );
  exit( 0 );
}

exit( 99 );
