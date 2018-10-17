###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_flashlight_sql_inj_n_dir_trav_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Flashlight Free Edition SQL Injection and Directory Traversal Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could allow remote attackers to view, add,
modify or delete information in the back end database or include arbitrary files
from local and remote resources to compromise a vulnerable server.

Impact Level: Network/System";

tag_affected = "Flashlight Free version 1.0 on all running platform.";

tag_insight = "Flaws are due to,
- An error in 'read.php' which is not properly sanitizing user supplied input
  before being used in SQL queries via 'id' parameter.
- An error in 'admin.php' which is not properly sanitizing user supplied input
  before being used via a .. (dot dot) in the action 'parameter' which causes
  directory traversal attacks in the application context.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is running Flashlight Free Edition and is prone to SQL
Injection and Directory Traversal Vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801075");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-12-09 07:52:52 +0100 (Wed, 09 Dec 2009)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2009-4204","CVE-2009-4205");
  script_name("Flashlight Free Edition SQL Injection and Directory Traversal Vulnerability");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/8856");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/50906");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("gb_flashlight_detect.nasl");
  script_family("Web application abuses");
  script_require_ports("Services/www", 80);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("http_func.inc");
include("version_func.inc");

fPort = get_http_port(default:80);
if(!fPort){
  exit(0);
}

fVer = get_kb_item("www/" + fPort + "/Flashlight/Free");
if(!fVer){
  exit(0);
}

fVer = eregmatch(pattern:"^(.+) under (/.*)$", string:fVer);
if(fVer[1] != NULL)
{
  if(version_is_equal(version:fVer[1], test_version:"1.0")){
    security_message(fPort);
  }
}
