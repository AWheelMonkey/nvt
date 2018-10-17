###############################################################################
# OpenVAS Vulnerability Test
# $Id: atmail_34762.nasl 7928 2017-11-29 09:42:17Z ckuersteiner $
#
# Atmail 'admin.php' Cross-Site Scripting Vulnerabilities
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

CPE = "cpe:/a:atmail:atmail";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100238");
 script_version("$Revision: 7928 $");
 script_tag(name:"last_modification", value:"$Date: 2017-11-29 10:42:17 +0100 (Wed, 29 Nov 2017) $");
 script_tag(name:"creation_date", value:"2009-07-22 19:53:45 +0200 (Wed, 22 Jul 2009)");
 script_bugtraq_id(34762);
 script_cve_id("CVE-2009-2455");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

 script_name("Atmail 'admin.php' Cross-Site Scripting Vulnerabilities");

 script_xref(name: "URL", value: "http://www.securityfocus.com/bid/34762");
 script_xref(name: "URL", value: "http://www.atmail.com");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("atmail_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("Atmail/installed");

 script_tag(name: "summary", value: "AtMail is prone to multiple cross-site scripting vulnerabilities because
the application fails to properly sanitize user-supplied input.

An attacker may leverage these issues to execute arbitrary script code in the browser of an unsuspecting user
in the context of the affected site. This may help the attacker steal cookie-based authentication credentials
and launch other attacks.

The issues affect Atmail 5.61; other versions may also be affected.");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!port = get_app_port(cpe:CPE))exit(0);
if(!vers = get_app_version(cpe:CPE, port:port))exit(0);

if(version_is_less_equal(version: vers, test_version: "5.61")) {
  security_message(port:port);
  exit(0);
}

exit(99);
