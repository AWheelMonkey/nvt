###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_mult_vuln01_nov12_macosx.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# Mozilla Firefox ESR Multiple Vulnerabilities-01 November12 (Mac OS X)
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803361");
  script_version("$Revision: 11865 $");
  script_cve_id("CVE-2012-4209", "CVE-2012-4214", "CVE-2012-4215", "CVE-2012-4216",
                "CVE-2012-4201", "CVE-2012-4202", "CVE-2012-4207", "CVE-2012-5842",
                "CVE-2012-5841", "CVE-2012-5829", "CVE-2012-5830", "CVE-2012-5833",
                "CVE-2012-5835", "CVE-2012-5839", "CVE-2012-5840");
  script_bugtraq_id(56629, 56628, 56633, 56634, 56618, 56614, 56632, 56611,
                    56631, 56636, 56641, 56642, 56637, 56635);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2012-11-26 11:10:03 +0530 (Mon, 26 Nov 2012)");
  script_name("Mozilla Firefox ESR Multiple Vulnerabilities-01 November12 (Mac OS X)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/51358");
  script_xref(name:"URL", value:"http://securitytracker.com/id?1027791");
  script_xref(name:"URL", value:"http://securitytracker.com/id?1027792");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2012/mfsa2012-91.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2012/mfsa2012-92.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2012/mfsa2012-93.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2012/mfsa2012-100.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2012/mfsa2012-101.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2012/mfsa2012-103.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2012/mfsa2012-105.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2012/mfsa2012-106.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("Mozilla/Firefox-ESR/MacOSX/Version");
  script_tag(name:"impact", value:"Successful exploitation could allow attackers to inject scripts, bypass
  certain security restrictions, execute arbitrary code in the context of the
  browser.");
  script_tag(name:"affected", value:"Mozilla Firefox ESR version 10.x before 10.0.11 on Mac OS X");
  script_tag(name:"insight", value:"- The 'location' property can be accessed through 'top.location' with a
    frame whose name attributes value is set to 'top'.

  - Use-after-free error exists within the functions
    'nsTextEditorState::PrepareEditor', 'gfxFont::GetFontEntry',
    'nsWindow::OnExposeEvent' and 'nsPlaintextEditor::FireClipboardEvent'.

  - An error within the 'evalInSandbox()' when handling the 'location.href'
    property.

  - Error when rendering GIF images.");
  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox ESR version 10.0.11 or later.");
  script_tag(name:"summary", value:"This host is installed with Mozilla Firefox ESR and is prone to multiple
  vulnerabilities.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.mozilla.com/en-US/firefox/all.html");
  exit(0);
}


include("version_func.inc");

fesrVer = get_kb_item("Mozilla/Firefox-ESR/MacOSX/Version");
if(fesrVer && fesrVer =~ "^10\.0")
{
  if(version_in_range(version:fesrVer, test_version:"10.0", test_version2:"10.0.10"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}
