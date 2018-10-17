###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tdiary_detect.nasl 11015 2018-08-17 06:31:19Z cfischer $
#
# tDiary Version Detection
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.800991");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 11015 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 08:31:19 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2010-03-10 15:48:25 +0100 (Wed, 10 Mar 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("tDiary Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script finds the installed version of tDiary and sets
  the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");
  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

diaryPort = get_http_port(default:80);

foreach path (make_list_unique("/tdiary", "/", cgi_dirs(port:diaryPort)))
{

  install = path;
  if(path == "/") path = "";

  sndReq = http_get(item: path + "/index.rb", port:diaryPort);
  rcvRes = http_keepalive_send_recv(port:diaryPort, data:sndReq);

  if(">tDiary<" >< rcvRes) {

    version = "unknown";

    ## Match tDiary Version
    diaryVer = eregmatch(pattern:"tDiary.* version ([0-9.]+)<", string:rcvRes);

    if(diaryVer[1] != NULL) version = diaryVer[1];

    tmp_version = version + " under " + install;
    set_kb_item(name:"www/" + diaryPort + "/tdiary", value:tmp_version);

    cpe = build_cpe(value:version, exp:"^([0-9.]+)", base:"cpe:/a:tdiary:tdiary:");
    if( isnull( cpe ) )
      cpe = 'cpe:/a:tdiary:tdiary';

    register_product( cpe:cpe, location:install, port:diaryPort );

    log_message( data: build_detection_report( app:"tDiary",
                                               version:version,
                                               install:install,
                                               cpe:cpe,
                                               concluded: diaryVer[0]),
                                               port:diaryPort);

  }
}