# OpenVAS Vulnerability Test
# $Id: discuz_arbitrary_file_upload_flaw.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: Discuz! <= 4.0.0 rc4 Arbitrary File Upload Flaw
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
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

tag_summary = "The remote host is using Discuz!, a popular web application forum in
China. 

According to its version, the installation of Discuz! on the remote host
fails to properly check for multiple extensions in uploaded files.  An
attacker may be able to exploit this issue to execute arbitrary commands
on the remote host subject to the privileges of the web server user id,
typically nobody.";

tag_solution = "Upgrade to the latest version of this software.";

#  Ref: Jeremy Bae at STG Security

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.19751");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2006-03-26 17:55:15 +0200 (Sun, 26 Mar 2006)");
 script_cve_id("CVE-2005-2614");
 script_bugtraq_id(14564);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("Discuz! <= 4.0.0 rc4 Arbitrary File Upload Flaw");
 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_banner");
 script_copyright("This script is Copyright (C) 2005 David Maciejak");
 script_family("Gain a shell remotely");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://archives.neohapsis.com/archives/fulldisclosure/2005-08/0440.html");
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if ( ! can_host_php(port:port) ) exit(0);

foreach dir( make_list_unique( "/discuz", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = string(dir, "/index.php");
  r = http_get_cache(item:url, port:port);
  if( r == NULL ) continue;
  if (("powered by Discuz!</title>" >< r) && egrep(pattern:'<meta name="description" content=.+Powered by Discuz! Board ([1-3]|4\\.0\\.0RC[0-4])', string:r)) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );