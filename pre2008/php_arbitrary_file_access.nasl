# OpenVAS Vulnerability Test
# $Id: php_arbitrary_file_access.nasl 11751 2018-10-04 12:03:41Z jschulte $
# Description: PHP mylog.html/mlog.html read arbitrary file
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
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
#

# Ref: Bryan Berg on Sun Oct 19 1997.

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.15708");
  script_version("$Revision: 11751 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-04 14:03:41 +0200 (Thu, 04 Oct 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_bugtraq_id(713);
  script_cve_id("CVE-1999-0068");
  script_xref(name:"OSVDB", value:"3396");
  script_xref(name:"OSVDB", value:"3397");
  script_name("PHP mylog.html/mlog.html read arbitrary file");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("This script is Copyright (C) 2004 David Maciejak");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_tag(name:"summary", value:"The remote host is running PHP/FI.

  The remote version of this software contains a flaw in
  the files mylog.html/mlog.html than can allow a remote attacker
  to view arbitrary files on the remote host.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"solution", value:"Upgrade to version 3.0 or newer");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");

port = get_http_port(default:80);

files = traversal_files();

foreach dir( make_list_unique( "/php", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";

  foreach htmlfile( make_list( "/mylog.html", "/mlog.html" ) ) {

    foreach pattern( keys( files ) ) {

      file = files[pattern];

      url = dir + htmlfile + "?screen=/" + file;

      if(http_vuln_check(port:port, url:url,pattern:pattern)) {
        report = report_vuln_url( port:port, url:url );
        security_message( port:port, data:report );
        exit( 0 );
      }
    }
  }
}

exit( 99 );
