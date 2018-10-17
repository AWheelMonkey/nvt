###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_phpgenealogie_detect.nasl 10922 2018-08-10 19:21:48Z cfischer $
#
# PHPGenealogie Version Detection
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801007");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 10922 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 21:21:48 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2009-10-08 08:22:29 +0200 (Thu, 08 Oct 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("PHPGenealogie Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script detects the installed version of PHPGenealogie and
  sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");
  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

phpgenPort = get_http_port(default:80);

if( !can_host_php( port:phpgenPort ) ) exit( 0 );

foreach path (make_list_unique("/geneald", "/genealogie_sql", "/genealogie", cgi_dirs(port:phpgenPort)))
{

  install = path;
  if( path == "/" ) path = "";

  sndReq = http_get(item: path + "/Index2.php", port:phpgenPort);
  rcvRes = http_keepalive_send_recv(port:phpgenPort, data:sndReq);

  if('">php.genealogie' >< rcvRes) {

    version = "unknown";

    phpgenVer = eregmatch(pattern:"> ([0-9.]+)",string:rcvRes);
    if(phpgenVer[1] != NULL) version = phpgenVer[1];

    tmp_version = version + " under " + install;
    set_kb_item(name:"www/" + phpgenPort + "/PHPGenealogie", value:tmp_version);

    cpe = build_cpe(value:version, exp:"^([0-9.]+)", base:"cpe:/a:phpgenealogy:phpgenealogy:");
    if( isnull( cpe ) )
      cpe = 'cpe:/a:phpgenealogy:phpgenealogy';

    register_product( cpe:cpe, location:install, port:phpgenPort );

    log_message( data: build_detection_report( app:"PHPGenealogie",
                                               version:version,
                                               install:install,
                                               cpe:cpe,
                                               concluded: phpgenVer[0]),
                                               port:phpgenPort);
  }
}
