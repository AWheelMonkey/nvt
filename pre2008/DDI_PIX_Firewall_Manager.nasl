###############################################################################
# OpenVAS Vulnerability Test
# $Id: DDI_PIX_Firewall_Manager.nasl 6040 2017-04-27 09:02:38Z teissa $
#
# PIX Firewall Manager Directory Traversal
#
# Authors:
# H D Moore <hdmoore@digitaldefense.net>
# Script audit and contributions from Carmichael Security <http://www.carmichaelsecurity.com>
# Erik Anderson <eanders@carmichaelsecurity.com>
# Added BugtraqID and CVE
#
# Copyright:
# Copyright (C) 2001 Digital Defense Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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
  script_oid("1.3.6.1.4.1.25623.1.0.10819");
  script_version("$Revision: 6040 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-27 11:02:38 +0200 (Thu, 27 Apr 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_bugtraq_id(691);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_cve_id("CVE-1999-0158");
  script_name("PIX Firewall Manager Directory Traversal");
  script_category(ACT_ATTACK);
  script_copyright("This script is Copyright (C) 2001 Digital Defense Inc.");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 8181);
  script_exclude_keys("Settings/disable_cgi_scanning");

  tag_summary = "It is possible to read arbitrary files on the remote host
  through the remote web server.";

  tag_insight = "It is possible to read arbitrary files on this machine by using
  relative paths in the URL.

  This vulnerability has been assigned Cisco Bug ID: CSCdk39378.";

  tag_impact = "This flaw can be used to bypass the
  management software's password protection and possibly retrieve
  the enable password for the Cisco PIX.";

  tag_solution = "Cisco originally recommended upgrading to version 4.1.6b or version
  4.2, however the same vulnerability has been found in version 4.3.
  Cisco now recommends that you disable the software completely and
  migrate to the new PIX Device Manager software.";

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"insight", value:tag_insight);

  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:8181 );

url = "/..\\pixfir~1\\how_to_login.html";

req = http_get( item:url, port:port );
res = http_keepalive_send_recv( port:port, data:req );

if( res && "How to login" >< res ) {
  report = report_vuln_url( port:port, url:url );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
