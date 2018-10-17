###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_zope_42939.nasl 8440 2018-01-17 07:58:46Z teissa $
#
# Zope Unspecified Denial Of Service Vulnerability
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

tag_summary = "Zope is prone to an unspecified denial-of-service vulnerability.

An attacker can exploit this issue to cause the vulnerable application
to crash, denying service to legitimate users.

Versions prior to Zope 2.10.12 and Zope 2.11.7 are vulnerable.";

tag_solution = "Updates are available; please see the references for more information.";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100779");
 script_version("$Revision: 8440 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-17 08:58:46 +0100 (Wed, 17 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-09-03 15:15:12 +0200 (Fri, 03 Sep 2010)");
 script_bugtraq_id(42939);
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2010-3198");

 script_name("Zope Unspecified Denial Of Service Vulnerability");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/42939");
 script_xref(name : "URL" , value : "https://mail.zope.org/pipermail/zope-announce/2010-September/002247.html");
 script_xref(name : "URL" , value : "http://www.zope.org/");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Denial of Service");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("gb_get_http_banner.nasl");
 script_mandatory_keys("zope/banner");
 script_require_ports("Services/www", 8080);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("version_func.inc");

port = get_http_port(default:8080);
if(!get_port_state(port))exit(0);

banner = get_http_banner(port: port);
if(!banner)exit(0);
if("Server: Zope/" >!< banner)exit(0);

version = eregmatch(pattern: "Server: Zope/\(Zope ([0-9.]+)", string: banner);
if(isnull(version[1]))exit(0);

if(version_in_range(version: version[1], test_version: "2.11", test_version2: "2.11.6")  ||
   version_in_range(version: version[1], test_version: "2.10", test_version2: "2.10.11"))  {

    security_message(port:port);
    exit(0);

}

exit(0);

