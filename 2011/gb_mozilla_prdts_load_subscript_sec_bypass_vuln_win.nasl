###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_prdts_load_subscript_sec_bypass_vuln_win.nasl 9911 2018-05-18 13:49:23Z cfischer $
#
# Mozilla Firefox and SeaMonkey 'loadSubScript()' Security Bypass Vulnerability (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.802176");
  script_version("$Revision: 9911 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-18 15:49:23 +0200 (Fri, 18 May 2018) $");
  script_tag(name:"creation_date", value:"2011-10-04 16:55:13 +0200 (Tue, 04 Oct 2011)");
  script_cve_id("CVE-2011-3004");
  script_bugtraq_id(49852);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("Mozilla Firefox and SeaMonkey 'loadSubScript()' Security Bypass Vulnerability");

  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2011/mfsa2011-43.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_portable_win.nasl",
                      "gb_seamonkey_detect_win.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Installed");
  script_tag(name : "impact" , value : "Successful exploitation will let attackers to gain privileges via a crafted
  web site that leverages certain unwrapping behavior.
  Impact Level: Application");
  script_tag(name : "affected" , value : "SeaMonkey version prior to 2.4
  Mozilla Firefox version 4.x through 6");
  script_tag(name : "insight" , value : "The flaw is due to an error while handling 'XPCNativeWrappers'
  during calls to the loadSubScript method in an add-on.");
  script_tag(name : "summary" , value : "The host is installed with Mozilla firefox/seamonkey and is prone
  to security bypass vulnerability.");
  script_tag(name : "solution" , value : "Upgrade to Mozilla Firefox version 7.0 or later,
  For updates refer to http://www.mozilla.com/en-US/firefox/all.html

  Upgrade to SeaMonkey version to 2.4 or later
  http://www.mozilla.org/projects/seamonkey/");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");


ffVer = get_kb_item("Firefox/Win/Ver");
if(ffVer)
{
  if(version_in_range(version:ffVer, test_version:"4.0", test_version2:"6.0"))
  {
    security_message(0);
    exit(0);
  }
}

# SeaMonkey Check
seaVer = get_kb_item("Seamonkey/Win/Ver");
if(seaVer)
{
  if(version_is_less(version:seaVer, test_version:"2.4")){
    security_message(0);
  }
}
