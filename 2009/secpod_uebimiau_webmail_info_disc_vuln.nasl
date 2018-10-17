###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_uebimiau_webmail_info_disc_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Uebimiau Webmail Information Disclosure Vulnerability
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

tag_impact = "Successful exploitation will allow attacker to gain sensitive information
in the context of the affected web application.

Impact Level: Application";

tag_affected = "Uebimiau Webmail version 3.2.0-2.0";

tag_insight = "Error is due to an improper sanitization of user supplied input in
the 'system_admin/admin.ucf' file.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is running Uebimiau Webmail and is prone to Information
Disclosure Vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.901024");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-09-22 10:03:41 +0200 (Tue, 22 Sep 2009)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_cve_id("CVE-2009-3199");
  script_name("Uebimiau Webmail Information Disclosure Vulnerability");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/9493");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/52724");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_MIXED_ATTACK);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Web application abuses");
  script_dependencies("secpod_uebimiau_webmail_detect.nasl");
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

uwebPort = get_http_port(default:80);
if(!uwebPort){
  exit(0);
}

uwebVer = get_kb_item("www/" + uwebPort + "/Uebimiau/Webmail");
if(!uwebVer){
  exit(0);
}

uwebVer = eregmatch(pattern:"^(.+) under (/.*)$", string:uwebVer);

if((!safe_checks()) && (uwebVer[2] != NULL))
{
  request = http_get(item:string(uwebVer[2] + "/inc/database/system_admin"+
                                             "/admin.ucf"), port:uwebPort);
  response = http_send_recv(port:uwebPort, data:request);

  if(eregmatch(pattern:":[a-z0-9]{32,32}", string:response) &&
     egrep(pattern:"^HTTP/.* 200 OK", string:response))
  {
    security_message(uwebPort);
    exit(0);
  }
}

if(uwebVer[1] != NULL)
{
  if(version_is_equal(version:uwebVer[1], test_version:"3.2.0.2.0")){
    security_message(uwebPort);
  }
}
