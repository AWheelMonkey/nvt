###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_document_manager_info_disc_vuln.nasl 8469 2018-01-19 07:58:21Z teissa $
#
# Document Manager Information Disclosure Vulnerability
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

tag_impact = "Successful exploitation will allow remote attackers to obtain sensitive
  information.
  Impact Level: Application";
tag_affected = "Document Manager version prior to 4.0";
tag_insight = "The flaw is due to an unspecified error related to file rights.";
tag_solution = "Upgrade Document Manager version to 4.0
  For updates refer to http://www.dmanager.org/download.php.en";
tag_summary = "The host is running Document Manager and is prone to Information
  Disclosure vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800478");
  script_version("$Revision: 8469 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-19 08:58:21 +0100 (Fri, 19 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-02-22 13:34:53 +0100 (Mon, 22 Feb 2010)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2010-0612");
  script_name("Document Manager Information Disclosure Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/38441");
  script_xref(name : "URL" , value : "http://freshmeat.net/projects/dmanager/releases/311735");

  script_tag(name:"qod_type", value:"remote_banner");
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_document_manager_detect.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("http_func.inc");
include("version_func.inc");

dmport = get_http_port(default:80);
if(!dmport){
  exit(0);
}

dmver = get_kb_item("www/" + dmport + "/DocManager");
if(isnull(dmver)){
  exit(0);
}

dmver = eregmatch(pattern:"^(.+) under (/.*)$", string:dmver);
if(!isnull(dmver[1]))
{
  #  Document Manager version < 4.0
  if(version_is_less(version:dmver[1], test_version:"4.0")){
    security_message(dmport);
  }
}
