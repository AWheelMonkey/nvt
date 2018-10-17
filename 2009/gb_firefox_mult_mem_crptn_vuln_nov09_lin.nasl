###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_firefox_mult_mem_crptn_vuln_nov09_lin.nasl 11554 2018-09-22 15:11:42Z cfischer $
#
# Mozilla Firefox Multiple Memory Corruption Vulnerabilities Nov-09 (Linux)
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.801133");
  script_version("$Revision: 11554 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 17:11:42 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-11-02 14:39:30 +0100 (Mon, 02 Nov 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-3371", "CVE-2009-3377", "CVE-2009-3378",
                "CVE-2009-3379", "CVE-2009-3381", "CVE-2009-3383");
  script_bugtraq_id(36854, 36872, 36873, 36875, 36870, 36869);
  script_name("Mozilla Firefox Multiple Memory Corruption Vulnerabilities Nov-09 (Linux)");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2009/mfsa2009-54.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2009/mfsa2009-63.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2009/mfsa2009-64.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_firefox_detect_lin.nasl");
  script_mandatory_keys("Firefox/Linux/Ver");
  script_tag(name:"impact", value:"Successful exploitation will let attacker to cause Denial of Service or
  memory corrption on the user's system.");
  script_tag(name:"affected", value:"Firefox version 3.5 before 3.5.4 on Linux.");
  script_tag(name:"insight", value:"- An error exists when creating JavaScript web-workers recursively that can
    be exploited to trigger the use of freed memory.

  - An error in the embedded 'liboggz' or 'libvorbis' library that can be
    exploited to cause a crash.

  - An error exists in the 'oggplay_data_handle_theora_frame' function in
    media/liboggplay/src/liboggplay/oggplay_data.c in 'liboggplay' library that
    can be exploited to cause a crash.");
  script_tag(name:"solution", value:"Upgrade to Firefox version 3.5.4
  http://www.mozilla.com/en-US/firefox/all.html");
  script_tag(name:"summary", value:"This host is installed with Mozilla Firefox and is prone to multiple
  memory vorruption vulnerabilities.");
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

ffVer = get_kb_item("Firefox/Linux/Ver");
if(!ffVer){
  exit(0);
}

if(version_in_range(version:ffVer, test_version:"3.5", test_version2:"3.5.3")) {
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}
