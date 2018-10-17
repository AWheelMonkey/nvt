###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_wiretap_dos_vuln_nov09_win.nasl 11554 2018-09-22 15:11:42Z cfischer $
#
# Wireshark 'wiretap/erf.c' Unsigned Integer Wrap Vulnerability - Nov09 (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.801036");
  script_version("$Revision: 11554 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 17:11:42 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-11-04 07:03:36 +0100 (Wed, 04 Nov 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-3829");
  script_bugtraq_id(36846);
  script_name("Wireshark 'wiretap/erf.c' Unsigned Integer Wrap Vulnerability - Nov09 (Windows)");
  script_xref(name:"URL", value:"http://www.kb.cert.org/vuls/id/676492");
  script_xref(name:"URL", value:"https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3849");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_wireshark_detect_win.nasl");
  script_mandatory_keys("Wireshark/Win/Ver");
  script_tag(name:"impact", value:"Successful remote exploitation will let the attacker execute arbitrary code
  or cause a Denial of Service.");
  script_tag(name:"affected", value:"Wireshark version prior to 1.2.2 on Windows.");
  script_tag(name:"insight", value:"The flaw exists due to an integer overflow error in 'wiretap/erf.c' when
  processing an 'erf' file causes Wireshark to allocate a very large buffer.");
  script_tag(name:"solution", value:"Upgrade to Wireshark 1.2.2
  http://www.wireshark.org/download.html");
  script_tag(name:"summary", value:"This host is installed with Wireshark and is prone to unsigned integer
  wrap vulnerability.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

sharkVer = get_kb_item("Wireshark/Win/Ver");
if(!sharkVer){
  exit(0);
}

if(version_is_less(version:sharkVer, test_version:"1.2.2")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}
