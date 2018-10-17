###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_prdts_sec_bypass_n_info_disc_vuln_win.nasl 9911 2018-05-18 13:49:23Z cfischer $
#
# Mozilla Products Information Disclosure and Security Bypass Vulnerabilities (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.802152");
  script_version("$Revision: 9911 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-18 15:49:23 +0200 (Fri, 18 May 2018) $");
  script_tag(name:"creation_date", value:"2011-09-09 17:36:48 +0200 (Fri, 09 Sep 2011)");
  script_cve_id("CVE-2011-2990", "CVE-2011-2993");
  script_bugtraq_id(49246, 49248);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Mozilla Products Information Disclosure and Security Bypass Vulnerabilities (Windows)");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/45581");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2011/mfsa2011-29.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_portable_win.nasl",
                      "gb_seamonkey_detect_win.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Installed");
  script_tag(name : "impact" , value : "Successful exploitation will allow attackers to obtain sensitive information
  and bypass the application's security mechanism.
  Impact Level: Application");
  script_tag(name : "affected" , value : "SeaMonkey version 2.0 through 2.2
  Mozilla Firefox version 4.x through 5");
  script_tag(name : "insight" , value : "The flaws are due to implementation errors,
  - In Content Security Policy (CSP) violation reports, which fails to remove
    proxy-authorization credentials from the listed request headers.
  - In digital signatures for JAR files, which fails to prevent calls from
    unsigned JavaScript code to signed code.");
  script_tag(name : "summary" , value : "The host is installed with Mozilla firefox/seamonkey and is prone
  to information disclosure and security bypass vulnerabilities.");
  script_tag(name : "solution" , value : "Upgrade to Mozilla Firefox version 6.0 or later,
  For updates refer to http://www.mozilla.com/en-US/firefox/all.html

  Upgrade to SeaMonkey version to 2.3 or later
  http://www.mozilla.org/projects/seamonkey/");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");


ffVer = get_kb_item("Firefox/Win/Ver");
if(ffVer)
{
  if(version_in_range(version:ffVer, test_version:"4.0", test_version2:"5.0.1"))
  {
     security_message(0);
     exit(0);
  }
}

# SeaMonkey Check
seaVer = get_kb_item("Seamonkey/Win/Ver");
if(seaVer)
{
  if(version_in_range(version:seaVer, test_version:"2.0", test_version2:"2.2")){
     security_message(0);
  }
}
