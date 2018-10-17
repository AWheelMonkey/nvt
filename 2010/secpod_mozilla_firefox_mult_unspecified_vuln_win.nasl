###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_mozilla_firefox_mult_unspecified_vuln_win.nasl 9912 2018-05-18 13:54:07Z cfischer $
#
# Mozilla Firefox Multiple Unspecified Vulnerabilities june-10 (Windows)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902208");
  script_version("$Revision: 9912 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-18 15:54:07 +0200 (Fri, 18 May 2018) $");
  script_tag(name:"creation_date", value:"2010-07-01 15:58:11 +0200 (Thu, 01 Jul 2010)");
  script_cve_id("CVE-2010-1203");
  script_bugtraq_id(41050);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Mozilla Firefox Multiple Unspecified Vulnerabilities june-10 (Windows)");
  script_xref(name : "URL" , value : "https://bugzilla.mozilla.org/show_bug.cgi?id=524921");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2010/mfsa2010-26.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 SecPod");
  script_family("General");
  script_dependencies("gb_firefox_detect_portable_win.nasl");
  script_mandatory_keys("Firefox/Win/Ver");
  script_tag(name : "impact" , value : "Successful exploitation will let attackers to cause a denial of service
  or execute arbitrary code.
  Impact Level: Application");
  script_tag(name : "affected" , value : "Firefox version 3.6.x before 3.6.4");
  script_tag(name : "insight" , value : "Multiple flaws are due to unspecified vulnerabilities in the 'JavaScript'
  engine, which allows  attackers to cause a denial of service or execute
  arbitrary code via unknown vectors.");
  script_tag(name : "solution" , value : "Upgrade to Firefox version 3.6.4,
  http://www.mozilla.com/en-US/firefox/all.html");
  script_tag(name : "summary" , value : "The host is installed with Mozilla Firefox and is prone to multiple unspecified
  vulnerabilities.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");


ffVer = get_kb_item("Firefox/Win/Ver");
if(ffVer)
{
  if(version_in_range(version:ffVer, test_version:"3.6.0", test_version2:"3.6.3")){
    security_message(0);
  }
}
