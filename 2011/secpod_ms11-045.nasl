###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms11-045.nasl 11560 2018-09-24 06:18:38Z cfischer $
#
# Microsoft Office Excel Remote Code Execution Vulnerabilities (2537146)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902378");
  script_version("$Revision: 11560 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-24 08:18:38 +0200 (Mon, 24 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-06-15 15:55:00 +0200 (Wed, 15 Jun 2011)");
  script_cve_id("CVE-2011-1272", "CVE-2011-1273", "CVE-2011-1274", "CVE-2011-1275",
                "CVE-2011-1276", "CVE-2011-1277", "CVE-2011-1278", "CVE-2011-1279");
  script_bugtraq_id(48158, 48159, 48157, 48160, 48161, 48162, 48163, 48164);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Microsoft Office Excel Remote Code Execution Vulnerabilities (2537146)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/44901/");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2541003");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2541025");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2541007");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2541015");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2523021");
  script_xref(name:"URL", value:"http://www.microsoft.com/technet/security/bulletin/MS11-045.mspx");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl", "secpod_ms_office_detection_900025.nasl");
  script_mandatory_keys("SMB/Office/Excel/Version");

  script_tag(name:"impact", value:"Successful exploitation could allow attackers to execute arbitrary code with
  the privileges of the user running the affected application.");
  script_tag(name:"affected", value:"Microsoft Office Excel 2010

  Microsoft Excel Viewer Service Pack 2

  Microsoft Office Excel 2002 Service Pack 3

  Microsoft Office Excel 2003 Service Pack 3

  Microsoft Office Excel 2007 Service Pack 2");
  script_tag(name:"insight", value:"The flaws are caused by memory corruption, heap and integer overflows, buffer
  overwrite, out of bounds array access when handling the crafted Excel files.");
  script_tag(name:"solution", value:"Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,

  http://www.microsoft.com/technet/security/bulletin/MS11-045.mspx");
  script_tag(name:"summary", value:"This host is missing an important security update according to
  Microsoft Bulletin MS11-045.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("secpod_reg.inc");
include("version_func.inc");

excelVer = get_kb_item("SMB/Office/Excel/Version");
if(excelVer =~ "^1[0124]\..*")
{
  if(version_in_range(version:excelVer, test_version:"10.0", test_version2:"10.0.6870.0") ||
     version_in_range(version:excelVer, test_version:"11.0", test_version2:"11.0.8334.0") ||
     version_in_range(version:excelVer, test_version:"12.0", test_version2:"12.0.6557.4999") ||
     version_in_range(version:excelVer, test_version:"14.0", test_version2:"14.0.5138.4999"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

excelVer = get_kb_item(name:"SMB/Office/XLView/Version");
if(!isnull(excelVer))
{
  if(version_in_range(version:excelVer, test_version:"12.0", test_version2:"12.0.6557.4999")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
