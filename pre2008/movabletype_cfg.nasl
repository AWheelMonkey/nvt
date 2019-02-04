# OpenVAS Vulnerability Test
# $Id: movabletype_cfg.nasl 12861 2018-12-21 09:53:04Z ckuersteiner $
# Description: Movable Type config file
#
# Authors:
# Rich Walchuck (rich.walchuck at gmail.com)
#
# Copyright:
# Copyright (C) 2004 Rich Walchuck
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

CPE = "cpe:/a:sixapart:movable_type";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.16170");
  script_version("$Revision: 12861 $");
  script_tag(name:"last_modification", value:"$Date: 2018-12-21 10:53:04 +0100 (Fri, 21 Dec 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"solution_type", value:"Mitigation");

  script_name("Movable Type config file");

  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2004 Rich Walchuck");
  script_family("Web application abuses");
  script_require_ports("Services/www", 80);
  script_dependencies("mt_detect.nasl");
  script_mandatory_keys("movabletype/detected");

  script_tag(name:"solution", value:"Configure your web server not to serve .cfg files.");

  script_tag(name:"summary", value:"/mt/mt.cfg is installed by the Movable Type Publishing
Platform and contains information that should not be exposed.");

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

url = dir + "/mt/mt.cfg";

if(is_cgi_installed_ka(item:url,port:port)) {
  report = report_vuln_url(port: port, url: url);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
