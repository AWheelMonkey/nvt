###############################################################################
# OpenVAS Vulnerability Test
# $Id: serv_u_web_client_36895.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Serv-U Web Client HTTP Request Remote Buffer Overflow Vulnerability
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

tag_summary = "Serv-U Web Client is prone to a buffer-overflow vulnerability because
the application fails to perform adequate boundary checks on user-
supplied data.

Attackers can exploit this issue to execute arbitrary code within the
context of the affected application. Failed exploit attempts will
result in a denial-of-service condition.

Serv-U Web Client 9.0.0.5 is vulnerable; other versions may also
be affected.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100332");
 script_version("$Revision: 9350 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2009-11-03 12:50:27 +0100 (Tue, 03 Nov 2009)");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2009-4873");
 script_bugtraq_id(36895);

 script_name("Serv-U Web Client HTTP Request Remote Buffer Overflow Vulnerability");


 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("FTP");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("gb_get_http_banner.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("Serv-U/banner");
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/36895");
 script_xref(name : "URL" , value : "http://www.rangos.de/ServU-ADV.txt");
 script_xref(name : "URL" , value : "http://www.serv-u.com/Browser-Transfer-Client.asp");
 exit(0);
}


include("http_func.inc");
include("version_func.inc");

port = get_http_port(default:80);
if(!get_port_state(port))exit(0);

banner = get_http_banner(port: port);
if(!banner)exit(0);

if(egrep(pattern:"Server: Serv-U/", string:banner))
 {

   version = eregmatch(pattern:"Server: Serv-U/([0-9.]+)", string:banner);

   if(isnull(version[1]))exit(0);

   if(version_is_equal(version:version[1], test_version:"9.0.0.5"))  {
        security_message(port:port);
        exit(0); 
   }
 }

exit(0);
