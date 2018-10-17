###############################################################################
# OpenVAS Vulnerability Test
# $Id: thin_webserver_detect.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Thin Webserver Detection
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
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

tag_summary = "This host is running Thin, a Ruby web server.";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100300");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 9350 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2009-10-11 19:51:15 +0200 (Sun, 11 Oct 2009)");
 script_tag(name:"cvss_base", value:"0.0");
 script_name("Thin Webserver Detection");

 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
 script_family("Service detection");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("gb_get_http_banner.nasl");
 script_require_ports("Services/www", 3000);
 script_mandatory_keys("thin/banner");
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://code.macournoyer.com/thin/");
 exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("global_settings.inc");

port = get_http_port(default:3000);
if(!get_port_state(port))exit(0);

banner = get_http_banner(port:port);
if("Server: thin" >!< banner)exit(0);

    vers = string("unknown");
    ### try to get version 
    version = eregmatch(string: banner, pattern: "Server: thin ([0-9.]+)",icase:TRUE);

    if ( !isnull(version[1]) ) {
       vers=chomp(version[1]);
    }

    set_kb_item(name: string("www/", port, "/thin"), value: string(vers));

    info = string("Thin Version '");
    info += string(vers);
    info += string("' was detected on the remote host\n");

       if(report_verbosity > 0) {
         log_message(port:port,data:info);
       }
       exit(0);

 

exit(0);

