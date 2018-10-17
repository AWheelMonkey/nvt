###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_galilery_46506.nasl 4484 2016-11-12 14:03:28Z cfi $
#
# Galilery 'index.php' Local File Include Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.103094");
  script_version("$Revision: 4484 $");
  script_tag(name:"last_modification", value:"$Date: 2016-11-12 15:03:28 +0100 (Sat, 12 Nov 2016) $");
  script_tag(name:"creation_date", value:"2011-02-28 14:46:59 +0100 (Mon, 28 Feb 2011)");
  script_tag(name:"cvss_base", value:"5.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:P");
  script_bugtraq_id(46506);
  script_name("Galilery 'index.php' Local File Include Vulnerability");
  script_category(ACT_ATTACK);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"https://www.securityfocus.com/bid/46506");
  script_xref(name:"URL", value:"http://sourceforge.net/projects/galilery/");

  tag_summary = "Galilery is prone to a local file-include vulnerability because it
  fails to properly sanitize user-supplied input.";

  tag_impact = "An attacker can exploit this vulnerability to obtain potentially
  sensitive information and to execute arbitrary local scripts in the context of
  the webserver process. This may allow the attacker to compromise the application
  and the computer; other attacks are also possible.";

  tag_affected = "Galilery 1.0 is vulnerable; other versions may also be affected.";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);

  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/galilery", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";

  url = string( dir, "/index.php?pg=1&d=", crap( data:"../", length:6*9 ) );

  if( http_vuln_check( port:port, url:url, pattern:"proc", extra_check:make_list( "bin", "sbin", "etc" ), check_header:TRUE ) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
