###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_b2evolution_detect.nasl 10891 2018-08-10 12:51:28Z cfischer $
#
# b2evolution CMS Detection
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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
  script_oid("1.3.6.1.4.1.25623.1.0.106534");
  script_version("$Revision: 10891 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 14:51:28 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-01-20 12:59:58 +0700 (Fri, 20 Jan 2017)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("b2evolution Detection");

  script_tag(name:"summary", value:"Detection of b2evolution CMS

The script sends a HTTP connection request to the server and attempts to detect the presence of b2evolution CMS
and to extract its version.");

  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://b2evolution.net/");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 80);

foreach dir (make_list_unique( "/", "/b2evolution", cgi_dirs(port: port))) {

  install = dir;
  if (dir == "/") dir = "";

  foreach url (make_list("/admin.php", "/blogs/admin.php")) {

    res = http_get_cache(port: port, item: dir + url);

    if ("http://b2evolution.net/" >< res && "<title>Log in to your account</title>" >< res &&
        "pwd_salt" >< res) {
      version = "unknown";

      vers = eregmatch(pattern: "<strong>b2evolution ([0-9.]+)", string: res);
      if (!isnull(vers[1])) {
        version = vers[1];
        set_kb_item(name: "b2evolution/version", value: version);
      }

      set_kb_item(name: "b2evolution/installed", value: TRUE);

      cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:b2evolution:b2evolution:");
      if (!cpe)
        cpe = 'cpe:/a:b2evolution:b2evolution';

      register_product(cpe: cpe, location: install, port: port);

      log_message(data: build_detection_report(app: "b2evolution", version: version, install: install,
                                               cpe: cpe, concluded: vers[0]),
                  port: port);
      exit(0);
    }
  }
}

exit(0);
