###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vacron_nvr_detect.nasl 9133 2018-03-19 11:52:45Z asteins $
#
# Vacron NVR IP Surveillance Detection
#
# Authors:
# Tameem Eissa <tameem.eissa..at..greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.107189");
  script_version("$Revision: 9133 $");
  script_tag(name:"last_modification", value:"$Date: 2018-03-19 12:52:45 +0100 (Mon, 19 Mar 2018) $");
  script_tag(name:"creation_date", value:"2017-10-11 10:31:53 +0200 (Wed, 11 Oct 2017)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("Vacron NVR IP Surveillance Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 8081);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"Detection of Vacron NVR.

  The script sends a connection request to the server and attempts to detect Vacron NVR IP Surveillance Server.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

appPort = get_http_port(default: 8081);

res = http_get_cache(item: "/", port: appPort);

if ("<title>VACRON NVR LOGIN</title>" >< res && "<strong>ADVANCES IN SECURITY SOLUTION</strong>" >< res) {
    version = "unknown";
    set_kb_item(name:"vacron_nvr/installed", value:TRUE);

    cpe = build_cpe(value:version, base:"cpe:/a:vacron:nvr:");
    if (!cpe)
      cpe = 'cpe:/a:vacron:nvr';

    register_product(cpe: cpe, location: "/", port: appPort);

    log_message( data:build_detection_report(app:"Vacron NVR IP Surveillance", version: version, install: "/",
                                             cpe:cpe),
                 port:appPort);
}

exit(0);
