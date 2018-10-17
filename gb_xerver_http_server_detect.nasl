###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_xerver_http_server_detect.nasl 11028 2018-08-17 09:26:08Z cfischer $
#
# Xerver Version Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.801017");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 11028 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 11:26:08 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2009-10-21 10:12:07 +0200 (Wed, 21 Oct 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Xerver Version Detection");
  script_family("Product detection");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("gb_get_http_banner.nasl");
  script_mandatory_keys("Xerver/banner");
  script_require_ports("Services/www", 80, 32123);

  script_tag(name:"summary", value:"This script finds the running Xerver Version and saves the
  result in KB.");

  exit(0);
}

include("http_func.inc");
include("cpe.inc");
include("host_details.inc");

SCRIPT_DESC = "Xerver Version Detection";

foreach port(make_list(32123, 80))
{
  if(get_port_state(port))
  {
    banner = get_http_banner(port:port);
    if(banner)
    {
      xerVer = eregmatch(pattern:"Server: Xerver/([0-9.]+)",string:banner);
      if(xerVer[1] != NULL){
        set_kb_item(name:"www/" + port + "/Xerver", value:xerVer[1]);
        log_message(data:"Xerver version " + xerVer[1] + " was detected on the host");

        cpe = build_cpe(value:xerVer[1], exp:"^([0-9.]+)", base:"cpe:/a:xerver:xerver:");
        if(!isnull(cpe))
           register_host_detail(name:"App", value:cpe, desc:SCRIPT_DESC);

      }
    }
  }
}
