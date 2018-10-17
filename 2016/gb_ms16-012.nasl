###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-012.nasl 11614 2018-09-26 07:39:28Z asteins $
#
# Microsoft Windows PDF Library Remote Code Execution Vulnerabilities (3138938)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.806862");
  script_version("$Revision: 11614 $");
  script_cve_id("CVE-2016-0058", "CVE-2016-0046");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-26 09:39:28 +0200 (Wed, 26 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-02-10 08:17:05 +0530 (Wed, 10 Feb 2016)");
  script_name("Microsoft Windows PDF Library Remote Code Execution Vulnerabilities (3138938)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-012");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"- A flaw exists in Microsoft Windows PDF Library when it improperly handles
    application programming interface (API) calls.

  - A remote code execution vulnerability exists in Microsoft Windows when a
    specially crafted file is opened in Windows Reader.");

  script_tag(name:"impact", value:"Successful exploitation will allow a
  remote attacker to cause arbitrary code to execute in the context of the
  current user, and also could gain the same user rights as the current user.");

  script_tag(name:"affected", value:"Microsoft Windows 8.1 x32/x64 Edition
  Microsoft Windows Server 2012/2012R2
  Microsoft Windows 10 x32/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS16-012");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3135174");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3138938");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-012");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(hotfix_check_sp(win2012:1, win2012R2:1, win8_1:1, win8_1x64:1,
                   win10:1, win10x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

dllVer1 = fetch_file_version(sysPath, file_name:"System32\Glcndfilter.dll");
dllVer2 = fetch_file_version(sysPath, file_name:"System32\Windows.data.pdf.dll");
if(!dllVer1 && !dllVer2){
  exit(0);
}

if(hotfix_check_sp(win2012:1) > 0 && dllVer1)
{
  if(version_is_less(version:dllVer1, test_version:"6.2.9200.17642"))
  {
     Vulnerable_range = "Less than 6.2.9200.17642";
     VULN = TRUE ;
  }

  else if(version_in_range(version:dllVer1, test_version:"6.2.9200.21000", test_version2:"6.2.9200.21760"))
  {
     Vulnerable_range = "6.2.9200.21000 - 6.2.9200.21760";
     VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0 && dllVer1)
{
  if(version_is_less(version:dllVer1, test_version:"6.3.9600.18184"))
  {
    Vulnerable_range = "Less than 6.3.9600.18184";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win10:1, win10x64:1) > 0 && dllVer2)
{
  if(version_is_less(version:dllVer2, test_version:"10.0.10240.16683"))
  {
     report = 'File checked:     ' + sysPath + "\system32\windows.data.pdf.dll"+ '\n' +
              'File version:     ' + dllVer2  + '\n' +
              'Vulnerable range: ' + "Less than 10.0.10240.16683" + '\n' ;
     security_message(data:report);
     exit(0);
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\system32\Glcndfilter.dll" + '\n' +
           'File version:     ' + dllVer1  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
