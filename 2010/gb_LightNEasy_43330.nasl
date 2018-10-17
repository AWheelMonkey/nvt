###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_LightNEasy_43330.nasl 8510 2018-01-24 07:57:42Z teissa $
#
# LightNEasy 'LightNEasy.php' SQL Injection Vulnerability
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

tag_summary = "LightNEasy is prone to an SQL-injection vulnerability because it
fails to sufficiently sanitize user-supplied data before using it in
an SQL query.

Exploiting this issue could allow an attacker to compromise the
application, access or modify data, or exploit latent vulnerabilities
in the underlying database.

LightNEasy 3.2.1 is vulnerable; other versions may also be affected.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100817");
 script_version("$Revision: 8510 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-24 08:57:42 +0100 (Wed, 24 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-09-21 16:24:40 +0200 (Tue, 21 Sep 2010)");
 script_bugtraq_id(43330);
 script_cve_id("CVE-2010-3485", "CVE-2010-3484");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

 script_name("LightNEasy 'LightNEasy.php' SQL Injection Vulnerability");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/43330");
 script_xref(name : "URL" , value : "http://www.lightneasy.org/downloads.php");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("secpod_lightneasy_detect.nasl");
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

if(vers = get_version_from_kb(port:port,app:string("LightNEasy/Sqlite"))) {
  if(version_is_equal(version: vers, test_version: "3.2.1")) {
      security_message(port:port);
      exit(0);
  }
}

exit(0);
