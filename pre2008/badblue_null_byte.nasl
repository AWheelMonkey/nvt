# OpenVAS Vulnerability Test
# $Id: badblue_null_byte.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: BadBlue invalid null byte vulnerability
#
# Authors:
# Michel Arboi <arboi@alussinan.org>
# Script audit and contributions from Carmichael Security <http://www.carmichaelsecurity.com>
# Erik Anderson <eanders@carmichaelsecurity.com>
# Added BugtraqID and CAN
#
# Copyright:
# Copyright (C) 2002 Michel Arboi
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

tag_summary = "It was possible to read the content of /EXT.INI
(BadBlue configuration file) by sending an invalid GET request.

A cracker may exploit this vulnerability to steal the passwords.";

tag_solution = "upgrade your software or protect it with a filtering reverse proxy";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.11064");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(5226);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
 script_tag(name:"qod_type", value:"remote_banner_unreliable");
 script_cve_id("CVE-2002-1021");
 name = "BadBlue invalid null byte vulnerability";
 script_name(name);
 script_category(ACT_ATTACK);
 script_copyright("This script is Copyright (C) 2002 Michel Arboi");
 family = "Web Servers";
 script_family(family);
 script_require_ports("Services/www", 80);
 script_dependencies("gb_get_http_banner.nasl", "no404.nasl");
 script_mandatory_keys("BadBlue/banner");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if ( ! port ) exit(0);
banner = get_http_banner(port:port);
if ( ! banner ) exit(0);
if ("BadBlue" >!< banner ) exit(0);


r = string("/ext.ini.%00.txt");
res = is_cgi_installed_ka(item:r, port:port);
if( res ) security_message(port);
