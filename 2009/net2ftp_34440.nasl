###############################################################################
# OpenVAS Vulnerability Test
# $Id: net2ftp_34440.nasl 13235 2019-01-23 10:05:41Z ckuersteiner $
#
# net2ftp Multiple Cross-Site Scripting Vulnerabilities
#
# Authors
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

CPE = "cpe:/a:net2ftp:net2ftp";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100126");
  script_version("$Revision: 13235 $");
  script_bugtraq_id(34440);
  script_tag(name:"cvss_base", value:"2.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-01-23 11:05:41 +0100 (Wed, 23 Jan 2019) $");
  script_tag(name:"creation_date", value:"2009-04-12 20:09:50 +0200 (Sun, 12 Apr 2009)");

  script_name("net2ftp Multiple Cross-Site Scripting Vulnerabilities");

  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("net2ftp_detect.nasl");
  script_mandatory_keys("net2ftp/detected");
  script_require_ports("Services/www", 80);

  script_tag(name:"summary", value:"The net2ftp program is prone to multiple cross-site scripting
  vulnerabilities because it fails to properly sanitize user-supplied input.

  An attacker can exploit these issues to execute arbitrary script
  code in the browser of an unsuspecting user in the context of the
  affected site. This may help the attacker steal cookie-based
  authentication credentials and launch other attacks.

  These issues affect net2ftp 0.98 and earlier.");

  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/49791");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/34440");

  script_tag(name:"solution_type", value:"WillNotFix");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the
  disclosure of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade
  to a newer release, disable respective features, remove the product or replace the product by another one.");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!dir = get_app_location(cpe: CPE, port: port))
  exit(0);

if (dir == "/")
  dir = "";

url = dir + '/index.php?state=login_small&errormessage=<script>alert(document.cookie)</script>';
req = http_get(item:url, port:port);
buf = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);
if( buf == NULL )continue;
if(buf =~ "HTTP/1\.. 200" && egrep(pattern:"<script>alert\(document\.cookie\)</script>", string: buf)) {
  report = report_vuln_url(port: port, url: url);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
