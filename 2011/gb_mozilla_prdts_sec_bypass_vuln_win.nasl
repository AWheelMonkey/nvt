###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_prdts_sec_bypass_vuln_win.nasl 10135 2018-06-08 11:42:28Z asteins $
#
# Mozilla Products Same Origin Policy Bypass Vulnerability (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802172");
  script_version("$Revision: 10135 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-08 13:42:28 +0200 (Fri, 08 Jun 2018) $");
  script_tag(name:"creation_date", value:"2011-10-04 16:55:13 +0200 (Tue, 04 Oct 2011)");
  script_cve_id("CVE-2011-2999");
  script_bugtraq_id(49848);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("Mozilla Products Same Origin Policy Bypass Vulnerability (Windows)");

  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2011/mfsa2011-38.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_portable_win.nasl",
                      "gb_seamonkey_detect_win.nasl",
                      "gb_thunderbird_detect_portable_win.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Installed");
  script_tag(name : "impact" , value : "Successful exploitation will let attackers to bypass the same-origin policy,
  execute arbitrary script code, obtain potentially sensitive information, or
  launch spoofing attacks against other sites.
  Impact Level: System/Application");
  script_tag(name : "affected" , value : "SeaMonkey version prior to 2.3
  Thunderbird version prior to 6.0
  Mozilla Firefox before 3.6.23 and 4.x through 5");
  script_tag(name : "insight" , value : "The flaw is due to some plugins, which use the value of
  'window.location' to determine the page origin this could fool the plugin
  into granting the plugin content access to another site or the local file
  system in violation of the Same Origin Policy.");
  script_tag(name : "summary" , value : "The host is installed with Mozilla firefox/thunderbird/seamonkey
  and is prone to same origin policy bypass vulnerability.");
  script_tag(name : "solution" , value : "Upgrade to Mozilla Firefox version 3.6.23 or 6.0 or later,
  For updates refer to http://www.mozilla.com/en-US/firefox/all.html

  Upgrade to SeaMonkey version to 2.3 or later
  http://www.mozilla.org/projects/seamonkey/

  Upgrade to Thunderbird version to 6.0 or later
  http://www.mozilla.org/en-US/thunderbird/");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");


ffVer = get_kb_item("Firefox/Win/Ver");
if(ffVer)
{
  if(version_is_less(version:ffVer, test_version:"3.6.23") ||
     version_in_range(version:ffVer, test_version:"4.0", test_version2:"5.0"))
  {
     security_message( port: 0, data: "The target host was found to be vulnerable" );
     exit(0);
  }
}

# SeaMonkey Check
seaVer = get_kb_item("Seamonkey/Win/Ver");
if(seaVer)
{
  if(version_is_less(version:seaVer, test_version:"2.3"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

# Thunderbird Check
tbVer = get_kb_item("Thunderbird/Win/Ver");
if(tbVer != NULL)
{
  if(version_is_less(version:tbVer, test_version:"6.0")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
