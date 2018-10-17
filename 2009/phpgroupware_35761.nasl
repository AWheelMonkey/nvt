###############################################################################
# OpenVAS Vulnerability Test
# $Id: phpgroupware_35761.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# phpGroupWare Multiple Input Validation Vulnerabilities
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

tag_summary = "phpGroupWare is prone to multiple input-validation vulnerabilities
because it fails to sufficiently sanitize user-supplied data.

Exploiting these issues could allow an attacker to disclose sensitive
information, steal cookie-based authentication credentials, compromise
the application, access or modify data, or exploit latent
vulnerabilities in the underlying database.

phpGroupWare 0.9.16.12 is affected; other versions may also be
vulnerable.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100237");
 script_version("$Revision: 9350 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2009-07-22 19:53:45 +0200 (Wed, 22 Jul 2009)");
 script_cve_id("CVE-2009-4414");
 script_bugtraq_id(35761);
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");

 script_name("phpGroupWare Multiple Input Validation Vulnerabilities");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/35761");
 script_xref(name : "URL" , value : "http://www.phpgroupware.org/");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("phpgroupware_detect.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

port = get_http_port(default:80);
if(!get_port_state(port))exit(0);

if (!can_host_php(port:port)) exit(0);

if(!version = get_kb_item(string("www/", port, "/phpGroupWare")))exit(0);
if(!matches = eregmatch(string:version, pattern:"^(.+) under (/.*)$"))exit(0);

vers = matches[1];

if(!isnull(vers) && vers >!< "unknown") {

  if(version_is_equal(version: vers, test_version: "0.9.16.12")) {
      security_message(port:port);
      exit(0);
  }

}

exit(0);
