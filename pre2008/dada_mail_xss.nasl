# OpenVAS Vulnerability Test
# $Id: dada_mail_xss.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: XSS vulnerability in Dada Mail
#
# Authors:
# Josh Zlatin-Amishav <josh at ramat dot cc>
#
# Copyright:
# Copyright (C) 2005 Josh Zlatin-Amishav
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

tag_summary = "The remote host is running Dada Mail, a free, e-mail list management
system written in Perl. 

According to its banner, the remote version of this software does not
properly validate user written content before submitting that data to
the archiving system.  A malicious user could embed arbitrary
javascript in archived messages to later be executed in a user's
browser within the context of the affected web site.";

tag_solution = "Upgrade to version 2.10 alpha 1 or higher.";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.19679");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2006-03-26 17:55:15 +0200 (Sun, 26 Mar 2006)");
 script_cve_id("CVE-2005-2595");
 script_bugtraq_id(14573);
 script_xref(name:"OSVDB", value:"18772");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
 script_name("XSS vulnerability in Dada Mail");
 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_banner");
 script_family("Web application abuses");
 script_copyright("Copyright (C) 2005 Josh Zlatin-Amishav");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://sourceforge.net/project/shownotes.php?release_id=349531");
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

foreach dir( make_list_unique( "/cgi-bin/dada", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = string(dir, "/mail.cgi");
  req = http_get( item:url, port:port );
  res = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);

  # versions 2.9.x are vulnerable
  if(egrep(pattern:"Powered by.*Dada Mail 2\.9", string:res)) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );