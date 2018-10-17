###############################################################################
# OpenVAS Vulnerability Test
# $Id: GlassFish_34824.nasl 9941 2018-05-23 15:47:50Z emoss $
#
# GlassFish Enterprise Server Multiple Cross Site Scripting
# Vulnerabilities
#
# Authors
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

CPE = 'cpe:/a:oracle:glassfish_server';

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100191");
 script_version("$Revision: 9941 $");
 script_tag(name:"last_modification", value:"$Date: 2018-05-23 17:47:50 +0200 (Wed, 23 May 2018) $");
 script_tag(name:"creation_date", value:"2009-05-10 17:01:14 +0200 (Sun, 10 May 2009)");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
 script_cve_id("CVE-2009-1553");
 script_bugtraq_id(34824);

 script_tag(name: "solution_type", value: "VendorFix");

 script_name("GlassFish Enterprise Server Multiple Cross Site Scripting Vulnerabilities");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("GlassFish_detect.nasl");
 script_mandatory_keys("GlassFish/installed");
 script_require_ports("Services/www", 8080);

 script_tag(name: "solution", value: "Updates are available. Please see https://glassfish.dev.java.net/ and/or
http://www.sun.com/software/products/appsrvr/index.xml for more information.");

 script_tag(name: "summary", value: "GlassFish Enterprise Server is prone to multiple cross-site scripting
vulnerabilities because it fails to sufficiently sanitize user-supplied input.

Attacker-supplied HTML and script code would run in the context of the affected site, potentially allowing the
attacker to steal cookie-based authentication credentials.

GlassFish Enterprise Server 2.1 is vulnerable, other versions may also be affected.");

 script_xref(name: "URL", value: "http://www.securityfocus.com/bid/34824");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_equal(version: version, test_version: "2.1")) {
  security_message(port:port);
  exit(0);
}

exit(0);
