###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_prdts_sec_bypass_vuln_macosx.nasl 11997 2018-10-20 11:59:41Z mmartin $
#
# Mozilla Products Same Origin Policy Bypass Vulnerability (MAC OS X)
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
  script_oid("1.3.6.1.4.1.25623.1.0.802183");
  script_version("$Revision: 11997 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-20 13:59:41 +0200 (Sat, 20 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-10-14 14:22:41 +0200 (Fri, 14 Oct 2011)");
  script_cve_id("CVE-2011-2999");
  script_bugtraq_id(49848);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("Mozilla Products Same Origin Policy Bypass Vulnerability (MAC OS X)");

  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2011/mfsa2011-38.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/projects/seamonkey/");
  script_xref(name:"URL", value:"http://www.mozilla.org/en-US/thunderbird/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Mac/Installed");
  script_tag(name:"impact", value:"Successful exploitation will let attackers to bypass the same-origin policy,
  execute arbitrary script code, obtain potentially sensitive information, or
  launch spoofing attacks against other sites.");
  script_tag(name:"affected", value:"SeaMonkey version prior to 2.3
  Thunderbird version prior to 6.0
  Mozilla Firefox before 3.6.23 and 4.x through 5");
  script_tag(name:"insight", value:"The flaw is due to some plugins, which use the value of
  'window.location' to determine the page origin this could fool the plugin
  into granting the plugin content access to another site or the local file
  system in violation of the Same Origin Policy.");
  script_tag(name:"summary", value:"The host is installed with Mozilla firefox/thunderbird/seamonkey
  and is prone to same origin policy bypass vulnerability.");
  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox version 3.6.23 or 6.0 or later, Upgrade to SeaMonkey version to 2.3 or later.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.mozilla.com/en-US/firefox/all.html");
  exit(0);
}


include("version_func.inc");

ffVer = get_kb_item("Mozilla/Firefox/MacOSX/Version");
if(ffVer)
{
  if(version_is_less(version:ffVer, test_version:"3.6.23")||
     version_in_range(version:ffVer, test_version:"4.0", test_version2:"5.0"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

seaVer = get_kb_item("SeaMonkey/MacOSX/Version");
if(seaVer)
{
  if(version_is_less(version:seaVer, test_version:"2.3"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

tbVer = get_kb_item("ThunderBird/MacOSX/Version");
if(tbVer != NULL)
{
  if(version_is_less(version:tbVer, test_version:"6.0")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
