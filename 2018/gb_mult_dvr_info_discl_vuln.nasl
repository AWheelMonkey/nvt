###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mult_dvr_info_discl_vuln.nasl 10224 2018-06-15 14:29:06Z cfischer $
#
# Multiple DVR Products Information Disclosure Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.141062");
  script_version("$Revision: 10224 $");
  script_tag(name: "last_modification", value: "$Date: 2018-06-15 16:29:06 +0200 (Fri, 15 Jun 2018) $");
  script_tag(name: "creation_date", value: "2018-05-03 14:37:44 +0700 (Thu, 03 May 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_cve_id("CVE-2018-10676");

  script_tag(name: "qod_type", value: "exploit");

  script_tag(name: "solution_type", value: "NoneAvailable");

  script_name("Multiple DVR Products Information Disclosure Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80, 88, 81, 82, 8080);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name: "summary", value: "Multiple DVR devices allow remote attackers to download a file and obtain
sensitive credential information via a direct request for the download.rsp URI.");

  script_tag(name: "vuldetect", value: "Sends a crafted HTTP GET request and checks the response.");

  script_tag(name: "solution", value: "No known solution is available as of 06th June, 2018. Information
regarding this issue will be updated once solution details are available.");

  script_xref(name: "URL", value: "https://misteralfa-hack.blogspot.com/2018/05/0day-dvr-multivendor.html");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 80);

banner = get_http_banner(port: port, file: "/login.rsp");
if ("Server: GNU rsp/" >!< banner)
  exit(0);

url = '/download.rsp';

req = http_get(port: port, item: url);
res = http_keepalive_send_recv(port: port, data: req, bodyonly: TRUE);


if ('Cruise1' >< res && 'admin' >< res) {
  report = report_vuln_url(port: port, url: url);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
