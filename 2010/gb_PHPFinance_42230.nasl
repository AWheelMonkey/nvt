###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_PHPFinance_42230.nasl 8447 2018-01-17 16:12:19Z teissa $
#
# PHPFinance 'group.php' SQL Injection and HTML Injection Vulnerabilities
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

tag_summary = "PHPFinance is prone to an SQL-injection vulnerability and an HTML-
injection vulnerability because it fails to sufficiently sanitize user-
supplied input.

An attacker may exploit the HTML-injection issue to execute arbitrary
script code in the browser of an unsuspecting user in the context of
the affected site. This may allow the attacker to steal cookie-based
authentication credentials, control how the site is displayed, and
launch other attacks.

The attacker may exploit the SQL-injection issue to compromise the
application, access or modify data, or exploit latent vulnerabilities
in the underlying database.

PHPFinance 0.6 is vulnerable; other versions may also be affected.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100771");
 script_version("$Revision: 8447 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-17 17:12:19 +0100 (Wed, 17 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-09-01 14:30:27 +0200 (Wed, 01 Sep 2010)");
 script_bugtraq_id(42230);
 script_tag(name:"cvss_base", value:"6.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");

 script_name("PHPFinance 'group.php' SQL Injection and HTML Injection Vulnerabilities");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/42230");
 script_xref(name : "URL" , value : "http://phpfinance.sourceforge.net/");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("gb_PHPFinance_detect.nasl");
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

if(vers = get_version_from_kb(port:port,app:"phpfinance")) {

  if(version_is_equal(version: vers, test_version: "0.6")) {
      security_message(port:port);
      exit(0);
  }

}

exit(0);
