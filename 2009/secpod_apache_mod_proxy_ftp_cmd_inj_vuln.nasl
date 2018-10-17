###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_apache_mod_proxy_ftp_cmd_inj_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Apache 'mod_proxy_ftp' Module Command Injection Vulnerability (Linux)
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

tag_impact = "Successful exploitation could allow remote attackers to bypass intended access
  restrictions in the context of the affected application, and can cause the
  arbitrary command injection.
  Impact Level: Application";
tag_affected = "Apache HTTP Server on Linux.";
tag_insight = "The flaw is due to error in the mod_proxy_ftp module which can be exploited
  via vectors related to the embedding of these commands in the Authorization
  HTTP header.";
tag_solution = "Upgrade to Apache HTTP Server version 2.2.15 or later
  For updates refer to http://www.apache.org/";
tag_summary = "The host is running Apache and is prone to Command Injection
  vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900842");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-09-16 15:34:19 +0200 (Wed, 16 Sep 2009)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_cve_id("CVE-2009-3095");
  script_bugtraq_id(36254);
  script_name("Apache 'mod_proxy_ftp' Module Command Injection Vulnerability (Linux)");
  script_xref(name : "URL" , value : "http://intevydis.com/vd-list.shtml");
  script_xref(name : "URL" , value : "http://httpd.apache.org/docs/2.0/mod/mod_proxy_ftp.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("General");
  script_dependencies("gb_get_http_banner.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("apache/banner");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("http_func.inc");
include("version_func.inc");
include("global_settings.inc");

apachePort = get_http_port(default:80);
if(!apachePort){
  apachePort = 80;
}

if(!get_port_state(apachePort))
{
  exit(0);
}

banner = get_http_banner(port:apachePort);
if(banner =~ "Apache/([0-9.]+) \(Win32\)")
{
  exit(0);
}

apacheVer = eregmatch(pattern:"Server: Apache/([0-9.]+)", string:banner);
if(apacheVer[1] != NULL)
{
  # Grep for Apache version <= 1.3.41 or 2.0 <= 2.0.63 or 2.1 <= 2.2.13
  if(version_is_less_equal(version:apacheVer[1], test_version:"1.3.41") ||
     version_in_range(version:apacheVer[1], test_version:"2.0", test_version2:"2.0.63")||
     version_in_range(version:apacheVer[1], test_version:"2.1", test_version2:"2.2.13")){
     security_message(apachePort);
  }
}
