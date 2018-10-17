###############################################################################
# OpenVAS Vulnerability Test
# $Id: reviewpost_sql.nasl 6053 2017-05-01 09:02:51Z teissa $
#
# SQL injection in ReviewPost PHP Pro
#
# Authors:
# Astharot <astharot@zone-h.org>
#
# Copyright:
# Copyright (C) 2004 Astharot
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

# Reference: http://www.zone-h.org/advisories/read/id=3864

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.12042");
  script_version("$Revision: 6053 $");
  script_tag(name:"last_modification", value:"$Date: 2017-05-01 11:02:51 +0200 (Mon, 01 May 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_cve_id("CVE-2004-2175");
  script_bugtraq_id(9574, 12159);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("SQL injection in ReviewPost PHP Pro");
  script_category(ACT_ATTACK);
  script_copyright("This script is Copyright (C) 2004 Astharot");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  tag_summary = "The remote host could be vulnerable to SQL Injection, because
  you are probably running ReviewPost PHP Pro, a web-based software
  that manage users opinions.

  There is a flaw in this software which may allow a malicious
  attacker to inject arbitrary SQL queries which allows it to
  fetch data from the database.";

  tag_solution = "Download the vendor supplied patch at
  http://www.photopost.com/members/forum/showthread.php?s=&threadid=98098";

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = dir + "/showproduct.php?product=1'";

  if( http_vuln_check( port:port, url:url, pattern:"id,user,userid,cat,date,title,description,manu,keywords,bigimage,bigimage2,bigimage3,views,approved,rating" ) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }

  url = dir + "/showcat.php?cat=1'";

  if( http_vuln_check( port:port, url:url, pattern:"id,catname FROM rp_categories" ) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );