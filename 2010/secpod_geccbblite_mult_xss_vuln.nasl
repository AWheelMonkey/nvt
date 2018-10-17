###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_geccbblite_mult_xss_vuln.nasl 11498 2018-09-20 10:34:34Z jschulte $
#
# geccBBlite Multiple Cross-Site Scripting Vulnerabilities
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900747");
  script_version("$Revision: 11498 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-20 12:34:34 +0200 (Thu, 20 Sep 2018) $");
  script_tag(name:"creation_date", value:"2010-02-26 10:13:54 +0100 (Fri, 26 Feb 2010)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2009-4649");
  script_bugtraq_id(35449);
  script_name("geccBBlite Multiple Cross-Site Scripting Vulnerabilities");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/56278");
  script_xref(name:"URL", value:"http://groups.csail.mit.edu/pag/ardilla/");

  script_tag(name:"qod_type", value:"remote_banner");
  script_copyright("Copyright (C) 2010 SecPod");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("secpod_geccbblite_detect.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to inject arbitrary web
  script or HTML in a user's browser session in the context of an affected site.");
  script_tag(name:"affected", value:"geccBBlite version 0.1 and prior");
  script_tag(name:"insight", value:"Flaws are caused by improper validation of user-supplied input in multiple
  scripts. This can be exploited using the 'postatoda' parameter to inject
  malicious script into a Web page.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"solution", value:"Upgrade to geccBBlite version 0.2 or later.
  For updates refer to http://sourceforge.net/projects/geccnuke/");
  script_tag(name:"summary", value:"The host is running geccBBlite and is prone to multiple Cross-Site
  Scripting vulnerabilities.");
  exit(0);
}


include("http_func.inc");
include("version_func.inc");

gbbPort = get_http_port(default:80);
if(!gbbPort){
  exit(0);
}

gcbbVer = get_kb_item("www/" + gbbPort + "/geccBBlite");
if(isnull(gcbbVer)){
  exit(0);
}

gcbbVer = eregmatch(pattern:"^(.+) under (/.*)$", string:gcbbVer);
if(gcbbVer[1] != NULL)
{
  if(version_is_less_equal(version:gcbbVer[1], test_version:"1.0")){
    security_message(gbbPort);
  }
}
