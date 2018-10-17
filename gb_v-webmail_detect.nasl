###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_v-webmail_detect.nasl 10915 2018-08-10 15:50:57Z cfischer $
#
# V-webmail Version Detection
#
# Authors:
# Sharath S <sharaths@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.800821");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 10915 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 17:50:57 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2009-07-03 15:23:01 +0200 (Fri, 03 Jul 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("V-webmail Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script detects the installed version of V-webmail and
  sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");
  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

vwmailPort = get_http_port(default:80);

if( !can_host_php( port:vwmailPort ) ) exit( 0 );

foreach dir (make_list_unique("/", "/v-webmail", "/webmail", cgi_dirs(port:vwmailPort)))
{

  install = dir;
  if( dir == "/" ) dir = "";

  sndReq = http_get(item:dir + "/htdocs/login.php", port:vwmailPort);
  rcvRes = http_keepalive_send_recv(data:sndReq, port:vwmailPort);

  if(rcvRes =~ "<title>V-webmail [0-9.]+</title>" &&
     egrep(pattern:"^HTTP/.* 200 OK", string:rcvRes)) {

    version = "unknown";

    vwmailVer = eregmatch(pattern:"V-webmail ([0-9]\.[0-9]\.[0-9])", string:rcvRes);
    if(vwmailVer[1] != NULL) version = vwmailVer[1];

    tmp_version = version + " under " + install;
    set_kb_item(name:"www/" + vwmailPort + "/V-webmail", value:tmp_version);

    cpe = build_cpe(value:version, exp:"^([0-9.]+)", base:"cpe:/a:christof_bruyland:v-webmail:");
    if( isnull( cpe ) )
      cpe = 'cpe:/a:christof_bruyland:v-webmail';

    register_product( cpe:cpe, location:install, port:vwmailPort );

    log_message( data: build_detection_report( app:"V-webmail",
                                               version:version,
                                               install:install,
                                               cpe:cpe,
                                               concluded: vwmailVer[0]),
                                               port:vwmailPort);

  }
}
