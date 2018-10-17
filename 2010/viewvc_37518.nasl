###############################################################################
# OpenVAS Vulnerability Test
# $Id: viewvc_37518.nasl 8187 2017-12-20 07:30:09Z teissa $
#
# ViewVC Versions Prior to 1.1.3 Multiple Remote Vulnerabilities
#
# Authors:
# Michael Meyer
#
# Updated the CVE.
#  - Rachana Shetty <srachana@secpod.com> on 2010-02-03 #7067
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

tag_summary = "ViewVC is prone to these security vulnerabilities:

- A security vulnerability that involves root listing of per-root
  authorization configuration.
- A security vulnerability in 'query.py' involving the 'forbidden'
  authorizer (or none).

Versions prior to ViewVC 1.1.3 are vulnerable.";

tag_solution = "Vendor updates are available. Please see the references for details.";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100414");
 script_version("$Revision: 8187 $");
 script_tag(name:"last_modification", value:"$Date: 2017-12-20 08:30:09 +0100 (Wed, 20 Dec 2017) $");
 script_tag(name:"creation_date", value:"2010-01-04 18:09:12 +0100 (Mon, 04 Jan 2010)");
 script_cve_id("CVE-2010-0004", "CVE-2010-0005");
 script_bugtraq_id(37518);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 

 script_name("ViewVC Versions Prior to 1.1.3 Multiple Remote Vulnerabilities");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/37518");
 script_xref(name : "URL" , value : "http://viewvc.tigris.org/source/browse/viewvc/trunk/CHANGES?rev=HEAD");
 script_xref(name : "URL" , value : "http://viewvc.tigris.org/");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("viewvc_detect.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

port = get_http_port(default:80);
if(!get_port_state(port))exit(0);

if(!version = get_kb_item(string("www/", port, "/viewvc")))exit(0);
if(!matches = eregmatch(string:version, pattern:"^(.+) under (/.*)$"))exit(0);

vers = matches[1];

if(!isnull(vers) && vers >!< "unknown") {

  if(version_is_less(version: vers, test_version: "1.1.3")) {
      security_message(port:port);
      exit(0);
  }

}

exit(0);
