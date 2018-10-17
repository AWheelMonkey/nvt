###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-020.nasl 11875 2018-10-12 12:06:36Z cfischer $
#
# Microsoft Windows Remote Code Execution Vulnerabilities (3041836)
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
  script_oid("1.3.6.1.4.1.25623.1.0.805053");
  script_version("$Revision: 11875 $");
  script_cve_id("CVE-2015-0081", "CVE-2015-0096");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:06:36 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-03-11 10:25:04 +0530 (Wed, 11 Mar 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Windows Remote Code Execution Vulnerabilities (3041836)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS15-020.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are exists when,

  - Windows Text Services improperly handles objects in memory and

  - Microsoft Windows improperly handles the loading of DLL files.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to run arbitrary code and take complete control of an affected
  system.");

  script_tag(name:"affected", value:"Microsoft Windows 8 x32/x64

  Microsoft Windows Server 2012/R2

  Microsoft Windows 8.1 x32/x64 Edition

  Microsoft Windows 2003 x32/x64 Edition Service Pack 2 and prior

  Microsoft Windows Vista x32/x64 Edition Service Pack 2 and prior

  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior

  Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior

  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and install the hotfixes from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.securitytracker.com/id/1031890");
  script_xref(name:"URL", value:"https://support.microsoft.com/kb/3033889");
  script_xref(name:"URL", value:"https://support.microsoft.com/kb/3039066");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS15-020");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win2003:3, win2003x64:3, winVista:3, win7:2, win7x64:2,
                   win2008:3, win2008r2:2, win8:1, win8x64:1, win2012:1,
                   win2012R2:1, win8_1:1, win8_1x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

dllVer = fetch_file_version(sysPath:sysPath, file_name:"system32\Msctf.dll");
shell32Ver = fetch_file_version(sysPath:sysPath, file_name:"system32\Shell32.dll");

if(dllVer || shell32Ver)
{

  if(hotfix_check_sp(win2003x64:3,win2003:3) > 0)
  {
    if(version_is_less(version:dllVer, test_version:"5.2.3790.5528") ||
       version_is_less(version:shell32Ver, test_version:"6.0.3790.5558")){
      security_message( port: 0, data: "The target host was found to be vulnerable" );
    }
    exit(0);
  }


  ## Currently not supporting for Vista and Windows Server 2008 64 bit
  if(hotfix_check_sp(winVista:3, win2008:3) > 0)
  {
    if(version_is_less(version:dllVer, test_version:"6.0.6002.19296") ||
       version_in_range(version:dllVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23605") ||
       version_is_less(version:shell32Ver, test_version:"6.0.6002.19322") ||
       version_in_range(version:shell32Ver, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23631")){
      security_message( port: 0, data: "The target host was found to be vulnerable" );
    }
    exit(0);
  }

  if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
  {
    if(version_is_less(version:dllVer, test_version:"6.1.7601.18731") ||
       version_in_range(version:dllVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.22936")||
       version_is_less(version:shell32Ver, test_version:"6.1.7601.18762") ||
       version_in_range(version:shell32Ver, test_version:"6.1.7601.22000", test_version2:"6.1.7601.22968")){
      security_message( port: 0, data: "The target host was found to be vulnerable" );
    }
    exit(0);
  }

  if(hotfix_check_sp(win8:1, win8x64:1, win2012:1) > 0)
  {
    if(version_is_less(version:dllVer, test_version:"6.2.9200.17243") ||
       version_in_range(version:dllVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21360") ||
       version_is_less(version:shell32Ver, test_version:"6.2.9200.17279") ||
       version_in_range(version:shell32Ver, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21394")){
      security_message( port: 0, data: "The target host was found to be vulnerable" );
    }
   exit(0);
  }

  ## Win 8.1 and win2012R2
  if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
  {
   if(version_is_less(version:dllVer, test_version:"6.3.9600.17664") ||
      version_is_less(version:shell32Ver, test_version:"6.3.9600.17680")){
      security_message( port: 0, data: "The target host was found to be vulnerable" );
    }
    exit(0);
  }
}
