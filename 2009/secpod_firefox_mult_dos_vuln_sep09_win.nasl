###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_firefox_mult_dos_vuln_sep09_win.nasl 12629 2018-12-03 15:19:43Z cfischer $
#
# Mozilla Firefox Multiple Denial Of Service Vulnerabilities - Sep09 (Windows)
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.900844");
  script_version("$Revision: 12629 $");
  script_tag(name:"last_modification", value:"$Date: 2018-12-03 16:19:43 +0100 (Mon, 03 Dec 2018) $");
  script_tag(name:"creation_date", value:"2009-09-11 18:01:06 +0200 (Fri, 11 Sep 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-3070", "CVE-2009-3074", "CVE-2009-3076");
  script_bugtraq_id(36343);
  script_name("Mozilla Firefox Multiple Denial Of Service Vulnerabilities - Sep09 (Windows)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/36671/");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2009/mfsa2009-47.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2009/mfsa2009-48.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Denial of Service");
  script_dependencies("gb_firefox_detect_portable_win.nasl");
  script_mandatory_keys("Firefox/Win/Ver");

  script_tag(name:"impact", value:"A remote, unauthenticated attacker could execute arbitrary code or cause
  a vulnerable application to crash.");

  script_tag(name:"affected", value:"Mozilla Firefox version prior to 3.0.14 on Windows.");

  script_tag(name:"insight", value:"- Multiple errors in the browser and JavaScript engines can be exploited
  to corrupt memory.

  - The warning dialog displayed when adding or removing security modules
  via 'pkcs11.addmodule' or 'pkcs11.deletemodule' does not contain enough
  information. This can be exploited to potentially trick a user into
  installing a malicious PKCS11 module.");

  script_tag(name:"solution", value:"Upgrade to Firefox version 3.0.14 or later.");

  script_tag(name:"summary", value:"The host is installed with Firefox browser and is prone to multiple
  Denial of Service vulnerabilities.");

  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");

ffVer = get_kb_item("Firefox/Win/Ver");
if(!ffVer)
{
  exit(0);
}

if(version_is_less(version:ffVer, test_version:"3.0.14")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}
