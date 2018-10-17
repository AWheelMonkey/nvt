###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tomatocart_sql_n_xss_vuln.nasl 11402 2018-09-15 09:13:36Z cfischer $
#
# TomatoCart SQL Injection and Cross Site Scripting Vulnerabilities
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.804871");
  script_version("$Revision: 11402 $");
  script_cve_id("CVE-2014-3830", "CVE-2014-3978");
  script_bugtraq_id(69110, 69072);
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-15 11:13:36 +0200 (Sat, 15 Sep 2018) $");
  script_tag(name:"creation_date", value:"2014-10-28 14:44:09 +0530 (Tue, 28 Oct 2014)");

  script_name("TomatoCart SQL Injection and Cross Site Scripting Vulnerabilities");

  script_tag(name:"summary", value:"This host is installed with TomatoCart
  and is prone to sql-injection and cross-site scripting.");

  script_tag(name:"vuldetect", value:"Send a crafted data via HTTP GET request
  and check whether it is able to read cookie or not.");

  script_tag(name:"insight", value:"Multiple errors are due to,

  - Input passed to info.php script via the 'faqs_id' GET parameter is not
  validated before returning it to users

  - the program does not properly sanitize user-supplied input to the
  'First Name' and 'Last Name' fields when creating new contacts.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary HTML and script code in a users browser session
  in the context of an affected site and inject or manipulate SQL queries in the
  back-end database, allowing for the manipulation or disclosure of arbitrary data.");

  script_tag(name:"affected", value:"TomatoCart version 1.1.8.6.1");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"remote_vul");

  script_xref(name:"URL", value:"http://packetstormsecurity.com/files/127785");
  script_xref(name:"URL", value:"https://breaking.technology/advisories/CVE-2014-3830.txt");
  script_xref(name:"URL", value:"https://breaking.technology/advisories/CVE-2014-3978.txt");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

http_port = get_http_port(default:80);

if(!can_host_php(port:http_port)){
  exit(0);
}

foreach dir (make_list_unique("/", "/cart", "/TomatoCart", "/tomatocart", cgi_dirs(port:http_port)))
{

  if(dir == "/") dir = "";

  rcvRes = http_get_cache(item:string(dir, "/index.php"),  port:http_port);

  if(rcvRes && rcvRes =~ ">Powered by.*>TomatoCart<")
  {
    url = dir + "/info.php?faqs&faqs_id=1';</script><script>alert(documen" +
                "t.cookie);</script>";

    if(http_vuln_check(port:http_port, url:url, check_header:TRUE,
                       pattern:"<script>alert\(document.cookie\);</script>",
                       extra_check:make_list(">TomatoCart<", ">FAQs")))
    {
      security_message(port:http_port);
      exit(0);
    }
  }
}

exit(99);
