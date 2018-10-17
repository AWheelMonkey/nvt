###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_outreach_project_tool_rfi_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Outreach Project Tool 'CRM_path' Parameter Remote File Inclusion Vulnerability
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

tag_impact = "Successful exploitation could allow the remote attackers to include
arbitrary files from local and remote resources to compromise a vulnerable server.

Impact Level: Network.";

tag_affected = "Outreach Project Tool(OPT) version 1.2.7 and prior.";

tag_insight = "Error is due to improper sanitization of user supplied input in
'CRM_path' parameter in 'opt/forums/Forum_Include/index.php' while including
external files for processing.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is running Outreach Project Tool(OPT) and is prone to
Remote File Inclusion vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801070");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-12-08 05:49:24 +0100 (Tue, 08 Dec 2009)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2009-4082");
  script_bugtraq_id(37090);
  script_name("Outreach Project Tool 'CRM_path' Parameter Remote File Inclusion Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/37447");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/54379");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/0911-exploits/opt-rfi.txt");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_MIXED_ATTACK);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("gb_outreach_project_tool_detect.nasl");
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

optPort = get_http_port(default:80);
if(!optPort){
  exit(0);
}

optVer = get_kb_item("www/" + optPort + "/OPT");
if(!optVer){
  exit(0);
}

optVer = eregmatch(pattern:"^(.+) under (/.*)$", string:optVer);
if(!safe_checks() && optVer[2] != NULL)
{
  request = http_get(item:optVer[2] + "/forums/Forum_Include/index.php?"+
                       "CRM_path=OpenVas-rfi.txt",port:optPort);
  response = http_send_recv(port:optPort, data:request);
  if("OpenVas-rfi.txt" >< response)
  {
    security_message(optPort);
    exit(0);
  }
}

if(optVer[1] != NULL)
{
  if(version_is_less_equal(version:optVer[1], test_version:"1.2.7")){
    security_message(optPort);
  }
}
