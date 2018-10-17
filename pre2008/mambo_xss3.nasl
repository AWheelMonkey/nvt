# OpenVAS Vulnerability Test
# $Id: mambo_xss3.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: Mambo Site Server index.php mos_change_template XSS
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
# Updated: 04/07/2009 Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2005 David Maciejak
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

tag_summary = "An attacker may use the installed version of Mambo Site Server to
  perform a cross site scripting attack on this host.";

tag_solution = "Upgrade at least to version 4.5 1.0.4";

#  Ref: JeiAr   - GulfTech Security Research Team

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.16316");
  script_version("$Revision: 9348 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_cve_id("CVE-2004-1825");
  script_bugtraq_id(9890);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("Mambo Site Server index.php mos_change_template XSS");

  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2005 David Maciejak");
  script_dependencies("mambo_detect.nasl", "cross_site_scripting.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if(!get_port_state(port)){
  exit(0);
}


mambVer= get_kb_item(string("www/", port, "/mambo_mos"));
if(!mambVer){
  exit(0);
}

matches = eregmatch(string:mambVer, pattern:"^(.+) under (/.*)$");
if(!matches){
  exit(0);
}

dir = matches[2];
url = string(dir, "/index.php?mos_change_template=<script>foo</script>");
req = http_get(item:url, port:port);
resp = http_keepalive_send_recv(port:port, data:req);
if(!resp){
  exit(0);
}

if(resp =~ "HTTP/1\.. 200" && '<form action="/index.php?mos_change_template=<script>foo</script>' >< resp)
   security_message(port);
