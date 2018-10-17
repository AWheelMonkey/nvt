# OpenVAS Vulnerability Test
# $Id: msmmask.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: msmmask.exe
#
# Authors:
# Michel Arboi <arboi@alussinan.org>
#
# Copyright:
# Copyright (C) 2002 Michel Arboi
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

tag_summary = "The msmmask.exe CGI is installed.
Some versions allow an attacker to read the source of any
file in your webserver's directories by using the 'mask'
parameter.";

tag_solution = "Upgrade your MondoSearch to version 4.4.5156 or later.";

# Affected: MondoSearch 4.4.5147 and below.
#           MondoSearch 4.4.5156 and above are NOT vulnerable.
#
# References:
#
# Message-ID: <20021010180935.14148.qmail@mail.securityfocus.com>
# From:"thefastkid" <thefastkid@ziplip.com>
# To:bugtraq@securityfocus.com
# Subject: MondoSearch show the source of all files

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.11163");
 script_version("$Revision: 9348 $");
 script_cve_id("CVE-2002-1528");
 script_bugtraq_id(5941);
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
 script_name("msmmask.exe");
 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_active");
 script_copyright("This script is Copyright (C) 2002 Michel Arboi");
 script_family("Web application abuses");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if (! can_host_asp(port:port) ) exit(0);

foreach dir( make_list_unique( "/", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  p = string(dir, "/MsmMask.exe");
  q = string(p, "?mask=/openvas", rand(), ".asp");
  r = http_get(port: port, item: q);
  c = http_keepalive_send_recv(port:port, data:r);
  if (egrep(pattern: "Failed to read the maskfile .*openvas.*\.asp", string: c, icase: TRUE)) {
    security_message(port);
    exit(0);
  }

  # Version at or below 4.4.5147
  if (egrep(pattern: "MondoSearch for Web Sites (([0-3]\.)|(4\.[0-3]\.)|(4\.4\.[0-4])|(4\.4\.50)|(4\.4\.51[0-3])|(4\.4\.514[0-7]))", string: c)) {
    security_message(port);
    exit(0);
  }
}
