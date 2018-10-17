###############################################################################
# OpenVAS Vulnerability Test
# $Id: serv_u_37051.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# RhinoSoft Serv-U FTP Server TEA Decoder Remote Stack Buffer Overflow Vulnerability
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

tag_summary = "RhinoSoft Serv-U FTP Server is prone to a remote stack-based buffer-
overflow vulnerability because the application fails to perform
adequate boundary checks on user-supplied data.

Attackers can exploit this issue to execute arbitrary code within the
context of the affected application. Failed exploit attempts will
result in a denial-of-service condition.

Serv-U 9.0.0.5 is vulnerable; other versions may also be affected.";

tag_solution = "Updates are available. Please see the references for details.";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100354");
 script_version("$Revision: 9350 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2009-11-19 19:04:52 +0100 (Thu, 19 Nov 2009)");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2009-4006");
 script_bugtraq_id(37051);

 script_name("RhinoSoft Serv-U FTP Server TEA Decoder Remote Stack Buffer Overflow Vulnerability");


 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("FTP");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("gb_rhinosoft_serv-u_detect.nasl");
 script_require_ports("Services/ftp", 21);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/37051");
 script_xref(name : "URL" , value : "http://www.serv-u.com/");
 script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/507955");
 exit(0);
}


include("ftp_func.inc");
include("version_func.inc");

port = get_kb_item("Services/ftp");
if(!port){
  port = 21;
}

if(get_kb_item('ftp/'+port+'/broken'))exit(0);

if(!get_port_state(port)){
  exit(0);
}

if(!version = get_kb_item(string("ftp/", port, "/Serv-U"))) {
 if(!version = get_kb_item(string("Serv-U/FTP/Ver"))) {
  exit(0);
 }  
}  

if(!isnull(version[1])) {
  vers = version[1];
}  

if(!isnull(vers)) {
   if(vers =~ "^9\.") {
     if(version_is_less(version:vers, test_version:"9.1.0.0") ) {
         security_message(port: port);
         exit(0);
     }
   }
}

exit(0);

