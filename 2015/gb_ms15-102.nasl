###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-102.nasl 11876 2018-10-12 12:20:01Z cfischer $
#
# MS Windows Task Management Privilege Elevation Vulnerabilities (3089657)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.806045");
  script_version("$Revision: 11876 $");
  script_cve_id("CVE-2015-2524", "CVE-2015-2525", "CVE-2015-2528");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:20:01 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-09-09 10:27:35 +0530 (Wed, 09 Sep 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("MS Windows Task Management Privilege Elevation Vulnerabilities (3089657)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-102.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - Task Management failing to validate and enforce impersonation levels.

  - Task Scheduler failing to properly verify certain file system interactions.");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker
  to gain elevated privileges to perform arbitrary administration functions such
  as add users and install applications on the targeted machine.");

  script_tag(name:"affected", value:"Microsoft Windows 8 x32/x64
  Microsoft Windows 8.1 x32/x64
  Microsoft Windows 10 x32/x64
  Microsoft Windows Server 2012
  Microsoft Windows Server 2012R2
  Microsoft Windows Vista x32/x64 Edition Service Pack 2 and prior
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior
  Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and install the hotfixes from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3082089");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3084135");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS15-102");

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

if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2,
                   win8:1, win8x64:1, win8_1:1, win8_1x64:1, win2012:1,
                   win2012R2:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath){
  exit(0);
}

dllVer1 = fetch_file_version(sysPath:sysPath, file_name:"system32\Schedsvc.dll");

dllVer2 = fetch_file_version(sysPath:sysPath, file_name:"system32\Authui.dll");

if(!dllVer1 && !dllVer2){
 exit(0);
}

## Currently not supporting for Vista and Windows Server 2008 64 bit
if(hotfix_check_sp(winVista:3, win2008:3) > 0 && dllVer1)
{
  dllName = "Schedsvc.dll";
  dllVer = dllVer1;

  if(version_is_less(version:dllVer, test_version:"6.0.6002.19465")){

    Vulnerable_range = "Version Less than 6.0.6002.19465";
    VULN1 = TRUE ;
  }
  if(version_in_range(version:dllVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23773")){

    Vulnerable_range = "6.0.6002.23000 - 6.0.6002.23773";
    VULN1 = TRUE ;
  }
}

if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0 && dllVer1)
{
  dllName = "Schedsvc.dll";
  dllVer = dllVer1;

  if(version_is_less(version:dllVer, test_version:"6.1.7601.18951")){

    Vulnerable_range = "Version Less than  6.1.7601.18951";
    VULN1 = TRUE ;
  }
  if(version_in_range(version:dllVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.23153")){

    Vulnerable_range = "6.1.7601.22000 - 6.1.7601.23153";
    VULN1 = TRUE ;
  }
}

## Win 8 and 2012
if(hotfix_check_sp(win8:1, win8x64:1, win2012:1) > 0)
{
  if(dllVer1)
  {
    dllName = "Schedsvc.dll";
    dllVer = dllVer1;

    if(version_is_less(version:dllVer, test_version:"6.2.9200.17465")){

      Vulnerable_range = "Version Less than 6.2.9200.17465";
      VULN1 = TRUE ;
    }
    if(version_in_range(version:dllVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21578")){

      Vulnerable_range = "6.2.9200.20000 - 6.2.9200.21578";
      VULN1 = TRUE ;
    }
  }
  if(dllVer2)
  {

    dllName1 = "Authui.dll";
    dllVer1 = dllVer2;

    if(version_is_less(version:dllVer1, test_version:"6.2.9200.17464")){

      Vulnerable_range = "Version Less than - 6.2.9200.17464";
      VULN2 = TRUE ;
    }

    if(version_in_range(version:dllVer1, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21577")){

      Vulnerable_range = "6.2.9200.20000 - 6.2.9200.21577";
      VULN2 = TRUE ;
    }
  }
}


## Win 8.1 and win2012R2
if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  if(dllVer1)
  {
    dllName = "Schedsvc.dll";
    dllVer = dllVer1;

    if(version_is_less(version:dllVer, test_version:"6.3.9600.18001")){

      Vulnerable_range = "Version Les than - 6.3.9600.18001";
      VULN1 = TRUE ;
    }
  }
  if(dllVer2)
  {
    dllName1 = "Authui.dll";
    dllVer1 = dllVer2;

    if(version_is_less(version:dllVer1, test_version:"6.3.9600.17962")){

      Vulnerable_range = "Version Less than - 6.3.9600.17962";
      VULN2 = TRUE ;
    }
  }
}

if(hotfix_check_sp(win10:1, win10x64:1) > 0 && dllVer1)
{
  dllName = "Schedsvc.dll";
  dllVer = dllVer1;

  if(version_is_less(version:dllVer, test_version:"10.0.10240.16485"))
  {
    Vulnerable_range = "Less than 10.0.10240.16485";
    VULN1 = TRUE ;
  }
}

if(VULN1)
{
  report = 'File checked:     ' + sysPath + "\system32\" + dllName + "\n" +
           'File version:     ' + dllVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}

if(VULN2)
{
  report = 'File checked:     ' + sysPath + "\system32\" + dllName1 + "\n" +
           'File version:     ' + dllVer1  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
