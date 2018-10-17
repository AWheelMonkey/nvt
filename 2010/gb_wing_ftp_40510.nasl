###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wing_ftp_40510.nasl 8457 2018-01-18 07:58:32Z teissa $
#
# Wing FTP Server 'admin_loginok.html' HTML Injection Vulnerability
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

tag_summary = "Wing FTP Server is prone to an HTML-injection vulnerability because it
fails to sufficiently sanitize user-supplied data.

Attacker-supplied HTML or JavaScript code could run in the context of
the affected site, potentially allowing the attacker to steal cookie-
based authentication credentials and to control how the site is
rendered to the user; other attacks are also possible.

Wing FTP Server 3.5.0 is vulnerable; other versions may also be
affected.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100665");
 script_version("$Revision: 8457 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-18 08:58:32 +0100 (Thu, 18 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-06-03 13:39:07 +0200 (Thu, 03 Jun 2010)");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2010-2428");
 script_bugtraq_id(40510);

 script_name("Wing FTP Server 'admin_loginok.html' HTML Injection Vulnerability");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/40510");
 script_xref(name : "URL" , value : "http://www.wftpserver.com/");
 script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/511612");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("gb_get_http_banner.nasl");
 script_require_ports("Services/www", 5466);
 script_mandatory_keys("Wing_FTP_Server/banner");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

port = get_http_port(default:5466);
if(!get_port_state(port))exit(0);

banner = get_http_banner(port:port);
if(!banner || "Server: Wing FTP Server" >!< banner)exit(0);

version = eregmatch(pattern:"Wing FTP Server/([0-9.]+)", string:banner);
if(isnull(version[1]))exit(0);

if(version_is_equal(version: version[1], test_version: "3.5.0")) {
  security_message(port:port);
  exit(0);
}

exit(0);
