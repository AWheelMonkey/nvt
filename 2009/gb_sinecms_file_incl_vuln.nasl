###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sinecms_file_incl_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# SineCMS Remote File Inclusion Vulnerability
#
# Authors:
# Nikita MR <rnikita@secpod.com>
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

tag_impact = "Successful exploitation will allow attackers to obtain sensitive
information and execute arbitrary code via crafetd URLs which upload malicious
files.

Impact Level: System/Application";

tag_affected = "SineCMS version 2.3.5 and prior.";

tag_insight = "This vulnerability arises because input passed to the
'sine[config][index_main]' parameter in 'mods/Integrated/index.php' is not
sanitised before being used to include files.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is installed with SineCMS and is prone to Remote
File Inclusion vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800942");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-09-10 15:23:12 +0200 (Thu, 10 Sep 2009)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2008-7163");
  script_bugtraq_id(27156);
  script_name("SineCMS Remote File Inclusion Vulnerability");
  script_xref(name : "URL" , value : "http://milw0rm.com/exploits/4854");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/28305");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/39446");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_MIXED_ATTACK);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_sinecms_detect.nasl");
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

sinePort = get_http_port(default:80);
if(!sinePort)
{
  exit(0);
}

sineVer = get_kb_item("www/" + sinePort + "/SineCMS");
sineVer = eregmatch(pattern:"^(.+) under (/.*)$", string:sineVer);

if((!safe_checks()) && (sineVer[2] != NULL) )
{
  sndReq = http_get(item:string(sineVer[2], "/mods/Integrated/index.php?sine" +
  "[config][index_main]=../../Core/data/images/MALICIOUS.jpg%00"), port:sinePort);

  rcvRes = http_send_recv(port:sinePort, data:sndReq);
  if("MALICIOUS.jpg" >< rcvRes)
  {
    security_message(sinePort);
    exit(0);
  }
}

if(sineVer[1] != NULL)
{
  if(version_is_less_equal(version:sineVer[1], test_version:"2.3.5")){
     security_message(sinePort);
  }
}
