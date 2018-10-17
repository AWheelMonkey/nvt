###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_wsftp_win_detect.nasl 11256 2018-09-06 07:32:15Z cfischer $
#
# WS_FTP Server Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
################################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900608");
  script_version("$Revision: 11256 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-06 09:32:15 +0200 (Thu, 06 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-03-12 10:50:11 +0100 (Thu, 12 Mar 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("WS_FTP Server Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Product detection");
  script_dependencies("find_service_3digits.nasl");
  script_require_ports("Services/ftp", 21);

  script_tag(name:"summary", value:"This script determines the WS_FTP server version on the remote host
  and sets the result in the KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("ftp_func.inc");

port = get_ftp_port( default:21 );
banner = get_ftp_banner( port:port );
if( "WS_FTP Server" >!< banner ) exit( 0 );

install = port + "/tcp";
version = "unknown";
set_kb_item( name:"WS_FTP/detected", value:TRUE );

vers = eregmatch( pattern:"WS_FTP Server ([0-9.]+)", string:banner );
if( ! isnull( vers[1] ) ) {
  version = vers[1];
  set_kb_item( name:"WSFTP/Win/Ver", value:version );
}

cpe = build_cpe( value:version, exp:"^([0-9.]+)", base:"cpe:/a:ipswitch:ws_ftp:");
if( isnull( cpe ) )
  cpe = "cpe:/a:ipswitch:ws_ftp";

register_product( cpe:cpe, location:install, port:port, service:"ftp" );

log_message( data:build_detection_report( app:"WS_FTP Server",
                                          version:version,
                                          install:install,
                                          cpe:cpe,
                                          concluded:vers[0] ),
                                          port:port );

exit( 0 );