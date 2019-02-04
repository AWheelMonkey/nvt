# OpenVAS Vulnerability Test
# $Id: delegate_overflow2.nasl 13397 2019-02-01 08:06:48Z cfischer $
# Description: Delegate Multiple Overflows
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
# Changes by Tenable Network Security:
#  - POP3 check
#
# Copyright:
# Copyright (C) 2005 David Maciejak
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.17599");
  script_version("$Revision: 13397 $");
  script_tag(name:"last_modification", value:"$Date: 2019-02-01 09:06:48 +0100 (Fri, 01 Feb 2019) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2005-0861");
  script_bugtraq_id(12867);
  script_name("Delegate Multiple Overflows");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2005 David Maciejak");
  script_family("Gain a shell remotely");
  script_dependencies("http_version.nasl", "popserver_detect.nasl");
  script_require_ports("Services/http_proxy", 8080, "Services/pop3", 110, 995);

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"solution", value:"Upgrade to version 8.10.3 or later.");

  script_tag(name:"summary", value:"The remote host is running Delegate which is vulnerable to multiple
  remote buffer overflow vulnerabilities which may allow an attacker to execute arbitrary code on the remote host.");

  script_tag(name:"impact", value:"This problem may allow an attacker to gain a shell on this computer.");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("http_func.inc");
include("pop3_func.inc");
include("version_func.inc");

ports = pop3_get_ports();
foreach port(ports) {
  banner = get_pop3_banner(port:port);
  if( banner && egrep(pattern:"^\+OK Proxy-POP server \(Delegate/([0-7]\..*|8\.([0-9]\..*|10\.[0-2][^0-9])) by", string:banner))
    security_message(port:port);
}

port = get_kb_item("Services/http_proxy");
if(!port) port = 8080;
if(!get_port_state(port))
  exit(0);

banner = get_http_banner(port:port);
if(!banner || "DeleGate" >!< banner)
  exit(0);

#Server: DeleGate/8.11.1
serv = strstr(banner, "Server");
if(ereg(pattern:"^Server:.*DeleGate/([0-7]\.|8\.([0-9]\.|10\.[0-2][^0-9]))", string:serv, icase:TRUE)) {
  report = report_fixed_ver(installed_version:serv, fixed_version:"8.10.3");
  security_message(port:port, data:report);
  exit(0);
}

exit(99);