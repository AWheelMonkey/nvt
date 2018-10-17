###############################################################################
# OpenVAS Vulnerability Test
# $Id: savant_12429.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Savant Web Server Remote Buffer Overflow Vulnerability
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

tag_summary = "A remote buffer-overflow vulnerability affects Savant Web Server. This
issue occurs because the application fails to validate the length of
user-supplied strings before copying them into finite process buffers.

A remote attacker may leverage this issue to execute arbitrary code
with the privileges of the affected webserver. This issue may
facilitate unauthorized access or privilege escalation.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100394");
 script_version("$Revision: 9350 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2009-12-15 19:11:56 +0100 (Tue, 15 Dec 2009)");
 script_bugtraq_id(12429);
 script_cve_id("CVE-2005-0338");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

 script_name("Savant Web Server Remote Buffer Overflow Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/12429");
 script_xref(name : "URL" , value : "http://savant.sourceforge.net/index.html");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web Servers");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("gb_get_http_banner.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("Savant/banner");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("version_func.inc");

port = get_http_port(default:80);
if(!get_port_state(port))exit(0);

banner = get_http_banner(port: port);
if(!banner)exit(0);

if("Server: Savant/" >< banner)
 {
   version = eregmatch(pattern: "Savant/([0-9.]+)", string: banner);
   if(isnull(version[1]))exit(0);
   if(version_is_equal(version: version[1], test_version: "3.1")) {
        security_message(port:port);
        exit(0); 
   }
 }

exit(0);
