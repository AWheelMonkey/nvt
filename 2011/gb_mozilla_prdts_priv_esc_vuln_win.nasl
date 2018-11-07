###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_prdts_priv_esc_vuln_win.nasl 11997 2018-10-20 11:59:41Z mmartin $
#
# Mozilla Products Privilege Escalation Vulnerability (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.802517");
  script_version("$Revision: 11997 $");
  script_cve_id("CVE-2011-3647");
  script_bugtraq_id(50589);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-20 13:59:41 +0200 (Sat, 20 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-11-11 15:30:20 +0530 (Fri, 11 Nov 2011)");
  script_name("Mozilla Products Privilege Escalation Vulnerabily (Windows)");

  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2011/mfsa2011-46.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Privilege escalation");
  script_dependencies("gb_firefox_detect_portable_win.nasl",
                      "gb_thunderbird_detect_portable_win.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Installed");
  script_tag(name:"impact", value:"Successful exploitation will let attackers to gain privileges via a crafted
  web site that leverages certain unwrapping behavior.");
  script_tag(name:"affected", value:"Thunderbird version prior to 3.1.16
  Mozilla Firefox version prior to 3.6.24");
  script_tag(name:"insight", value:"The flaws are due to

  - Error in JSSubScriptLoader, which fails to handle XPCNativeWrappers during
    calls to the loadSubScript method in an add-on.");
  script_tag(name:"summary", value:"The host is installed with Mozilla firefox/thunderbird and is prone
  to privilege escalation vulnerability.");
  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox version 3.6.24 or later, Upgrade to Thunderbird version to 3.1.16 or later.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.mozilla.com/en-US/firefox/all.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/en-US/thunderbird/");
  exit(0);
}


include("version_func.inc");


ffVer = get_kb_item("Firefox/Win/Ver");
if(ffVer)
{
  if(version_is_less(version:ffVer, test_version:"3.6.24"))
  {
     security_message( port: 0, data: "The target host was found to be vulnerable" );
     exit(0);
  }
}

tbVer = get_kb_item("Thunderbird/Win/Ver");
if(tbVer != NULL)
{
  if(version_is_less(version:tbVer, test_version:"3.1.16")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
