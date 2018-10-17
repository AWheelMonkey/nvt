###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_jboss_remote_code_exec_vuln.nasl 11492 2018-09-20 08:38:50Z mmartin $
#
# JBoss Application Server Remote Code Execution Vulnerability
#
# Authors:
# Deependra Bapna <bdeepednra@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805373");
  script_version("$Revision: 11492 $");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-20 10:38:50 +0200 (Thu, 20 Sep 2018) $");
  script_tag(name:"creation_date", value:"2015-04-30 14:34:53 +0530 (Thu, 30 Apr 2015)");
  script_name("JBoss Application Server Remote Code Execution Vulnerability");

  script_tag(name:"summary", value:"This host is installed with JBoss Application
  Server and is prone to remote code execution vulnerability.

  This script is temporary deprecated until check for this vulnerability was implemented.");

  script_tag(name:"vuldetect", value:"Send a crafted exploit string via HTTP
  GET request and check whether it is able to execute the code remotely.");

  script_tag(name:"insight", value:"Flaw is due to the jbossass/jbossass.jsp
  script not properly sanitizing user-supplied input.");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker
  to execute arbitrary code in the affected system.");

  script_tag(name:"affected", value:"JBoss AS versions 3, 4, 5, 6.");

  script_tag(name:"solution", value:"No known solution was made available
  for at least one year since the disclosure of this vulnerability. Likely none will
  be provided anymore. General solution options are to upgrade to a newer release,
  disable respective features, remove the product or replace the product by another
  one.");

  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"exploit");

  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/36575/");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 8080);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"deprecated", value:TRUE);

  exit(0);
}

exit(66);

#The script currently only checks for a webshell uploaded by the referenced exploit

include("http_func.inc");
include("http_keepalive.inc");

http_port = get_http_port(default:8080);
host = http_host_name( port:http_port );
useragent = get_http_user_agent();

foreach dir (make_list_unique("/", "/jboss", "/jbossas", cgi_dirs()))
{
  if( dir == "/" ) dir = "";

  sndReq = http_get(item:string(dir,"/"),  port:http_port);
  rcvRes = http_keepalive_send_recv(port:http_port, data:sndReq);

  if(rcvRes && '>JBoss Application Server<' >< rcvRes)
  {
    url = "/jbossass/jbossass.jsp?ppp=id";
    req = string("GET ",url," HTTP/1.1\r\n",
                 "Host: ", host, "\r\n",
                 "User-Agent: ", useragent, "\r\n\r\n");
    res = http_send_recv(port:http_port, data:req, bodyonly:FALSE);

    #Extra Check is Not Possible
    if(res && res =~ "uid=[0-9]+.*gid=[0-9].+")
      {
        report = report_vuln_url( port:http_port, url:url );
        security_message(port:http_port, data:report);
        exit(0);
      }
   }
}

exit(99);
