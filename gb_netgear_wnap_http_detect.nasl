###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_netgear_wnap_http_detect.nasl 12575 2018-11-29 10:41:31Z ckuersteiner $
#
# NETGEAR WNAP/WNDAP Device Detection (HTTP)
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.141739");
  script_version("$Revision: 12575 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-29 11:41:31 +0100 (Thu, 29 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-29 15:59:23 +0700 (Thu, 29 Nov 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("NETGEAR WNAP/WNDAP Device Detection (HTTP)");

  script_tag(name:"summary", value:"This script performs HTTP based detection of NETGEAR WNAP/WNDAP devices.");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 80);

res = http_get_cache(port: port, item: "/index.php?page=master&menu1=Help&menu2=&menu3=&menu4=");

if ("<title>Netgear</title>" >< res && res =~ "products/WN(D)?AP[0-9]+\.asp") {
  set_kb_item(name: "netgear_wnap/detected", value:TRUE );
  set_kb_item(name: "netgear_wnap/http/detected", value: TRUE);
  set_kb_item(name: "netgear_wnap/http/port", value: port);

  # http://kbserver.netgear.com/products/WNDAP360.asp
  mod = eregmatch(pattern: "products/(WN(D)?AP[0-9]+)\.asp", string: res);
  if (!isnull(mod[1]))
    set_kb_item(name: "netgear_wnap/http/" + port + "/model", value: mod[1]);

  exit(0);
}

exit(0);
