###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_prdts_mult_bof_vuln_jun11_win.nasl 11997 2018-10-20 11:59:41Z mmartin $
#
# Adobe Reader and Acrobat Multiple BOF Vulnerabilities June-2011 (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (C) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802110");
  script_version("$Revision: 11997 $");
  script_cve_id("CVE-2011-2094", "CVE-2011-2095", "CVE-2011-2096", "CVE-2011-2097",
                "CVE-2011-2098", "CVE-2011-2099", "CVE-2011-2100", "CVE-2011-2101",
                "CVE-2011-2104", "CVE-2011-2105", "CVE-2011-2106");
  script_bugtraq_id(48240, 48242, 48243, 48244, 48245, 48246, 48252, 48255, 48251,
                    48248, 48249);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-20 13:59:41 +0200 (Sat, 20 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-07-01 16:09:45 +0200 (Fri, 01 Jul 2011)");
  script_name("Adobe Reader and Acrobat Multiple BOF Vulnerabilities June-2011 (Windows)");

  script_tag(name:"summary", value:"This host is installed with Adobe Reader/Acrobat and is prone to multiple
buffer overflow vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Multiple flaws are caused by buffer overflow errors in the applications, which
allows attackers to execute arbitrary code via unspecified vectors.");
  script_tag(name:"impact", value:"Successful exploitation will let local attackers to application to crash and
potentially take control of the affected system.");
  script_tag(name:"affected", value:"Adobe Acrobat version 8.0 to 8.2.6, 9.0 to 9.4.4 and 10.0 to 10.0.3

Adobe Reader version 8.0 to 8.2.6, 9.0 to 9.4.4 and 10.0 to 10.0.3");
  script_tag(name:"solution", value:"Upgrade to Adobe Acrobat and Reader version 10.1, 9.4.5 or 8.3 or later.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://www.adobe.com/support/security/bulletins/apsb11-16.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_win.nasl");
  script_mandatory_keys("Adobe/Air_or_Flash_or_Reader_or_Acrobat/Win/Installed");
  script_xref(name:"URL", value:"http://www.adobe.com/support/downloads/product.jsp?product=10&platform=Windows");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

CPE = "cpe:/a:adobe:acrobat_reader";
if(readerVer = get_app_version(cpe:CPE, nofork:TRUE))
{
  if(readerVer =~ "^(8|9|10)")
  {
    if(version_in_range(version:readerVer, test_version:"8.2", test_version2:"8.2.6")||
       version_in_range(version:readerVer, test_version:"9.0", test_version2:"9.4.4") ||
       version_in_range(version:readerVer, test_version:"10.0", test_version2:"10.0.3")){
      security_message( port: 0, data: "The target host was found to be vulnerable" );
    }
  }
}

CPE = "cpe:/a:adobe:acrobat";
if(acrobatVer = get_app_version(cpe:CPE))
{
  if(version_in_range(version:acrobatVer, test_version:"8.2", test_version2:"8.2.6")||
     version_in_range(version:acrobatVer, test_version:"9.0", test_version2:"9.4.4") ||
     version_in_range(version:acrobatVer, test_version:"10.0", test_version2:"10.0.3")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
exit(0);
