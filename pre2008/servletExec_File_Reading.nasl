# OpenVAS Vulnerability Test
# $Id: servletExec_File_Reading.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: ServletExec 4.1 ISAPI File Reading
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

tag_summary = "By invoking the JSPServlet directly it is possible to read the contents of 
files within the webroot that would not normally be accessible (global.asa, 
for example.) When attempting to retrieve ASP pages it is common to see many 
errors due to their similarity to JSP pages in syntax, and hence only 
fragments of these pages are returned. Text files can generally be read 
without problem.";

tag_solution = "Download Patch #9 from ftp://ftp.newatlanta.com/public/4_1/patches/";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.10959");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(4795);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
 script_cve_id("CVE-2002-0893");
 name = "ServletExec 4.1 ISAPI File Reading";
 script_name(name);
 
 
 
 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_vul");
 
 script_copyright("This script is Copyright (C) 2002 Matt Moore");
 family = "Web application abuses";
 script_family(family);
 script_dependencies("find_service.nasl", "no404.nasl");
 script_require_ports("Services/www", 80);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "www.westpoint.ltd.uk/advisories/wp-02-0006.txt");
 exit(0);
}

# Check starts here

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

if(get_port_state(port))
{ 
# Uses global.asa as target to retrieve. Could be improved to use output of webmirror.nasl

 req = http_get(item:"/servlet/com.newatlanta.servletexec.JSP10Servlet/..%5c..%5cglobal.asa", port:port);
 r = http_keepalive_send_recv(port:port, data:req);
 if ( ! r ) exit(0);
 confirmed = string("OBJECT RUNAT=Server"); 
 if(confirmed >< r)	
 	security_message(port);
}

