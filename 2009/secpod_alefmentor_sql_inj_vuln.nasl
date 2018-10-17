###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_alefmentor_sql_inj_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# AlefMentor Multiple SQL Injection Vulnerabilities
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod http://www.secpod.com
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

tag_impact = "Successful exploitation could allow remote attackers to conduct SQL injection
  attacks.
  Impact Level: Application.";
tag_affected = "AlefMentor version 2.0 to 2.2 on all running platform.";
tag_insight = "Input passed via the 'cont_id' and 'courc_id' parameters to 'cource.php' is
  not properly sanitised before being used in a SQL query. This flaw can be
  exploited to manipulate SQL queries by injecting arbitrary SQL code.";
tag_solution = "No solution or patch was made available for at least one year
  since disclosure of this vulnerability. Likely none will be provided anymore.
  General solution options are to upgrade to a newer release, disable respective
  features, remove the product or replace the product by another one.";
tag_summary = "The host is running AlefMentor and is prone to SQL Injection
  Vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.901071");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-12-21 07:14:17 +0100 (Mon, 21 Dec 2009)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2009-4256");
  script_name("AlefMentor Multiple SQL Injection Vulnerabilities");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/37626");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/54624");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/10358");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_MIXED_ATTACK);
  script_copyright("Copyright (C) 2009 SecPod");
  script_dependencies("secpod_alefmentor_detect.nasl");
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

amPort = get_http_port(default:80);
if(!amPort){
  exit(0);
}

amVer = get_kb_item("www/" + amPort + "/AlefMentor");
if(!amVer){
  exit(0);
}

amVer = eregmatch(pattern:"^(.+) under (/.*)$", string:amVer);
if(!safe_checks() && amVer[2] != NULL)
{
  request = http_get(item:amVer[2] + "/cource.php?action=pregled&cont_id" +
                                     "=[SQL]", port:amPort);
  response = http_send_recv(port:amPort, data:request);
  if("Da li si siguran da je to ta baza" >< response)
  {
    security_message(amPort);
    exit(0);
  }
}

if(amVer[1] != NULL)
{
  if(version_in_range(version:amVer[1], test_version:"2.0",
                                       test_version2:"2.2")){
   security_message(amPort);
  }
}
