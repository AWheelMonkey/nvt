###############################################################################
# OpenVAS Vulnerability Test
# $Id: oscommerce_34348.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# osCommerce 'oscid' Session Fixation Vulnerability
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

tag_summary = "osCommerce is prone to a session-fixation vulnerability.

  Attackers can exploit this issue to hijack a user's session and gain
  unauthorized access to the affected application.

  The following are vulnerable:

  osCommerce 2.2
  osCommerce 3.0 Beta

  Other versions may also be affected.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100099");
 script_version("$Revision: 9350 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2009-04-05 13:52:05 +0200 (Sun, 05 Apr 2009)");
 script_bugtraq_id(34348);
 script_tag(name:"cvss_base", value:"8.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:P/A:P");
 script_name("osCommerce 'oscid' Session Fixation Vulnerability");
 script_tag(name:"qod_type", value:"remote_analysis");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("oscommerce_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("Software/osCommerce");

 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/34348");
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

CPE = 'cpe:/a:oscommerce:oscommerce';

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! dir = get_app_location( cpe:CPE, port:port ) ) exit( 0 );

url = string(dir, "/index.php?osCsid=a815a815a815a815");
req = http_get(item:url, port:port);
buf = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);
if( buf == NULL )exit(0);

if(egrep(pattern:"[a-zA-Z]+\.php\?osCsid=a815a815a815a815", string: buf) && !egrep(pattern:"Set-Cookie: osCsid=[a-zA-Z0-9]+" , string: buf) )
{
  security_message(port:port);
  exit(0);
}

exit(0);
