###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_natterchat_mult_xss_n_sql_inj_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# NatterChat Multiple XSS And SQL Injection Vulnerabilities
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation will allow attackers to inject arbitrary
web script or HTML code or execute arbitrary SQL commands in the context of an
affected application.

Impact Level: Application";


tag_affected = "NatterChat version 1.12 on Windows.";

tag_insight = "- Multiple SQL injection flaws in login.asp, which can be caused
via the 'txtUsername' parameter and 'txtPassword' parameter in a form generated
by home.asp.
- Multiple XSS flaws which can be caused by injecting arbitrary web script or
HTML via the 'txtUsername' parameter in registerDo.asp, as invoked from
register.asp, or 'txtRoomName' parameter in room_new.asp.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is running NatterChat and is prone to multiple XSS and
SQL Injection vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.901007");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-08-27 13:43:20 +0200 (Thu, 27 Aug 2009)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2008-7048", "CVE-2008-7049");
  script_bugtraq_id(32385);
  script_name("NatterChat Multiple XSS And SQL Injection Vulnerabilities");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/7175");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/46768");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Web application abuses");
  script_dependencies("secpod_natterchat_detect.nasl");
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

nchatPort = get_http_port(default:80);
if(!nchatPort){
  exit(0);
}

nchatVer = get_kb_item("www/" + nchatPort + "/NatterChat");
nchatVer = eregmatch(pattern:"^(.+) under (/.*)$", string:nchatVer);

if(nchatVer[1] != NULL)
{
  if(version_is_equal(version:nchatVer[1], test_version:"1.12")){
    security_message(nchatPort);
  }
}
