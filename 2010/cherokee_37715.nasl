###############################################################################
# OpenVAS Vulnerability Test
# $Id: cherokee_37715.nasl 8207 2017-12-21 07:30:12Z teissa $
#
# Cherokee Terminal Escape Sequence in Logs Command Injection Vulnerability
#
# Authors:
# Michael Meyer
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

tag_summary = "Cherokee is prone to a command-injection vulnerability because it
fails to adequately sanitize user-supplied input in logfiles.

Attackers can exploit this issue to execute arbitrary commands in
a terminal.

Cherokee 0.99.30 and prior are vulnerable.";


tag_solution = "Updates are available. Please see the references for details.";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100440");
 script_version("$Revision: 8207 $");
 script_tag(name:"last_modification", value:"$Date: 2017-12-21 08:30:12 +0100 (Thu, 21 Dec 2017) $");
 script_tag(name:"creation_date", value:"2010-01-13 11:20:27 +0100 (Wed, 13 Jan 2010)");
 script_bugtraq_id(37715);
 script_cve_id("CVE-2009-4489");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

 script_name("Cherokee Terminal Escape Sequence in Logs Command Injection Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/37715");
 script_xref(name : "URL" , value : "http://www.alobbs.com/modules.php?op=modload&name=cherokee&file=index");
 script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/508830");

 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
 script_family("Web Servers");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("gb_get_http_banner.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("Cherokee/banner");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}


include("http_func.inc");
include("version_func.inc");

port = get_http_port(default:80);
if(!get_port_state(port))exit(0);

banner = get_http_banner(port: port);
if(!banner)exit(0);

if("Cherokee" >< banner) {

   if(!version = eregmatch(pattern:"Server: Cherokee/([0-9.]+)", string:banner))exit(0);
   vers = version[1];

   if(!isnull(vers)) {
     if(version_is_less_equal(version: vers, test_version:"0.99.30"))  {
          security_message(port:port);
          exit(0);
     }
   }
 }

exit(0);     
