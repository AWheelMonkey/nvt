###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ssh_default_insight.nasl 11903 2018-10-15 10:26:16Z asteins $
#
# Default password `WhatsHappeningNow` for `insight` account
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
  script_oid("1.3.6.1.4.1.25623.1.0.140110");
  script_version("$Revision: 11903 $");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Default password `WhatsHappeningNow` for `insight` account");
  script_tag(name:"last_modification", value:"$Date: 2018-10-15 12:26:16 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-12-29 10:38:45 +0100 (Thu, 29 Dec 2016)");
  script_category(ACT_ATTACK);
  script_family("Default Accounts");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_require_ports("Services/ssh", 22);

  script_tag(name:"summary", value:'The remote device is prone to a default account authentication bypass vulnerability.');

  script_tag(name:"impact", value:'This issue may be exploited by a remote attacker to gain access to sensitive information or modify system configuration.');

  script_tag(name:"vuldetect", value:'Try to login as `insight` with password `WhatsHappeningNow`.');
  script_tag(name:"solution", value:'Change the password');
  script_tag(name:"solution_type", value:"Workaround");
  script_dependencies("ssh_detect.nasl");
  script_tag(name:"qod_type", value:"exploit");
  exit(0);
}

include("ssh_func.inc");

port = get_kb_item( "Services/ssh" );
if( ! port ) port = 22;

if( ! get_port_state( port ) ) exit( 0 );

if( ! soc = open_sock_tcp( port ) ) exit( 0 );

user = 'insight';
pass = 'WhatsHappeningNow';

login = ssh_login( socket:soc, login:user, password:pass, pub:NULL, priv:NULL, passphrase:NULL );

if(login == 0)
{
  cmd = ssh_cmd( socket:soc, cmd:'/home/insight/app/utils/status' );

  close( soc );

  if( "Immediate Insight" >< cmd )
  {
    report = 'It was possible to login as user `insight` with password `WhatsHappeningNow`\n';
    security_message( port:port, data:report );
    exit( 0 );
  }
}

if( soc ) close( soc );
exit( 0 );

