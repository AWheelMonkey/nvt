###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_prdts_mult_unspecified_vuln_macosx.nasl 11997 2018-10-20 11:59:41Z mmartin $
#
# Mozilla Products Multiple Unspecified Vulnerabilities (MAC OS X)
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
  script_oid("1.3.6.1.4.1.25623.1.0.802515");
  script_version("$Revision: 11997 $");
  script_cve_id("CVE-2011-3651");
  script_bugtraq_id(50597);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-20 13:59:41 +0200 (Sat, 20 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-11-14 13:12:46 +0530 (Mon, 14 Nov 2011)");
  script_name("Mozilla Products Multiple Unspecified Vulnerabilities (MAC OS X)");

  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2011/mfsa2011-48.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Mac/Installed");
  script_tag(name:"impact", value:"Successful exploitation will let attackers to cause denial of service and
  execute arbitrary code via unspecified vectors.");
  script_tag(name:"affected", value:"Thunderbird version 7.0
  Mozilla Firefox version 7.0");
  script_tag(name:"insight", value:"The flaws are due to unspecified errors in the browser engine.");
  script_tag(name:"summary", value:"The host is installed with Mozilla firefox/thunderbird and is prone
  to multiple vulnerabilities.");
  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox version 8.0 or later, Upgrade to Thunderbird version to 8.0 or later.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.mozilla.com/en-US/firefox/all.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/en-US/thunderbird/");
  exit(0);
}


include("version_func.inc");

ffVer = get_kb_item("Mozilla/Firefox/MacOSX/Version");
if(ffVer)
{
  if(version_is_equal(version:ffVer, test_version:"7.0"))
  {
     security_message( port: 0, data: "The target host was found to be vulnerable" );
     exit(0);
  }
}

tbVer = get_kb_item("ThunderBird/MacOSX/Version");
if(tbVer != NULL)
{
  if(version_is_equal(version:tbVer, test_version:"7.0")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
