###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_assesi_sql_inj_vuln.nasl 11402 2018-09-15 09:13:36Z cfischer $
#
# Assesi 'bg' Parameter SQL Injection vulnerability
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.804700");
  script_version("$Revision: 11402 $");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-15 11:13:36 +0200 (Sat, 15 Sep 2018) $");
  script_tag(name:"creation_date", value:"2014-06-18 12:25:39 +0530 (Wed, 18 Jun 2014)");
  script_name("Assesi 'bg' Parameter SQL Injection vulnerability");

  script_tag(name:"summary", value:"This host is installed with Assesi and is prone to SQL injection
  vulnerability.");

  script_tag(name:"vuldetect", value:"Send a crafted exploit string via HTTP GET request and check whether it is
  possible to execute sql query or not.");

  script_tag(name:"insight", value:"Flaw is due to the vereadores.php script not properly sanitizing user-supplied
  input to the 'bg' parameter.");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker to inject or manipulate SQL
  queries in the back-end database, allowing for the manipulation or disclosure
  of arbitrary data.");

  script_tag(name:"affected", value:"Assesi CMS");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure of this vulnerability.
Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective features, remove the product or replace the product by another one.");

  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"remote_app");
  script_xref(name:"URL", value:"http://cxsecurity.com/issue/WLB-2014060003");
  script_xref(name:"URL", value:"http://packetstormsecurity.com/files/126877");
  script_xref(name:"URL", value:"http://exploitsdownload.com/exploit/na/assesi-sql-injection");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl");
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

foreach dir (make_list_unique("/", "/assesi", "/cms", cgi_dirs(port:http_port)))
{

  if(dir == "/") dir = "";

  rcvRes = http_get_cache(item:string(dir, "/index.php"),  port:http_port);

  if(">Assesi" >< rcvRes)
  {
    url = dir + "/vereadores.php?bg='SQL-Injection-Test";

    ## Extra check is not possible
    if(http_vuln_check(port:http_port, url:url, check_header:TRUE,
       pattern:"You have an error in your SQL syntax.*SQL-Injection-Test"))
    {
      security_message(port:http_port);
      exit(0);
    }
  }
}

exit(99);