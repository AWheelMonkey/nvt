###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-074.nasl 11702 2018-10-01 07:31:38Z asteins $
#
# Microsoft Graphics Component Multiple Vulnerabilities (3164036)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.808086");
  script_version("$Revision: 11702 $");
  script_cve_id("CVE-2016-3216", "CVE-2016-3219", "CVE-2016-3220");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-01 09:31:38 +0200 (Mon, 01 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-06-15 09:21:26 +0530 (Wed, 15 Jun 2016)");
  script_name("Microsoft Graphics Component Multiple Vulnerabilities (3164036)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-074.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - the Windows Graphics Component (GDI32.dll) fails to properly
    handle objects in memory.

  - the Windows improperly handles objects in memory.

  - Adobe Type Manager Font Driver (ATMFD.dll) when it fails to properly
    handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to retrieve information that could lead to an Address Space Layout
  Randomization (ASLR) bypass, and to run processes in an elevated context, and
  execute arbitrary code and take control of an affected system.");

  script_tag(name:"affected", value:"Microsoft Windows 8 x32/x64

  Microsoft Windows 8.1 x32/x64 Edition

  Microsoft Windows 10 x32/x64

  Microsoft Windows Server 2012/2012R2

  Microsoft Windows 10 Version 1511 x32/x64

  Microsoft Windows Vista x32/x64 Edition Service Pack 2

  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2

  Microsoft Windows 7 x32/x64 Edition Service Pack 1

  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,

  https://technet.microsoft.com/library/security/MS16-074");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3164036");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-074");

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

if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2,
                   win2012:1, win2012R2:1, win8_1:1, win8_1x64:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

dllver1 = fetch_file_version(sysPath, file_name:"System32\Gdi32.dll");
dllver2 = fetch_file_version(sysPath, file_name:"System32\Fontsub.dll");
if(!dllver1 && !dllver2){
  exit(0);
}

if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  if(dllver1)
  {
    if(version_is_less(version:dllver1, test_version:"6.1.7601.23457"))
    {
      Vulnerable_range = "Less than 6.1.7601.23457";
      VULN1 = TRUE ;
    }
  }
  if(dllver2)
  {
    if(version_is_less(version:dllver2, test_version:"6.1.7601.23452"))
    {
      Vulnerable_range = "Less than 6.1.7601.23452";
      VULN2 = TRUE ;
    }
  }
}

else if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  if(dllver1)
  {
    if(version_is_less(version:dllver1, test_version:"6.0.6002.19660"))
    {
      Vulnerable_range = "Less than 6.0.6002.19660";
      VULN1 = TRUE ;
    }
    else if(version_in_range(version:dllver1, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23974"))
    {
      Vulnerable_range = "6.0.6002.23000 - 6.0.6002.6.0.6002.23974";
      VULN1 = TRUE ;
    }
  }
  if(dllver2)
  {
    if(version_is_less(version:dllver2, test_version:"6.0.6002.18272"))
    {
      Vulnerable_range = "Less than 6.0.6002.18272";
      VULN2 = TRUE ;
    }
    else if(version_in_range(version:dllver2, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23973"))
    {
      Vulnerable_range = "6.0.6002.23000 - 6.0.6002.23973";
      VULN2 = TRUE ;
    }
  }
}

else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  if(dllver1)
  {
    if(version_is_less(version:dllver1, test_version:"6.3.9600.18344"))
    {
      Vulnerable_range = "Less than 6.3.9600.18344";
      VULN1 = TRUE ;
    }
  }
  if(dllver2)
  {
    if(version_is_less(version:dllver2, test_version:"6.3.9600.17415"))
    {
      Vulnerable_range = "Less than 6.3.9600.17415";
      VULN2 = TRUE ;
    }
  }
}

else if(hotfix_check_sp(win2012:1) > 0)
{
  if(dllver1)
  {
    if(version_is_less(version:dllver1, test_version:"6.2.9200.21881"))
    {
      Vulnerable_range = "Less than 6.2.9200.21881";
      VULN1 = TRUE ;
    }
  }
}

else if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  if(dllver1)
  {
    if(version_is_less(version:dllver1, test_version:"10.0.10240.16942"))
    {
      Vulnerable_range = "Less than 10.0.10240.16942";
      VULN1 = TRUE ;
    }
    else if(version_in_range(version:dllver1, test_version:"10.0.10586.0", test_version2:"10.0.10586.419"))
    {
      Vulnerable_range = "10.0.10586.0 - 10.0.10586.419";
      VULN1 = TRUE ;
    }
  }
  if(dllver2)
  {
    if(version_is_less(version:dllver2, test_version:"10.0.10240.16384"))
    {
      Vulnerable_range = "Less than 10.0.10240.16384";
      VULN2 = TRUE ;
    }
    else if(version_in_range(version:dllver2, test_version:"10.0.10586.0", test_version2:"10.0.10586.419"))
    {
      Vulnerable_range = "10.0.10586.0 - 10.0.10586.419";
      VULN2 = TRUE ;
    }
  }
}

if(VULN1)
{
  report = 'File checked:     ' + sysPath + "\System32\Gdi32.dll" + '\n' +
           'File version:     ' + dllver1  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}

if(VULN2)
{
  report = 'File checked:     ' + sysPath + "\System32\Fontsub.dll" + '\n' +
           'File version:     ' + dllver2  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
