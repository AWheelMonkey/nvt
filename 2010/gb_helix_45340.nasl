###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_helix_45340.nasl 8438 2018-01-16 17:38:23Z teissa $
#
# Helix Server Administration Interface Cross Site Request Forgery Vulnerability
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

tag_summary = "Helix Server is prone to a cross-site request-forgery vulnerability.

An attacker can exploit this issue to perform unauthorized actions by
enticing a logged-in user to visit a malicious site.

Helix Server 14.0.1.571 is vulnerable; other versions may also
be affected.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100945");
 script_version("$Revision: 8438 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-16 18:38:23 +0100 (Tue, 16 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-12-14 13:08:24 +0100 (Tue, 14 Dec 2010)");
 script_bugtraq_id(45340);
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

 script_name("Helix Server Administration Interface Cross Site Request Forgery Vulnerability");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/45340");
 script_xref(name : "URL" , value : "http://www.realnetworks.com/products-services/helix-server-proxy.aspx");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("General");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("rtsp_detect.nasl");
 script_require_ports("Services/rtsp", 554);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("version_func.inc");

port = get_kb_item("Services/rtsp");
if(!port)port = 554;
if(!get_port_state(port))exit(0);

if(!server = get_kb_item(string("RTSP/",port,"/Server")))exit(0);
if("Server: Helix" >!< server)exit(0);

version = eregmatch(pattern:"Version ([0-9.]+)", string: server);

if(isnull(version[1]))exit(0);

if(version_is_equal(version:version[1], test_version:"14.0.1.571")) {
  security_message(port:port);
  exit(0);
}  

exit(0);
