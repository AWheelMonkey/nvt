###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_seamonkey_mult_vuln_aug13_macosx.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# Mozilla SeaMonkey Multiple Vulnerabilities - August 13 (Mac OS X)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803861");
  script_version("$Revision: 11865 $");
  script_cve_id("CVE-2013-1701", "CVE-2013-1702", "CVE-2013-1704", "CVE-2013-1705",
                "CVE-2013-1708", "CVE-2013-1709", "CVE-2013-1710", "CVE-2013-1711",
                "CVE-2013-1713", "CVE-2013-1714", "CVE-2013-1717");
  script_bugtraq_id(61641);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-08-08 17:35:59 +0530 (Thu, 08 Aug 2013)");
  script_name("Mozilla SeaMonkey Multiple Vulnerabilities - August 13 (Mac OS X)");
  script_tag(name:"summary", value:"The host is installed with Mozilla SeaMonkey and is prone to multiple
vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"solution", value:"Upgrade to version 2.20 or later.");
  script_tag(name:"insight", value:"Multiple flaws due to,

  - Error in crypto.generateCRMFRequest function.

  - Does not properly restrict local-filesystem access by Java applets.

  - Multiple Unspecified vulnerabilities in the browser engine.

  - Web Workers implementation is not properly restrict XMLHttpRequest calls.

  - Usage of incorrect URI within unspecified comparisons during enforcement
  of the Same Origin Policy.

  - The XrayWrapper implementation does not properly address the possibility
  of an XBL scope bypass resulting from non-native arguments in XBL
  function calls.

  - Improper handling of interaction between FRAME elements and history.

  - Improper handling of WAV file by the nsCString::CharAt function.

  - Heap-based buffer underflow in the cryptojs_interpret_key_gen_type function.

  - Use-after-free vulnerability in the nsINode::GetParentNode function.");
  script_tag(name:"affected", value:"Mozilla SeaMonkey before 2.20 on Mac OS X");
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to execute arbitrary code, obtain potentially sensitive information, gain escalated privileges, bypass
security restrictions, perform unauthorized actions and other attacks may
also be possible.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/54413");
  script_xref(name:"URL", value:"https://bugzilla.mozilla.org/show_bug.cgi?id=406541");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2013/mfsa2013-75.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("SeaMonkey/MacOSX/Version");
  script_xref(name:"URL", value:"http://www.mozilla.org/projects/seamonkey");
  exit(0);
}


include("version_func.inc");

smVer = get_kb_item("SeaMonkey/MacOSX/Version");

if(smVer)
{
  if(version_is_less(version:smVer, test_version:"2.20"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}
