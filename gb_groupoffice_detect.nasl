###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_groupoffice_detect.nasl 11028 2018-08-17 09:26:08Z cfischer $
#
# Group-Office Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.100801");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 11028 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 11:26:08 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2010-09-14 15:16:41 +0200 (Tue, 14 Sep 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Group-Office Detection");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This host is running Group-Office, a PHP based dual license
  commercial/open source groupware product developed by Dutch company Intermesh.");

  script_xref(name:"URL", value:"http://www.group-office.com");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

SCRIPT_DESC = "Group-Office Detection";

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

foreach dir( make_list_unique( "/go", "/groupware", "/group-office", "/groupoffice", cgi_dirs( port:port ) ) ) {

 install = dir;
 if( dir == "/" ) dir = "";
 url = dir + "/about.php";
 buf = http_get_cache( item:url, port:port );
 if( buf == NULL ) continue;

 if("Intermesh" >< buf && "Group-Office" >< buf && "Version" >< buf)
 {
    vers = string("unknown");
    version = eregmatch(string: buf, pattern: "Version: ([0-9.]+)",icase:TRUE);

    if ( !isnull(version[1]) ) {
       vers=chomp(version[1]);
    }

    set_kb_item(name: string("www/", port, "/groupoffice"), value: string(vers," under ",install));

    if(vers >!< "unknown") {
      register_host_detail(name:"App", value:string("cpe:/a:group-office:group-office_groupware:",vers), desc:SCRIPT_DESC);
    } else {
      register_host_detail(name:"App", value:string("cpe:/a:group-office:group-office_groupware"), desc:SCRIPT_DESC);
    }

    info = string("Group-Office Version '");
    info += string(vers);
    info += string("' was detected on the remote host in the following directory(s):\n\n");
    info += string(install, "\n");

    log_message(port:port,data:info);
    exit(0);
  }
}

exit(0);
