# OpenVAS Vulnerability Test
# $Id: gemitel_file_inclusion.nasl 6046 2017-04-28 09:02:54Z teissa $
# Description: File Inclusion Vulnerability in Gemitel
#
# Authors:
# Noam Rathaus
#
# Copyright:
# Copyright (C) 2004 Noam Rathaus
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

# From: jaguar <webmaster@wulab.com>
# Subject: Include vulnerability in GEMITEL v 3.50
# Date: 2004-04-15 16:26

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.12214");
  script_version("$Revision: 6046 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-28 11:02:54 +0200 (Fri, 28 Apr 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_cve_id("CVE-2004-1934");
  script_bugtraq_id(10156);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("File Inclusion Vulnerability in Gemitel");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2004 Noam Rathaus");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name : "solution" , value : "Upgrade to the latest version or disable this CGI altogether");
  script_tag(name : "summary" , value : "A vulnerability in Gimtel allows a remote attacker to execute
  arbitrary commands on this host.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_app");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if (! can_host_php(port:port) ) exit(0);

function check_dir(path)
{

 if(path == "/") path = "";

 req = http_get(item:string(path, "/html/affich.php?base=http://xxx.xxxxxx./"), port:port);
 res = http_keepalive_send_recv(port:port, data:req);
 if ( res == NULL ) exit(0);
 if (egrep(pattern:"http://xxx\.xxxxxx\./sp-turn\.php", string:res) )
 {
  security_message(port:port);
  exit(0);
 }
}

foreach dir (make_list_unique("/gimtel", cgi_dirs(port:port))) check_dir(path:dir);

exit(99);