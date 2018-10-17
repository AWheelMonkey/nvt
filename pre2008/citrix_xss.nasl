###############################################################################
# OpenVAS Vulnerability Test
# $Id: citrix_xss.nasl 10862 2018-08-09 14:51:58Z cfischer $
#
# Citrix NFuse_Application parameter XSS
#
# Authors:
# This script was written by David Maciejak <david dot maciejak at kyxar dot fr>
# based on work from
# (C) Tenable Network Security
# Ref: Eric Detoisien <eric.detoisien@global-secure.fr>.
#
# Copyright:
# Copyright (C) 2004 David Maciejak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.14626");
  script_version("$Revision: 10862 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-09 16:51:58 +0200 (Thu, 09 Aug 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_bugtraq_id(4372);
  script_cve_id("CVE-2002-0504");
  script_xref(name:"OSVDB", value:"9256");
  script_xref(name:"OSVDB", value:"9257");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Citrix NFuse_Application parameter XSS");
  script_category(ACT_ATTACK);
  script_copyright("This script is Copyright (C) 2004 David Maciejak");
  script_family("Web application abuses");
  script_dependencies("http_version.nasl", "cross_site_scripting.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer release,
  disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"summary", value:"The remote Citrix NFuse contains a flaw that allows a remote cross site
  scripting attack.");
  script_tag(name:"impact", value:"With a specially crafted request, an attacker can cause arbitrary code
  execution resulting in a loss of integrity.");

  script_tag(name:"qod_type", value:"remote_vul");
  script_tag(name:"solution_type", value:"WillNotFix");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );
if ( ! can_host_asp( port:port ) ) exit( 0 );

host = http_host_name( dont_add_port:TRUE );
if( get_http_has_generic_xss( port:port, host:host ) ) exit( 0 );

foreach script( make_list( "/launch.jsp", "/launch.asp" ) ) {

  url = string( script, "?NFuse_Application=>alert(document.cookie);</script>" );

  if( http_vuln_check( port:port, url:url, check_header:TRUE, pattern:"alert\(document\.cookie\);</script>", check_nomatch:"400 - Bad Request" ) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
