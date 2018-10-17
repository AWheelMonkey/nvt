# OpenVAS Vulnerability Test
# $Id: cgi_rb.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: cgi.rb
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
#
# Copyright:
# Copyright (C) 2004 David Maciejak
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

tag_summary = "The 'cgi.rb' CGI is installed. Some versions is vulnerable to
remote denial of service.

By sending a specially crafted HTTP POST request, a malicious user can force
the remote host to consume a large amount of CPU ressources.

*** Warning : OpenVAS solely relied on the presence of this CGI, it did not
*** determine if you specific version is vulnerable to that problem";

tag_solution = "Verify that your version is at least 1.8.1 or later";

#  Ref: Debian security team

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.15710");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_cve_id("CVE-2004-0983");
 script_bugtraq_id(11618);
 
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
 script_tag(name:"qod_type", value:"remote_banner_unreliable");
 name = "cgi.rb";
 script_name(name);
 

 
 
 script_category(ACT_GATHER_INFO);
 
 
 script_copyright("This script is Copyright (C) 2004 David Maciejak");
 family = "Web application abuses";
 script_family(family);
 script_dependencies("http_version.nasl");
 script_require_ports("Services/www", 80);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

# The script code starts here
include("http_func.inc");
include("http_keepalive.inc");
include("global_settings.inc");

port = get_http_port(default:80);

res = is_cgi_installed_ka(item:"cgi.rb", port:port);
if(res)security_message(port);
