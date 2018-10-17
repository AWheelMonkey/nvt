###############################################################################
# OpenVAS Vulnerability Test
# $Id: nginx_37711.nasl 8447 2018-01-17 16:12:19Z teissa $
#
# nginx Terminal Escape Sequence in Logs Command Injection Vulnerability
#
# Authors:
# Michael Meyer
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

tag_summary = "The 'nginx' program is prone to a command-injection vulnerability
because it fails to adequately sanitize user-supplied input in
log files.

Attackers can exploit this issue to execute arbitrary commands in
a terminal.

This issue affects nginx 0.7.64; other versions may also be affected.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100441");
 script_version("$Revision: 8447 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-17 17:12:19 +0100 (Wed, 17 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-01-13 11:20:27 +0100 (Wed, 13 Jan 2010)");
 script_bugtraq_id(37711);
 script_cve_id("CVE-2009-4487");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

script_name("nginx Terminal Escape Sequence in Logs Command Injection Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/37711");
 script_xref(name : "URL" , value : "http://nginx.net/");
 script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/508830");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web Servers");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("nginx_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("nginx/installed");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("version_func.inc");

port = get_http_port(default:80);
if(!get_port_state(port))exit(0);

if(!vers = get_kb_item(string("nginx/", port, "/version")))exit(0);

if(!isnull(vers) && vers >!< "unknown") {
  if(version_is_equal(version: vers, test_version:"0.7.64")) {
      security_message(port:port);
      exit(0);
  }
}

exit(0);     
