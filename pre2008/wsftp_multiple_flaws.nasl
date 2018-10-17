###############################################################################
# OpenVAS Vulnerability Test
# $Id: wsftp_multiple_flaws.nasl 6053 2017-05-01 09:02:51Z teissa $
#
# WS FTP server multiple flaws
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
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

#  Ref : Hugh Mann <hughmann@hotmail.com>

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.14598");
  script_version("$Revision: 6053 $");
  script_tag(name:"last_modification", value:"$Date: 2017-05-01 11:02:51 +0200 (Mon, 01 May 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_cve_id("CVE-2004-1848","CVE-2004-1883","CVE-2004-1884","CVE-2004-1885", "CVE-2004-1886");
  script_bugtraq_id(9953);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("WS FTP server multiple flaws");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2004 David Maciejak");
  script_family("FTP");
  script_dependencies("find_service.nasl", "ftpserver_detect_type_nd_version.nasl");
  script_require_ports("Services/ftp", 21);

  script_tag(name:"summary", value:"According to its version number, the remote WS_FTP server is vulnerable to
  multiple flaws.
  - A buffer overflow, caused by a vulnerability in the ALLO handler, an attacker can then execute arbitrary code
  - A flaw which allow an attacker to gain elevated privileges (SYSTEM level privileges)
  - A local or remote attacker, with write privileges on a directory can create a specially crafted file
  containing a large REST argument and resulting to a denial of service");
  script_tag(name:"solution", value:"Upgrade to the latest version of this software.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include ("ftp_func.inc");

port = get_ftp_port( default:21 );
if( ! banner = get_ftp_banner( port:port ) ) exit( 0 );

if( "WS_FTP Server" >!< banner ) exit( 0 );

# checking for WS_FTP Server 4.0.2
if( egrep( pattern:"WS_FTP Server ([0-3]\.|4\.0[^0-9]|4\.0\.[12][^0-9])", string:banner ) ) {
  security_message( port:port );
  exit( 0 );
}

exit( 99 );