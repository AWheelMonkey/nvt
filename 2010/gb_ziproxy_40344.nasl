###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ziproxy_40344.nasl 8528 2018-01-25 07:57:36Z teissa $
#
# Ziproxy Image Parsing Multiple Integer Overflow Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

tag_summary = "Ziproxy is prone to multiple integer-overflow vulnerabilities because
it fails to properly validate user-supplied data.

Successful exploits may allow attackers to execute arbitrary code in
the context of the application. Failed exploit attempts will likely
result in denial-of-service conditions.

Ziproxy 3.0 is vulnerable; other versions may also be affected.";

tag_solution = "Updates are available. Please see the references for more information.";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100650");
 script_version("$Revision: 8528 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-25 08:57:36 +0100 (Thu, 25 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-05-25 13:42:13 +0200 (Tue, 25 May 2010)");
 script_bugtraq_id(40344);
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2010-1513");

 script_name("Ziproxy Image Parsing Multiple Integer Overflow Vulnerabilities");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/40344");
 script_xref(name : "URL" , value : "http://secunia.com/secunia_research/2010-75/");
 script_xref(name : "URL" , value : "http://ziproxy.sourceforge.net/");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Buffer overflow");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("secpod_ziproxy_server_detect.nasl");
 script_require_ports("Services/www", 8080);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("version_func.inc");

port = get_http_port(default:8080);
if(!get_port_state(port))exit(0);

if(!vers = get_kb_item(string("www/",port,"/Ziproxy")))exit(0);

if(version_is_equal(version: vers, test_version: "3.0")) {
    security_message(port:port);
    exit(0);
}

exit(0);
