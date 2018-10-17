###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_honeywell_ip_camera_detect.nasl 11408 2018-09-15 11:35:21Z cfischer $
#
# Honeywell IP-Camera Detection
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808659");
  script_version("$Revision: 11408 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-15 13:35:21 +0200 (Sat, 15 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-08-23 15:56:59 +0530 (Tue, 23 Aug 2016)");
  script_name("Honeywell IP-Camera Detection");
  script_tag(name:"summary", value:"Detects the installed version of
  Honeywell IP-Cameras.

  This script sends HTTP GET request and try to ensure the presence of
  Honeywell IP-Cameras.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  exit(0);
}

include("http_func.inc");
include("host_details.inc");

achPort = get_http_port(default:80);

foreach dir(make_list_unique("/", "/cgi-bin", cgi_dirs(port:achPort)))
{
  install = dir;
  if(dir == "/") dir = "";

  sndReq = http_get(item: dir + "/chksession.cgi", port:achPort);
  rcvRes = http_send_recv(port:achPort, data:sndReq);

  if('<title>Honeywell IP-Camera login</title>' >< rcvRes && 'password' >< rcvRes)
  {
    version = "unknown";

    set_kb_item(name:"Honeywell/IP_Camera/Installed", value:TRUE);

    ## Created new cpe
    cpe = "cpe:/a:honeywell:honeywell_ip_camera";

    register_product(cpe:cpe, location:install, port:achPort);

    log_message( data:build_detection_report( app:"Honeywell IP-Camera",
                                              version:version,
                                              install:install,
                                              cpe:cpe,
                                              concluded:version),
                                              port:achPort);
  }
}
exit(0);
