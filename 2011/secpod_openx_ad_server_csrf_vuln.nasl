###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_openx_ad_server_csrf_vuln.nasl 11997 2018-10-20 11:59:41Z mmartin $
#
# OpenX Ad Server Cross Site Request Forgery Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902458");
  script_version("$Revision: 11997 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-20 13:59:41 +0200 (Sat, 20 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-07-27 09:16:39 +0200 (Wed, 27 Jul 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("OpenX Ad Server Cross Site Request Forgery Vulnerability");
  script_xref(name:"URL", value:"http://packetstormsecurity.org/files/view/103352/openxad-xsrf.txt");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker to gain
  administrative privileges on the target application and can cause CSRF attack.");
  script_tag(name:"affected", value:"OpenX Ad Server version 2.8.7 and prior.");
  script_tag(name:"insight", value:"The flaw is due to an error in administrative interface, which
  can be exploited by remote attackers to force a logged-in administrator to perform malicious actions.");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer
  release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"summary", value:"The host is running OpenX Ad Server and is prone to cross site
  request forgery vulnerability.");

  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"remote_app");
  exit(0);
}


include("http_func.inc");
include("version_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

if(!can_host_php(port:port)) {
  exit(0);
}

foreach dir(make_list_unique("/openx", "/www", "/www/admin", cgi_dirs(port:port)))
{

  if(dir == "/") dir = "";

  res = http_get_cache(item: dir + "/index.php", port:port);

  if(">Welcome to OpenX</" >< res)
  {
    openxVer = eregmatch(pattern:"OpenX v([0-9.]+)", string:res);
    if(openxVer[1] != NULL)
    {
      if(version_is_less_equal(version:openxVer[1], test_version:"2.8.7"))
      {
        security_message(port:port);
        exit(0);
      }
    }
  }
}

exit(99);