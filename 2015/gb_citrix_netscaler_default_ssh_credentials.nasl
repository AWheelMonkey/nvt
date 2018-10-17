###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_citrix_netscaler_default_ssh_credentials.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# Citrix NetScaler SSH Default Credentials
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.105278");
  script_version("$Revision: 11872 $");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Citrix NetScaler SSH Default Credentials");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-05-12 18:01:07 +0200 (Tue, 12 May 2015)");
  script_category(ACT_ATTACK);
  script_family("Default Accounts");
  script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
  script_require_ports("Services/ssh", 22);

  script_tag(name:"summary", value:'The remote Citrix NetScaler is prone to a default account authentication
bypass vulnerability.');

  script_tag(name:"impact", value:'This issue may be exploited by a remote attacker to gain
access to sensitive information or modify system configuration.');

  script_tag(name:"vuldetect", value:'Try to login with default credentials.');
  script_tag(name:"insight", value:'It was possible to login with default credentials: nsroot/nsroot');
  script_tag(name:"solution", value:'Change the password.');
  script_tag(name:"solution_type", value:"Mitigation");
  script_dependencies("find_service.nasl");

  script_tag(name:"qod_type", value:"exploit");

  exit(0);
}

include("ssh_func.inc");

port = get_kb_item("Services/ssh");
if( ! port ) exit( 0 );

if( ! soc = open_sock_tcp( port ) ) exit( 0 );

user = 'nsroot';
pass = 'nsroot';

login = ssh_login(socket:soc, login:user, password:pass, pub:NULL, priv:NULL, passphrase:NULL );

if(login == 0)
{
  cmd = ssh_cmd( socket:soc, cmd:'show ns version', nosh:TRUE );
  close( soc );

  if( "NetScaler" >< cmd )
  {
    security_message( port:port, data:'It was possible to login via ssh into the Citrix NetScaler with username "nsroot" and password "nsroot"' );
    exit( 0 );
  }
}

if( soc ) close( soc );

exit( 99 );

