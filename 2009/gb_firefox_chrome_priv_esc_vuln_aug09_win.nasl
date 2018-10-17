###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_firefox_chrome_priv_esc_vuln_aug09_win.nasl 9912 2018-05-18 13:54:07Z cfischer $
#
# Mozilla Firefox Chrome Privilege Escalation Vulnerability Aug-09 (Windows)
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.800859");
  script_version("$Revision: 9912 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-18 15:54:07 +0200 (Fri, 18 May 2018) $");
  script_tag(name:"creation_date", value:"2009-08-07 07:29:21 +0200 (Fri, 07 Aug 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-2665");
  script_bugtraq_id(35928);
  script_name("Mozilla Firefox Chrome Privilege Escalation Vulnerability Aug-09 (Windows)");
  script_xref(name : "URL" , value : "https://bugzilla.mozilla.org/show_bug.cgi?id=498897");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2009/mfsa2009-46.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Privilege escalation");
  script_dependencies("gb_firefox_detect_portable_win.nasl");
  script_mandatory_keys("Firefox/Win/Ver");
  script_tag(name : "impact" , value : "Successful exploitation will let attacker to execute arbitrary JavaScript with
  chrome privileges when certain add-ons are enabled.
  Impact Level: Application");
  script_tag(name : "affected" , value : "Firefox version 3.5 before 3.5.2 on Windows.");
  script_tag(name : "insight" , value : "Error in 'nsDocument::SetScriptGlobalObject()' function in 'nsDocument.cpp' in
  content/base/src/ which does not properly handle a Link HTTP header, which
  allows remote attackers to execute arbitrary JavaScript with chrome
  privileges via a crafted web page, related to an incorrect security wrapper.");
  script_tag(name : "solution" , value : "Upgrade to Firefox version 3.5.2
  http://www.mozilla.com/en-US/firefox/all.html");
  script_tag(name : "summary" , value : "This host is installed with Mozilla Firefox and is prone to Chrome
  Privilege Escalation vulnerability.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

ffVer = get_kb_item("Firefox/Win/Ver");
if(!ffVer){
  exit(0);
}

if(version_in_range(version:ffVer, test_version:"3.5",
                                  test_version2:"3.5.1")){
  security_message(0);
}
