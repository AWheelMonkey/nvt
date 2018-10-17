###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_opera_mult_xss_vuln_sep09_lin.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Opera Multiple Cross-Site Scripting Vulnerabilities - Sep09 (Linux)
#
# Authors:
# Sharath S <sharaths@secpod.com>
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

tag_impact = "Attacker can exploit this issue to conduct XSS attacks to inject arbitrary web
script or HTML.

Impact Level: Application";

tag_affected = "Opera version 9.x and 10.x on Linux.";

tag_insight = "An error in the application which can be exploited to obtain complete control
over feeds via a 'RSS' or 'Atom' feed. It is related to the rendering of the
application/rss+xml content type as 'scripted content.'.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is installed with Opera and is prone to multiple Cross-Site
Scripting vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900858");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-09-23 08:37:26 +0200 (Wed, 23 Sep 2009)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2009-3265", "CVE-2009-3266");
  script_bugtraq_id(36418);
  script_name("Opera Multiple Cross-Site Scripting Vulnerabilities - Sep09 (Linux)");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/archive/1/506517/100/0/threaded");
  script_xref(name : "URL" , value : "http://securethoughts.com/2009/09/exploiting-chrome-and-operas-inbuilt-atomrss-reader-with-script-execution-and-more/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Web application abuses");
  script_dependencies("secpod_opera_detection_linux_900037.nasl");
  script_mandatory_keys("Opera/Linux/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"executable_version");
  exit(0);
}


include("version_func.inc");

operaVer = get_kb_item("Opera/Linux/Version");
if(!operaVer){
  exit(0);
}

# Check for Opera version 9.x and 10.x
if(operaVer =~ "^(9|10)\..*"){
  security_message(0);
}
