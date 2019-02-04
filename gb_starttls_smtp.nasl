###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_starttls_smtp.nasl 13204 2019-01-21 17:32:45Z cfischer $
#
# SSL/TLS: SMTP 'STARTTLS' Command Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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
  script_oid("1.3.6.1.4.1.25623.1.0.103118");
  script_version("$Revision: 13204 $");
  script_tag(name:"last_modification", value:"$Date: 2019-01-21 18:32:45 +0100 (Mon, 21 Jan 2019) $");
  script_tag(name:"creation_date", value:"2011-03-11 13:29:22 +0100 (Fri, 11 Mar 2011)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("SSL/TLS: SMTP 'STARTTLS' Command Detection");
  script_category(ACT_GATHER_INFO);
  script_family("SSL and TLS");
  script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
  script_dependencies("find_service_3digits.nasl", "smtpserver_detect.nasl");
  script_require_ports("Services/smtp", 25, 587);

  script_tag(name:"summary", value:"Checks if the remote SMTP server supports SSL/TLS with the 'STARTTLS' command.");

  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"https://tools.ietf.org/html/rfc3207");

  exit(0);
}

include("smtp_func.inc");

port = get_smtp_port( default:25 );

if( get_port_transport( port ) > ENCAPS_IP )
  exit( 0 );

helo = smtp_get_helo_from_kb( port:port );
if( ! soc = smtp_open( port:port, data:helo, send_ehlo:TRUE ) )
  exit( 0 );

send( socket:soc, data:string( "STARTTLS\r\n" ) );
r = smtp_recv_line( socket:soc );
if( ! r ) {
  smtp_close( socket:soc, check_data:r );
  exit( 0 );
}

if( r =~ "^220[ -]" || "Ready to start TLS" >< r || "TLS go ahead" >< r || " Start TLS" >< r ) {

  set_kb_item( name:"smtp/starttls/supported", value:TRUE );
  set_kb_item( name:"smtp/" + port + "/starttls", value:TRUE );
  set_kb_item( name:"starttls_typ/" + port, value:"smtp" );

  report = "The remote SMTP server supports SSL/TLS with the 'STARTTLS' command.";

  soc2 = socket_negotiate_ssl( socket:soc );
  if( soc2 ) {
    send( socket:soc2, data:'EHLO ' + helo + '\r\n' );
    ehlo = smtp_recv_line( socket:soc2, code:"250" );
    smtp_close( socket:soc2, check_data:ehlo );

    if( ehlo ) {

      report = string( report, "\n\nThe remote SMTP server is announcing the following available ESMTP commands (EHLO response) after sending the 'STARTTLS' command:\n", ehlo );

      if( auth_string = egrep( string:ehlo, pattern:"^250[ -]AUTH .+" ) ) {

        set_kb_item( name:"smtp/auth_methods/available", value:TRUE );

        auth_string = chomp( auth_string );
        auth_string = substr( auth_string, 9 );
        auth_report = "";
        auths = split( auth_string, sep:" ", keep:FALSE );

        foreach auth( auths )
          set_kb_item( name:"smtp/" + port + "/tls_auth_methods", value:auth );
      }
    }
  } else {
    smtp_close( socket:soc, check_data:r );
  }

  log_message( port:port, data:report );
} else {
  set_kb_item( name:"smtp/starttls/not_supported", value:TRUE );
  set_kb_item( name:"smtp/starttls/not_supported/port", value:port );
}

exit( 0 );