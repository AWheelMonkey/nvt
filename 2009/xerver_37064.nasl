###############################################################################
# OpenVAS Vulnerability Test
# $Id: xerver_37064.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Xerver HTTP Response Splitting Vulnerability
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

tag_summary = "Xerver is prone to an HTTP response-splitting vulnerability because it
fails to sufficiently sanitize user-supplied data.

Attackers can leverage this issue to influence or misrepresent how web
content is served, cached, or interpreted. This could aid in various
attacks that try to entice client users into a false sense of trust.

The issue affects Xerver 4.31 and 4.32; other versions may also
be affected.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100355");
 script_version("$Revision: 9350 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2009-11-20 12:35:38 +0100 (Fri, 20 Nov 2009)");
 script_cve_id("CVE-2009-4086");
 script_bugtraq_id(37064);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");

 script_name("Xerver HTTP Response Splitting Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/37064");
 script_xref(name : "URL" , value : "http://www.javascript.nu/xerver/");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web Servers");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("gb_xerver_http_server_detect.nasl");
 script_require_ports("Services/www", 80);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

     
include("http_func.inc");
include("version_func.inc");

port = get_http_port(default:80);
if(!get_port_state(port))exit(0);

if(!vers = get_kb_item(string("www/", port, "/Xerver")))exit(0);

if(!isnull(vers) && vers >!< "unknown") {

  if(version_is_equal(version: vers, test_version: "4.31") || 
     version_is_equal(version: vers, test_version: "4.32")) {
      security_message(port:port);
      exit(0);
  }

}

exit(0);
