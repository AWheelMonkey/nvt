###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_42306.nasl 8374 2018-01-11 10:55:51Z cfischer $
#
# OpenSSL 'ssl3_get_key_exchange()' Use-After-Free Memory Corruption Vulnerability
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

tag_summary = "OpenSSL is prone to a remote memory-corruption vulnerability.

According to its banner, OpenVAS has discovered that the remote
Webserver is using version 1.0.0a of OpenSSL which is vulnerable.

Successfully exploiting this issue may allow an attacker to execute
arbitrary code in the context of the application using the vulnerable
library. Failed exploit attempts will result in a denial-of-service
condition.

The issue affects OpenSSL 1.0.0a; other versions may also be affected.";

CPE = "cpe:/a:openssl:openssl";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100751");
 script_version("$Revision: 8374 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-11 11:55:51 +0100 (Thu, 11 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-08-10 14:55:08 +0200 (Tue, 10 Aug 2010)");
 script_bugtraq_id(42306);
 script_cve_id("CVE-2010-2939");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");

 script_name("OpenSSL 'ssl3_get_key_exchange()' Use-After-Free Memory Corruption Vulnerability");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/42306");
 script_xref(name : "URL" , value : "http://www.openssl.org");
 script_xref(name : "URL" , value : "http://seclists.org/fulldisclosure/2010/Aug/84");

 script_tag(name:"solution_type", value: "VendorFix");
 script_tag(name:"qod_type", value:"remote_banner_unreliable");

 script_category(ACT_GATHER_INFO);
 script_family("General");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("gb_openssl_detect.nasl");
 script_mandatory_keys("OpenSSL/installed");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);

}

include("version_func.inc");
include("host_details.inc");

if( ! vers = get_app_version( cpe:CPE ) ) exit(0);

vers = ereg_replace(string:vers, pattern:"([a-z]$)", replace:".\1");

if(!isnull(vers)) {

  if(version_is_equal(version: vers, test_version: "1.0.0.a")) {
      security_message(port:0);
      exit(0);
  }

}

exit(0);
