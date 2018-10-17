###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_safari_mult_vuln_jun09_2.nasl 11557 2018-09-22 16:09:16Z cfischer $
#
# Apple Safari Multiple Vulnerabilities June-09 (Windows) - II
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
  script_oid("1.3.6.1.4.1.25623.1.0.800815");
  script_version("$Revision: 11557 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 18:09:16 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-06-16 15:11:01 +0200 (Tue, 16 Jun 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-1681", "CVE-2009-1682", "CVE-2009-1684", "CVE-2009-1685",
                "CVE-2009-1686", "CVE-2009-1687", "CVE-2009-1688", "CVE-2009-1689",
                "CVE-2009-1690", "CVE-2009-1691", "CVE-2009-1693", "CVE-2009-1694",
                "CVE-2009-1695", "CVE-2009-1696", "CVE-2009-1697", "CVE-2009-1698",
                "CVE-2009-1699");
  script_bugtraq_id(35317, 35315, 35319, 35311, 35309, 35320, 35271, 35322, 35270,
                    35318, 35321, 35260);
  script_name("Apple Safari Multiple Vulnerabilities June-09 (Windows) - II");
  script_xref(name:"URL", value:"http://support.apple.com/kb/HT3613");
  script_xref(name:"URL", value:"http://secunia.com/advisories/35379");
  script_xref(name:"URL", value:"http://www.vupen.com/english/advisories/2009/1522");
  script_xref(name:"URL", value:"http://scary.beasts.org/security/CESA-2009-006.html");
  script_xref(name:"URL", value:"http://scary.beasts.org/security/CESA-2009-008.html");
  script_xref(name:"URL", value:"http://www.zerodayinitiative.com/advisories/published");
  script_xref(name:"URL", value:"http://www.zerodayinitiative.com/advisories/ZDI-09-034");
  script_xref(name:"URL", value:"http://lists.apple.com/archives/security-announce/2009/jun/msg00002.html");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("secpod_apple_safari_detect_win_900003.nasl");
  script_mandatory_keys("AppleSafari/Version");
  script_tag(name:"impact", value:"Successful exploitation will let the attacker execute arbitrary code, bypass
  security restrictions, sensitive information disclosure, XSS attacks, execute
  JavaScript code, DoS attack and can cause other attacks.");
  script_tag(name:"affected", value:"Apple Safari version prior to 4.0 on Windows.");
  script_tag(name:"insight", value:"Refer to the reference links for more information on the vulnerabilities.");
  script_tag(name:"solution", value:"Upgrade to Safari version 4.0
  http://www.apple.com/support/downloads");
  script_tag(name:"summary", value:"This host is installed with Apple Safari Web Browser and is prone to
  to multiple vulnerabilities.");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");

safariVer = get_kb_item("AppleSafari/Version");
if(!safariVer){
  exit(0);
}

if(version_is_less(version:safariVer, test_version:"4.0")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}
