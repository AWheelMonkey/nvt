###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_phpnagios_lfi_vuln.nasl 8296 2018-01-05 07:28:01Z teissa $
#
# phpNagios 'conf[lang]' Parameter Local File Inclusion Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

tag_impact = "Successful exploitation could allow remote attackers to obtain sensitive
information or execute arbitrary code on the vulnerable web server.

Impact Level: Application.";
tag_affected = "phpNagios version 1.2.0 and prior.";
tag_insight = "The flaw is due to error in 'menu.php' and is not properly sanitising
  user supplied input data via 'conf[lang]' parameter.";
tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";
tag_summary = "The host is running phpNagios and is prone to local file include
  Vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800438");
  script_version("$Revision: 8296 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-05 08:28:01 +0100 (Fri, 05 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-01-22 09:23:45 +0100 (Fri, 22 Jan 2010)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2009-4626");
  script_name("phpNagios 'conf[lang]' Parameter Local File Inclusion Vulnerability");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/9611");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/53119");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2009/2615");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_dependencies("gb_phpnagios_detect.nasl");
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

pnPort = get_http_port(default:80);
if(!pnPort){
  exit(0);
}

pnVer = get_kb_item("www/" + pnPort + "/phpNagios");

pnVer = eregmatch(pattern:"^(.+) under (/.*)$", string:pnVer);
if(!isnull(pnVer[1]))
{
  # phpNagios version 1.2.0 (3.0)
  if(version_is_less_equal(version:pnVer[1], test_version:"3.0")){
    security_message(pnPort);
  }
}

