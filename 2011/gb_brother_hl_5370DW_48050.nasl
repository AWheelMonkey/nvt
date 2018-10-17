###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_brother_hl_5370DW_48050.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Brother HL-5370DW Printer 'post/panel.html' Security Bypass Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
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

tag_summary = "The Brother HL-5370DW printer is prone to a security-bypass
vulnerability.

Remote attackers can exploit this issue to bypass security
restrictions.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.103173");
 script_version("$Revision: 9351 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2011-06-06 13:42:32 +0200 (Mon, 06 Jun 2011)");
 script_bugtraq_id(48050);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
 script_name("Brother HL-5370DW Printer 'post/panel.html' Security Bypass Vulnerability");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/48050");
 script_xref(name : "URL" , value : "http://www.brother.com");

 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("General");
 script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");
include("global_settings.inc");
   
port = get_http_port(default:80);
if(!get_port_state(port))exit(0);

   
url = string("/printer/main.html"); 

if(http_vuln_check(port:port, url:url, pattern:"<TITLE>Brother HL-5370DW")) {

  url = string("/printer/post/panel.html?EXECUTE2=PRTCONFIG");

  if(http_vuln_check(port:port, url:url, pattern:"Request.*:.*acknowledged")) {

    security_message(port:port);
    exit(0);
 
  }  


}

exit(0);
