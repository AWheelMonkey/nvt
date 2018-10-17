###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_snews_detect.nasl 11224 2018-09-04 12:57:17Z cfischer $
#
# sNews Version Detection
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.801242");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 11224 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-04 14:57:17 +0200 (Tue, 04 Sep 2018) $");
  script_tag(name:"creation_date", value:"2010-08-04 08:26:41 +0200 (Wed, 04 Aug 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("sNews Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"The script detects the version of sNews on remote host
  and sets the KB.");

  script_tag(name:"qod_type", value:"remote_banner");
  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port(default:80);

if( !can_host_php( port:port ) ) exit( 0 );

foreach dir (make_list_unique("/sNews", "/snews", "/", cgi_dirs(port:port)))
{

  install = dir;
  if( dir == "/" ) dir = "";

  rcvRes = http_get_cache(item: dir + "/index.php", port:port);
  rcvRes2 = http_get_cache(item: dir + "/readme.txt", port:port);
  rcvRes3 = http_get_cache(item: dir + "/readme.html", port:port);

  if("<title>sNews" >< rcvRes || "sNews v" >< rcvRes2 || "<title>sNews" >< rcvRes3 ) {

    version = "unknown";

    ver = eregmatch(pattern:'<title>sNews ([0-9.]+)</title>', string:rcvRes);
    if(ver[1] == NULL)
    {
      ver = eregmatch(pattern:'sNews v([0-9.]+)', string:rcvRes2);
      if(ver[1] == NULL)
      {
        ver = eregmatch(pattern:'<title>sNews ([0-9.]+) ReadMe</title>', string:rcvRes3);
        if(ver[1] != NULL) version = ver[1];
      } else {
        version = ver[1];
      }
    } else {
      version = ver[1];
    }

    tmp_version = version + " under " + install;
    set_kb_item(name:"www/" + port + "/snews", value:tmp_version);

    cpe = build_cpe(value:version, exp:"^([0-9.]+)", base:"cpe:/a:solucija:snews:");
    if( isnull( cpe ) )
      cpe = 'cpe:/a:solucija:snews';

    register_product( cpe:cpe, location:install, port:port );

    log_message( data: build_detection_report( app:"sNews",
                                               version:version,
                                               install:install,
                                               cpe:cpe,
                                               concluded: ver[0]),
                                               port:port);
  }
}
