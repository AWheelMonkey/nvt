###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_excel_ms15-116.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# Microsoft Office Excel Multiple Remote Code Execution Vulnerabilities (3104540)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.806159");
  script_version("$Revision: 11872 $");
  script_cve_id("CVE-2015-2503", "CVE-2015-6038", "CVE-2015-6094");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-11-11 12:54:51 +0530 (Wed, 11 Nov 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Excel Multiple Remote Code Execution Vulnerabilities (3104540)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS15-116.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists when,

  - Microsoft Excel improperly handles the loading of dynamic link library
    (DLL) files.

  - Error when memory is released in an unintended manner.

  - Improper handling of files in the memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to run arbitrary code in the context of the current user and
  to perform actions in the security context of the current user.");

  script_tag(name:"affected", value:"Microsoft Excel 2007 Service Pack 3 and prior,
  Microsoft Excel 2010 Service Pack 2 and prior,
  Microsoft Excel 2013 Service Pack 1 and prior,
  Microsoft Excel 2016 Service Pack 1 and prior");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and install the hotfixes from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3101554");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3101543");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3101499");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/library/security/MS15-116");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Excel/Version");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms15-116");
  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");

excelVer = get_kb_item("SMB/Office/Excel/Version");
if(!excelVer){
  exit(0);
}

excelPath = get_kb_item("SMB/Office/Excel/Install/Path");
if(!excelPath){
   excelPath  = "Unable to fetch the install path";
}

if(excelVer =~ "^(12|14|15|16)\..*")
{
  if(excelVer =~ "^12"){
    Vulnerable_range  =  "12 - 12.0.6735.4999";
  }
  else if(excelVer =~ "^14"){
    Vulnerable_range  =  "14 - 14.0.7162.4999";
  }
  else if(excelVer =~ "^15"){
   Vulnerable_range  =  "15 - 15.0.4771.0999";
  }
  else if(excelVer =~ "^16"){
   Vulnerable_range  =  "16 - 16.0.4300.1000";
  }

  if(version_in_range(version:excelVer, test_version:"12.0", test_version2:"12.0.6735.4999") ||
     version_in_range(version:excelVer, test_version:"14.0", test_version2:"14.0.7162.4999") ||
     version_in_range(version:excelVer, test_version:"15.0", test_version2:"15.0.4771.0999") ||
     version_in_range(version:excelVer, test_version:"16.0", test_version2:"16.0.4300.1000"))
  {
    report = 'File checked:     ' + excelPath + "Excel.exe" + '\n' +
             'File version:     ' + excelVer  + '\n' +
             'Vulnerable range: ' + Vulnerable_range + '\n' ;
    security_message(data:report);
    exit(0);
  }
}
