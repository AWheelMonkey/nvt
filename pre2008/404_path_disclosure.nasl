###############################################################################
# OpenVAS Vulnerability Test
# $Id: 404_path_disclosure.nasl 9348 2018-04-06 07:01:19Z cfischer $
#
# Non-Existant Page Physical Path Disclosure Vulnerability
#
# Authors:
# Michel Arboi <arboi@alussinan.org>
#
# Copyright:
# Copyright (C) 2003 Michel Arboi
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

# Vulnerable servers:
# Pi3Web/2.0.0
#
# References
# Date:  10 Mar 2002 04:23:45 -0000
# From: "Tekno pHReak" <tek@superw00t.com>
# To: bugtraq@securityfocus.com
# Subject: Pi3Web/2.0.0 File-Disclosure/Path Disclosure vuln
#
# Date:	 Wed, 14 Aug 2002 23:40:55 +0400
# From:	"D4rkGr3y" <grey_1999@mail.ru>
# To:	bugtraq@securityfocus.com, vulnwatch@vulnwatch.org
# Subject: new bugs in MyWebServer

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.11714");
  script_version("$Revision: 9348 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_bugtraq_id(3341, 4035, 4261, 5054, 8075);
  # Note: the way the test is made will lead to detecting some
  # path disclosure issues which might be checked by other plugins 
  # (like #11226: Oracle9i jsp error). I have reviewed the reported
  # "path disclosure" errors from bugtraq and the following list
  # includes bugs which will be triggered by the NASL script. Some
  # other "path disclosure" bugs in webservers might not be triggered
  # since they might depend on some specific condition (execution
  # of a cgi, options..)
  # jfs - December 2003
  script_cve_id("CVE-2003-0456","CVE-2001-1372");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("Non-Existant Page Physical Path Disclosure Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2003 Michel Arboi");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  tag_summary = "Your web server reveals the physical path of the webroot 
  when asked for a non-existent page.

  Whilst printing errors to the output is useful for debugging applications,
  this feature should not be enabled on production servers.";

  tag_solution = "Upgrade your server or reconfigure it";

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

exts = make_list( ".", "/", ".html", ".htm", ".jsp", ".shtm", ".shtml", ".cfm" );
asp_exts = make_list( ".asp", ".aspx" );
php_exts = make_list( ".php", ".php3", ".php4", ".php5", ".php7" );

port = get_http_port( default:80 );

# Choose file to request based on what the remote host is supporting
if( can_host_asp( port:port ) && can_host_php( port:port ) ) {
  exts = make_list( exts, asp_exts, php_exts );
} else if( can_host_asp( port:port ) ) {
  exts = make_list( exts, asp_exts );
} else if( can_host_php( port:port ) ) {
  exts = make_list( exts, php_exts );
}

foreach ext( exts ) {

  file = "non-existant-" + rand();
  url = "/" + file + ext;
  req = http_get( item:url, port:port );
  res = http_keepalive_send_recv( port:port, data:req );
  if( isnull( res ) ) continue;

  # Windows-like path
  if( egrep( string:res, pattern:strcat("[C-H]:(\\[A-Za-z0-9_.-])*\\", file, "\\", ext ) ) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }

  # Unix like path
  if( egrep( string:res, pattern:strcat("(/[A-Za-z0-9_.+-])+/", file, "/", ext ) ) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );