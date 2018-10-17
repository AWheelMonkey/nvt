###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openx_multiple_open_redirect_vuln.nasl 11402 2018-09-15 09:13:36Z cfischer $
#
# OpenX Multiple Open Redirect Vulnerabilities
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
  script_oid("1.3.6.1.4.1.25623.1.0.804877");
  script_version("$Revision: 11402 $");
  script_cve_id("CVE-2014-2230");
  script_bugtraq_id(70603);
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-15 11:13:36 +0200 (Sat, 15 Sep 2018) $");
  script_tag(name:"creation_date", value:"2014-11-05 11:59:46 +0530 (Wed, 05 Nov 2014)");
  script_name("OpenX Multiple Open Redirect Vulnerabilities");

  script_tag(name:"summary", value:"This host is installed with OpenX and
  is prone to multiple open redirect vulnerabilities.");

  script_tag(name:"vuldetect", value:"Send a crafted HTTP GET request and check
  whether it redirects to the malicious websites.");

  script_tag(name:"insight", value:"Multiple errors exists as the application
  does not validate the inputs passed via 'dest' parameter to adclick.php script
  and '_maxdest' parameter to ck.php script.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to create a specially crafted URL, that if clicked, would redirect
  a victim from the intended legitimate web site to an arbitrary web site of the
  attacker's choosing.");

  script_tag(name:"affected", value:"OpenX version 2.8.10 and probably prior");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure of this vulnerability.
Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective features, remove the product or replace the product by another one.");

  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"remote_app");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/97621");
  script_xref(name:"URL", value:"http://packetstormsecurity.com/files/128718");
  script_xref(name:"URL", value:"http://www.tetraph.com/blog/cves/cve-2014-2230-openx-open-redirect-vulnerability-2");

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

opPort = get_http_port(default:80);

if(!can_host_php(port:opPort)){
  exit(0);
}

foreach dir (make_list_unique("/openx", "/OpenX", "/", cgi_dirs(port:opPort)))
{

  if(dir == "/") dir = "";

  sndReq = http_get(item: string( dir+ "/www/admin/index.php"), port:opPort);
  rcvRes = http_keepalive_send_recv(port:opPort, data:sndReq);

  if(rcvRes && ">Welcome to OpenX<" >< rcvRes)
  {
    url = dir + "/www/delivery/ck.php?_maxdest=http://www.example.com";

    sndReq = http_get(item: url,  port:opPort);
    rcvRes = http_keepalive_send_recv(port:opPort, data:sndReq);

    if(rcvRes && rcvRes =~ "HTTP/1.. 302" &&
       rcvRes =~ "Location.*http://www.example.com")
    {
      security_message(port:opPort);
      exit(0);
    }
  }
}

exit(99);
