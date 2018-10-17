###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_manage_engine_asset_explorer_detect.nasl 10913 2018-08-10 15:35:20Z cfischer $
#
# ZOHO Manage Engine Asset Explorer Detection
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805189");
  script_version("$Revision: 10913 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 17:35:20 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2015-05-22 15:22:45 +0530 (Fri, 22 May 2015)");
  script_name("ZOHO Manage Engine Asset Explorer Detection");

  script_tag(name:"summary", value:"Detection of installed version and build
  of ManageEngine Asset Explorer Detection.

  This script sends HTTP GET request and try to get the version from the
  response, and sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_family("Product detection");
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 8080);
  script_exclude_keys("Settings/disable_cgi_scanning");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

http_port = get_http_port(default:8080);

rcvRes = http_get_cache(item: "/",  port:http_port);

if(">ManageEngine AssetExplorer<" >< rcvRes)
{

  Version = eregmatch(pattern:"version&nbsp;([0-9.]+)<", string:rcvRes);

  if(!Version[1])
    Version = eregmatch(pattern:"ManageEngine AssetExplorer &nbsp;([0-9.]+)<", string:rcvRes);

  Build = eregmatch(pattern:"build=([0-9.]+)", string:rcvRes);

  if(Version[1]) {
    fullVer = Version[1];
    set_kb_item(name:"www/" + http_port + "/AssetExplorer", value:Version[1]);

    if(Build[1]){
      set_kb_item(name:"AssetExplorer/Build",value:Build[1]);
      fullVer = string(Version[1], " Build: ", Build[1]);
    }
  }

  set_kb_item(name:"AssetExplorer/installed",value:TRUE);

  cpe = build_cpe(value:Version[1], exp:"^([0-9.]+)", base:"cpe:/a:zohocorp:manageengine_assetexplorer:");
  if(!cpe)
    cpe = 'cpe:/a:zohocorp:manageengine_assetexplorer';

  register_product(cpe:cpe, location:"/", port:http_port);
  log_message(data: build_detection_report(app: "Manage Engine AssetExplorer",
                                             version:Version[1],
                                             install:"/",
                                             cpe:cpe,
                                             concluded:Version[0]),
                                             port:http_port);
}

exit(0);
