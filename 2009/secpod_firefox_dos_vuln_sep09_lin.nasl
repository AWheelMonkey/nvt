###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_firefox_dos_vuln_sep09_lin.nasl 11554 2018-09-22 15:11:42Z cfischer $
#
# Mozilla Firefox Denial Of Service Vulnerability - Sep09 (Linux)
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
  script_oid("1.3.6.1.4.1.25623.1.0.900850");
  script_version("$Revision: 11554 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 17:11:42 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-09-11 18:01:06 +0200 (Fri, 11 Sep 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-3069", "CVE-2009-3073");
  script_bugtraq_id(36343);
  script_name("Mozilla Firefox Denial Of Service Vulnerability - Sep09 (Linux)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/36671/");
  script_xref(name:"URL", value:"http://www.vupen.com/english/advisories/2009/2585");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2009/mfsa2009-47.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Denial of Service");
  script_dependencies("gb_firefox_detect_lin.nasl");
  script_mandatory_keys("Firefox/Linux/Ver");
  script_tag(name:"impact", value:"A remote, unauthenticated attacker could execute arbitrary code or cause a
  vulnerable application to crash.");
  script_tag(name:"affected", value:"Mozilla Firefox version 3.5 before 3.5.3 on Linux.");
  script_tag(name:"insight", value:"The flaws are due to multiple errors in the browser and JavaScript engines
  that can be exploited to corrupt memory.");
  script_tag(name:"solution", value:"Upgrade to Firefox version 3.5.3
  http://www.mozilla.com/en-US/firefox/all.html");
  script_tag(name:"summary", value:"The host is installed with Firefox browser and is prone to Denial
  of Service vulnerabilities.");
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

ffVer = get_kb_item("Firefox/Linux/Ver");
if(!ffVer)
{
  exit(0);
}

if(version_in_range(version:ffVer,test_version:"3.5", test_version2:"3.5.2")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}
