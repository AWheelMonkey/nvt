###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_eDirectory_DHost_web_server_detect.nasl 11997 2018-10-20 11:59:41Z mmartin $
#
# eDirectory DHost Web Server Detection
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103125");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 11997 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-20 13:59:41 +0200 (Sat, 20 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-03-23 13:28:27 +0100 (Wed, 23 Mar 2011)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("eDirectory DHost Web Server Detection");
  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_family("Service detection");
  script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
  script_dependencies("gb_get_http_banner.nasl");
  script_require_ports("Services/www", 8028, 8030);
  script_mandatory_keys("DHost/banner");

  script_tag(name:"summary", value:"The eDirectory DHost web server is running at this port.");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("global_settings.inc");

port = get_http_port(default:8028);

banner = get_http_banner(port:port);
if(banner !~ "Server: DHost/[0-9.]+ HttpStk")exit(0);

url = string("/");
req = http_get(item:url, port:port);
buf = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);
if( buf == NULL )exit(0);

if("DHost Console" >< buf && "DS Trace" >< buf && "NDS iMonitor" >< buf) {

  set_kb_item(name: string("www/", port, "/eDirectory_DHost"), value: TRUE);

  if(report_verbosity > 0) {
    log_message(port:port);
  }
}

exit(0);
