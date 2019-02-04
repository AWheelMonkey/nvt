###############################################################################
# OpenVAS Vulnerability Test
# $Id: nanocms_detect.nasl 13235 2019-01-23 10:05:41Z ckuersteiner $
#
# NanoCMS Detection
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100140");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 13235 $");
  script_tag(name:"last_modification", value:"$Date: 2019-01-23 11:05:41 +0100 (Wed, 23 Jan 2019) $");
  script_tag(name:"creation_date", value:"2009-04-16 19:20:22 +0200 (Thu, 16 Apr 2009)");
  script_tag(name:"cvss_base", value:"0.0");

  script_name("NanoCMS Detection");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This host is running NanoCMS, a content management system.");

  script_xref(name:"URL", value:"http://nanocms.in");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

foreach dir( make_list_unique( "/cms", "/nanocms", cgi_dirs( port:port ) ) ) {
  install = dir;
  if ( dir == "/" ) dir = "";

  url = string(dir, "/data/nanoadmin.php");
  req = http_get(item:url, port:port);
  buf = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);
  if ( buf == NULL ) continue;

  if (egrep(pattern: 'NanoCMS Admin Login', string: buf, icase: TRUE)) {
    vers = "unknown";

    files = make_list("/gnu-license-mini.txt","/README%20FIRST.txt");

    foreach file (files) {
      url = dir + file;
      req = http_get(item:url, port:port);
      buf = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);
      if( buf == NULL )continue;

      version = eregmatch(string: buf, pattern: 'NanoCMS v([0-9.]+)',icase:TRUE);

      if ( !isnull(version[1]) ) {
         vers = version[1];
         concUrl = url;
	 break;
      }
    }

    set_kb_item(name: "nanocms/detected", value: TRUE);

    cpe = build_cpe(value: vers, exp: "^([0-9.]+)", base: "cpe:/a:nanocms:nanocms:");
    if (!cpe)
      cpe = 'cpe:/a:nanocms:nanocms';

    register_product(cpe: cpe, location: install, port: port, service: "www");

    log_message(data: build_detection_report(app: "NanoCMS", version: vers, install: install, cpe: cpe,
                                             concluded: version[0], concludedUrl: concUrl),
                port: port);
    exit(0);
  }
}

exit(0);
