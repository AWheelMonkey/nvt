# OpenVAS Vulnerability Test
# $Id: servletExec_Path_Disclosure.nasl 6063 2017-05-03 09:03:05Z teissa $
# Description: ServletExec 4.1 ISAPI Physical Path Disclosure
#
# Authors:
# Matt Moore <matt.moore@westpoint.ltd.uk>
# Script audit and contributions from Carmichael Security <http://www.carmichaelsecurity.com>
# Erik Anderson <eanders@carmichaelsecurity.com>
# Added BugtraqID and CAN
#
# Copyright:
# Copyright (C) 2002 Matt Moore
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

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.10960");
 script_version("$Revision: 6063 $");
 script_tag(name:"last_modification", value:"$Date: 2017-05-03 11:03:05 +0200 (Wed, 03 May 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(4793);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
 script_cve_id("CVE-2002-0892");
 script_name("ServletExec 4.1 ISAPI Physical Path Disclosure");
 script_category(ACT_GATHER_INFO);
 script_copyright("This script is Copyright (C) 2002 Matt Moore");
 script_family("Web application abuses");
 script_dependencies("http_version.nasl");
 script_require_ports("Services/www", 80);

 script_tag(name : "solution" , value : "Use the main ServletExec Admin UI to set a global error page for the entire 
 ServletExec Virtual Server.");
 script_tag(name : "summary" , value : "By requesting a non-existent .JSP file, or by invoking the JSPServlet 
 directly and supplying no filename, it is possible to make the ServletExec 
 ISAPI filter disclose the physical path of the webroot.");

 script_xref(name : "URL" , value : "www.westpoint.ltd.uk/advisories/wp-02-0006.txt");

 script_tag(name:"solution_type", value:"Workaround");
 script_tag(name:"qod_type", value:"remote_vul");

 exit(0);
}

# Check starts here

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

req = http_get(item:"/servlet/com.newatlanta.servletexec.JSP10Servlet", port:port);
r = http_keepalive_send_recv(port:port, data:req);
confirmed = "newatlanta";
confirmedtoo = "Error. The file was not found. (filename = ";
if ((confirmed >< r) && (confirmedtoo ><r)) {
  security_message(port:port);
  exit(0);
}

exit(99);
