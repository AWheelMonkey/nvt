###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_discloser_sql_inj_vuln.nasl 8266 2018-01-01 07:28:32Z teissa $
#
# Discloser 'more' Parameter SQL Injection Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation could allow execution of arbitrary SQL
commands in the affected application.

Impact Level: Application";

tag_affected = "Discloser version 0.0.4 rc2";

tag_insight = "The flaw is due to input validation error in the 'index.php'
script when processing the 'more' parameter.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is running Discloser and is prone to SQL injection
vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902138");
  script_version("$Revision: 8266 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-01 08:28:32 +0100 (Mon, 01 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-03-23 15:59:14 +0100 (Tue, 23 Mar 2010)");
  script_cve_id("CVE-2009-4719");
  script_bugtraq_id(35923);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Discloser 'more' Parameter SQL Injection Vulnerability");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/9349");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/archive/1/505478/100/0/threaded");

  script_tag(name:"qod_type", value:"remote_banner");
  script_copyright("Copyright (c) 2010 SecPod");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("secpod_discloser_detect.nasl");
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

discport = get_http_port(default:80);
if(!discport){
  exit(0);
}

discver = get_kb_item("www/" + discport + "/Discloser");
if(isnull(discver)){
  exit(0);
}

discver = eregmatch(pattern:"^(.+) under (/.*)$", string:discver);
if(!isnull(discver[1]))
{
  # Discloser version 0.0.4 rc2
   if(version_is_equal(version:discver[1], test_version:"0.0.4.rc2")){
    security_message(discport);
  }
}
