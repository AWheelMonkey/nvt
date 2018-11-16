###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_netman_204_default_ssh_credentials.nasl 12313 2018-11-12 08:53:51Z asteins $
#
# NetMan 204 Default SSH Login
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140001");
  script_version("$Revision: 12313 $");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("NetMan 204 Default SSH Login");
  script_tag(name:"last_modification", value:"$Date: 2018-11-12 09:53:51 +0100 (Mon, 12 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-09-28 15:56:01 +0200 (Wed, 28 Sep 2016)");
  script_category(ACT_ATTACK);
  script_family("Default Accounts");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_require_ports("Services/ssh", 22);

  script_tag(name:"summary", value:'The remote NetMan 204 device is prone to a default account authentication bypass vulnerability.');

  script_tag(name:"impact", value:'This issue may be exploited by a remote attacker to gain access to sensitive information or modify system configuration.');

  script_tag(name:"vuldetect", value:'Try to login with known credentials.');
  script_tag(name:"solution", value:'Change the password.');
  script_dependencies("find_service.nasl", "os_detection.nasl");
  script_require_keys("Host/runs_unixoide");
  script_tag(name:"solution_type", value:"Workaround");
  script_tag(name:"qod_type", value:"exploit");
  exit(0);
}

include("ssh_func.inc");
include("misc_func.inc");

port = get_kb_item( "Services/ssh" );
if( ! port ) port = 22;

if( ! get_port_state( port ) ) exit( 0 );

credentials = make_list("eurek","fwupgrade");

foreach credential ( credentials )
{
  if( ! soc = open_sock_tcp( port ) ) exit( 0 );

  login = ssh_login( socket:soc, login:credential, password:credential, pub:NULL, priv:NULL, passphrase:NULL );

  if(login == 0)
  {

    files = traversal_files("linux");

    foreach pattern( keys( files ) ) {

      file = files[pattern];

      cmd = ssh_cmd( socket:soc, cmd:'cat /' + file );

      if( egrep( string:cmd, pattern:pattern ) )
      {
        report = 'It was possible to login as user `' + credential  + '` with password `' + credential  + '` and to execute `cat /' + file + '`. Result:\n\n' + cmd;
        close( soc );
        security_message( port:port, data:report );
        exit( 0 );
      }
    }
  }
}

if( soc ) close( soc );
exit( 99 );
