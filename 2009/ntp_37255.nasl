###############################################################################
# OpenVAS Vulnerability Test
# $Id: ntp_37255.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# NTP mode 7 MODE_PRIVATE Packet Remote Denial of Service Vulnerability
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_summary = "NTP is prone to a remote denial-of-service vulnerability because it
fails to properly handle certain incoming network packets.

An attacker can exploit this issue to cause the application to consume
excessive CPU resources and fill disk space with log messages.";

tag_solution = "Updates are available. Please see the references for details.";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100399");
 script_version("$Revision: 9350 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2009-12-15 19:11:56 +0100 (Tue, 15 Dec 2009)");
 script_bugtraq_id(37255);
 script_cve_id("CVE-2009-3563");
 script_tag(name:"cvss_base", value:"6.4");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:P");

 script_name("NTP mode 7 MODE_PRIVATE Packet Remote Denial of Service Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/37255");
 script_xref(name : "URL" , value : "https://support.ntp.org/bugs/show_bug.cgi?id=1331");
 script_xref(name : "URL" , value : "http://www.ntp.org/");
 script_xref(name : "URL" , value : "http://www.kb.cert.org/vuls/id/568372");

 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_vul");
 script_family("Denial of Service");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("ntp_open.nasl");
 script_mandatory_keys("NTP/Running");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

port = "123";
if(!(get_udp_port_state(port)))exit(0);

data = raw_string(0x97, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00);
soc = open_sock_udp(port);
if(!soc)exit(0);

send(socket:soc, data:data);
r = recv(socket:soc, length:8);
close(soc);

if(!r)exit(0);

if(hexstr(r) == "9700000030000000") {

  security_message(port:port, proto:"udp");
  exit(0);

}

exit(0);
