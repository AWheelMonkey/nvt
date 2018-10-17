# OpenVAS Vulnerability Test
# $Id: msadcs_dll.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: RDS / MDAC Vulnerability (msadcs.dll) located
#
# Authors:
# RWT roelof@sensepost.com
#
# Copyright:
# Copyright (C) 2000 Roelof Temmingh <roelof@sensepost.com>
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

tag_summary = "The web server is probably susceptible to a common IIS vulnerability discovered by
'Rain Forest Puppy'. This vulnerability enables an attacker to execute arbitrary
commands on the server with Administrator Privileges. 

*** OpenVAS solely relied on the presence of the file /msadc/msadcs.dll
*** so this might be a false positive

See Microsoft security bulletin (MS99-025) for patch information.
Also, BUGTRAQ ID 529 on www.securityfocus.com ( http://www.securityfocus.com/bid/529 )";
 
if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.10357");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(529);
 script_xref(name:"IAVA", value:"1999-a-0010");
 script_xref(name:"IAVA", value:"1999-t-0003");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_tag(name:"qod_type", value:"remote_banner_unreliable");
 script_cve_id("CVE-1999-1011");

 name = "RDS / MDAC Vulnerability (msadcs.dll) located";
 script_name(name);

 script_category(ACT_GATHER_INFO);
 
 script_copyright("This script is Copyright (C) 2000 Roelof Temmingh <roelof@sensepost.com>");

 family = "Web Servers";
 script_family(family);
 
 script_dependencies("gb_get_http_banner.nasl");
 script_mandatory_keys("IIS/banner");
 script_require_ports("Services/www", 80);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

#
# The script code starts here
#


include("http_func.inc");
include("http_keepalive.inc");
include("global_settings.inc");

port = get_http_port(default:80);

if ( ! get_port_state(port) )  exit(0);
sig = get_http_banner(port:port);
if ( sig && "IIS" >!< sig ) exit(0);

cgi = "/msadc/msadcs.dll";
res = is_cgi_installed_ka(item:cgi, port:port);
if(res)security_message(port);
