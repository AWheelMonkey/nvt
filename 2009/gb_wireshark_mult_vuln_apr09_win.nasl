###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_mult_vuln_apr09_win.nasl 11554 2018-09-22 15:11:42Z cfischer $
#
# Wireshark Multiple Unspecified Vulnerability - Apr09 (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.800396");
  script_version("$Revision: 11554 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 17:11:42 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-04-20 14:33:23 +0200 (Mon, 20 Apr 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-1210", "CVE-2009-1266", "CVE-2009-1267", "CVE-2009-1268",
                "CVE-2009-1269");
  script_bugtraq_id(34291, 34457);
  script_name("Wireshark Multiple Unspecified Vulnerability - Apr09 (Windows)");
  script_xref(name:"URL", value:"http://milw0rm.com/exploits/8308");
  script_xref(name:"URL", value:"http://secunia.com/advisories/34778");
  script_xref(name:"URL", value:"http://secunia.com/advisories/34542");
  script_xref(name:"URL", value:"http://securitytracker.com/alerts/2009/Apr/1022027.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_wireshark_detect_win.nasl");
  script_mandatory_keys("Wireshark/Win/Ver");
  script_tag(name:"impact", value:"Successful exploitation could result in denial of service condition.");
  script_tag(name:"affected", value:"Wireshark version 0.9.6 to 1.0.6 on Windows");
  script_tag(name:"insight", value:"- Error exists while processing PN-DCP packet with format string specifiers
    in PROFINET/DCP (PN-DCP) dissector.

  - Error in unknown impact and attack vectors.

  - Error in Lightweight Directory Access Protocol (LDAP) dissector when
    processing unknown attack vectors.

  - Error in Check Point High-Availability Protocol (CPHAP) when processing
    crafted FWHA_MY_STATE packet.

  - An error exists while processing malformed Tektronix .rf5 file.");
  script_tag(name:"solution", value:"Upgrade to Wireshark 1.0.7
  http://www.wireshark.org/download.html");
  script_tag(name:"summary", value:"This host is installed with Wireshark and is prone to multiple
  unspecified vulnerability.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

sharkVer = get_kb_item("Wireshark/Win/Ver");
if(!sharkVer){
  exit(0);
}

if(version_is_less(version:sharkVer, test_version:"1.0.7")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}
