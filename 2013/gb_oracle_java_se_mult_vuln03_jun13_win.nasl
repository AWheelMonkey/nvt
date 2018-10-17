###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_java_se_mult_vuln03_jun13_win.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# Oracle Java SE Multiple Vulnerabilities -03 June 13 (Windows)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803821");
  script_version("$Revision: 11865 $");
  script_cve_id("CVE-2013-2473", "CVE-2013-2472", "CVE-2013-2471", "CVE-2013-2470",
                "CVE-2013-2469", "CVE-2013-2465", "CVE-2013-2464", "CVE-2013-2463",
                "CVE-2013-2459", "CVE-2013-2457", "CVE-2013-2456", "CVE-2013-2455",
                "CVE-2013-2454", "CVE-2013-2452", "CVE-2013-2450", "CVE-2013-2448",
                "CVE-2013-2447", "CVE-2013-2446", "CVE-2013-2445", "CVE-2013-2443",
                "CVE-2013-1500", "CVE-2013-1571");
  script_bugtraq_id(60623, 60656, 60659, 60651, 60658, 60657, 60631, 60655,
                    60647, 60632, 60641, 60619, 60650, 60617, 60638, 60640,
                    60629, 60620, 60639, 60646, 60627, 60634);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-06-24 17:10:36 +0530 (Mon, 24 Jun 2013)");
  script_name("Oracle Java SE Multiple Vulnerabilities -03 June 13 (Windows)");

  script_xref(name:"URL", value:"http://secunia.com/advisories/53846");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/javacpujun2013-1899847.html");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/javacpujun2013verbose-1899853.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_portable_win.nasl");
  script_mandatory_keys("Sun/Java/JRE/Win/Ver");
  script_tag(name:"impact", value:"Successful exploitation allows remote attackers to affect confidentiality,
  integrity, and availability via unknown vectors. Attackers can even execute
  arbitrary code on the target system.");
  script_tag(name:"affected", value:"Oracle Java SE Version 7 Update 21 and earlier, 6 Update 45 and earlier,
  and 5.0 Update 45 and earlier");
  script_tag(name:"insight", value:"Multiple flaws are due to unspecified errors in the 2D, AWT, JMX, JDBC, CORBA,
  serialization, libraries, Sound, Networking, Hotspot and Javadoc components.");
  script_tag(name:"summary", value:"This host is installed with Oracle Java SE and is prone to
  multiple vulnerabilities.");
  script_tag(name:"solution", value:"Apply patch  *****
  NOTE: Ignore this warning if above mentioned patch is installed.
  *****");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/javacpujun2013-1899847.html");
  exit(0);
}


include("version_func.inc");

jreVer = get_kb_item("Sun/Java/JRE/Win/Ver");

if(jreVer && jreVer =~ "^(1\.(7|6|5))")
{
  if(version_in_range(version:jreVer, test_version:"1.7", test_version2:"1.7.0.21")||
     version_in_range(version:jreVer, test_version:"1.6", test_version2:"1.6.0.45")||
     version_in_range(version:jreVer, test_version:"1.5", test_version2:"1.5.0.45"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}
