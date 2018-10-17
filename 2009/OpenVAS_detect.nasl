###############################################################################
# OpenVAS Vulnerability Test
# $Id: OpenVAS_detect.nasl 10878 2018-08-10 08:52:28Z cfischer $
#
# OpenVAS Scanner Detection
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
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
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100076");
  script_version("$Revision: 10878 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 10:52:28 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2009-03-24 18:59:36 +0100 (Tue, 24 Mar 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("OpenVAS Scanner Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("nessus_detect.nasl", "find_service2.nasl");
  script_require_ports("Services/unknown", 9391);

  script_tag(name:"summary", value:"Detection of OpenVAS Scanner.

  The script sends a connection request to the server and attempts to
  identify an OpenVAS Scanner service from the reply.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("misc_func.inc");
include("host_details.inc");

port = get_unknown_port( default:9391 );

# nb: Set by nessus_detect.nasl if we have hit a service described in the notes below
# No need to continue here as well...
if( get_kb_item( "generic_echo_test/" + port + "/failed" ) ) exit( 0 );

# nb: Set by nessus_detect.nasl as well. We don't need to do the same test
# multiple times...
if( ! get_kb_item( "generic_echo_test/" + port + "/tested" ) ) {
  soc = open_sock_tcp( port );
  if( ! soc ) exit( 0 );
  send( socket:soc, data:string( "TestThis\r\n" ) );
  r = recv_line( socket:soc, length:10 );
  close( soc );
  # We don't want to be fooled by echo & the likes
  if( "TestThis" >< r ) {
    set_kb_item( name:"generic_echo_test/" + port + "/failed", value:TRUE );
    exit( 0 );
  }
}

set_kb_item( name:"generic_echo_test/" + port + "/tested", value:TRUE );

foreach protocol( make_list( "1.0", "1.1", "1.2", "2.0" ) ) {

  soc = open_sock_tcp( port );
  if( ! soc ) exit( 0 );

  req = string( "< OTP/", protocol, " >\n" );
  send( socket:soc, data:req );
  res = recv_line( socket:soc, length:20 );
  close( soc );

  if( ereg( pattern:"^< OTP/" + protocol + " >$", string:res ) ) {

    set_kb_item( name:"openvas_scanner/installed", value:TRUE );
    set_kb_item( name:"openvas_framework_component/installed", value:TRUE );

    cpe = "cpe:/a:openvas:openvas_scanner";
    vers = "unknown";
    install = port + "/tcp";

    register_service( port:port, proto:"openvas-scanner" );
    register_product( cpe:cpe, location:install, port:port );

    log_message( data:build_detection_report( app:"OpenVAS Scanner",
                                              version:vers,
                                              install:install,
                                              cpe:cpe,
                                              concluded:res ),
                                              port:port );
    break;
  }
}

exit( 0 );
