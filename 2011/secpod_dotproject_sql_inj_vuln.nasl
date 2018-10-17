###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_dotproject_sql_inj_vuln.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# dotProject 'index.php' SQL Injection Vulnerability.
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

tag_impact = "Successful exploitation will let attackers to compromise the
application, access or modify data, or exploit latent vulnerabilities in the
underlying database.

Impact Level: Application";

tag_affected = "dotProject version prior to 2.1.5";

tag_insight = "The flaw is due to an input passed to the 'ticket' parameter in
'index.php' is not properly sanitised before being used in SQL queries.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is running dotProject and is prone to SQL injection
vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902731");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-09-23 16:39:49 +0200 (Fri, 23 Sep 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("dotProject 'index.php' SQL Injection Vulnerability");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/17829/");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Web application abuses");
  script_dependencies("gb_dotproject_detect.nasl");
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

## Get the HTTP Port
dpPort = get_http_port(default:80);
if(!dpPort){
  exit(0);
}

## Get the version from KB
dotVer = get_version_from_kb(port:dpPort,app:"dotProject");
if(!dotVer){
  exit(0);
}

## Check for dotProject version 2.1.5
if(version_is_equal(version:dotVer, test_version:"2.1.5")){
  security_message(dpPort);
}
