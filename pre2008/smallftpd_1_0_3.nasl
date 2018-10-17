# OpenVAS Vulnerability Test
# $Id: smallftpd_1_0_3.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: smallftpd 1.0.3
#
# Authors:
# Audun Larsen <larsen@xqus.com>
#
# Copyright:
# Copyright (C) 2004 Audun Larsen
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

tag_summary = "The remote host seems to be running smallftpd 1.0.3

It has been reported that SmallFTPD is prone to a remote denial of service 
vulnerability. This issue is due to the application failing to properly 
validate user input.";

tag_solution = "Use a different FTP server.";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.12072");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_cve_id("CVE-2004-0299");
 script_bugtraq_id(9684);
 script_tag(name:"cvss_base", value:"2.1");
 script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:P");
 name = "smallftpd 1.0.3";

 script_name(name);

 
 
 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
 
 
 script_copyright("This script is Copyright (C) 2004 Audun Larsen");
 family = "Denial of Service";
 script_family(family);
 script_dependencies("ftpserver_detect_type_nd_version.nasl");
 script_require_ports("Services/ftp", 21);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

#
# The script code starts here
#

include("ftp_func.inc");

port = get_kb_item("Services/ftp");
if(!port)port = 21;
if(get_port_state(port))
{
 soc = open_sock_tcp(port);
 if(soc) 
 {
  data = ftp_recv_line(socket:soc);
  if(data)
  {
   if(egrep(pattern:"^220.*smallftpd (0\..*|1\.0\.[0-3][^0-9])", string:data) )
   {
    security_message(port);
   }
  }
 }
}
