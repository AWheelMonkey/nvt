###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_moxa_mgate_telnet_detect.nasl 10891 2018-08-10 12:51:28Z cfischer $
#
# Moxa MGate Detection (telnet)
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
# of the License, or (at your option) any later version
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105822");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 10891 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 14:51:28 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2016-07-25 13:26:43 +0200 (Mon, 25 Jul 2016)");
  script_name("Moxa MGate Detection (telnet)");
  script_category(ACT_GATHER_INFO);
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("telnetserver_detect_type_nd_version.nasl");
  script_require_ports("Services/telnet", 23);

  script_tag(name:"summary", value:"This script performs Telnet based detection of Moxa MGate");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("telnet_func.inc");
include("host_details.inc");

port = get_kb_item("Services/telnet");
if( ! port ) port = 23;
if( ! get_port_state( port ) ) exit( 0 );

banner = get_telnet_banner( port:port );
if( ! isnull( banner ) ) banner = str_replace( find:raw_string(0), replace:'', string:banner );

if( ! banner || banner !~ "Model name\s*:\s*MGate " ) exit( 0 );

cpe = 'cpe:/a:moxa:mgate';
version = "unknown";

vb = eregmatch( pattern:'Firmware version\\s*:\\s*([0-9.]+) Build ([0-9]+[^ \r\n])', string: banner );

if( ! isnull( vb[1] ) )
{
  version = vb[1];
  replace_kb_item( name:"moxa/mgate/version", value:version );
  cpe += ':' + version;
}
if( ! isnull( vb[2] ) )
{
  build = vb[2];
  replace_kb_item( name:"moxa/mgate/build", value:build );
}

mod = eregmatch( pattern:'Model name\\s*:\\s*MGate ([^ \r\n]+)', string:banner );
if( ! isnull( mod[1] ) )
{
  model = mod[1];
  replace_kb_item( name:"moxa/mgate/model", value:model );
}

set_kb_item( name:'moxa/mgate/installed', value:TRUE );
register_product( cpe:cpe, location:port + '/tcp', port:port, service:'telnet' );

report = 'Moxa MGate telnet console is running at this port.\n\n' +
         'Version: ' + version + '\n' +
         'CPE:     ' + cpe + '\n';

if( build )  report += 'Build    ' + build + '\n';
if( model )  report += 'Model:   ' + model + '\n';;

log_message( port:port, data:report );

exit(0);
