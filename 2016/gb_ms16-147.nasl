###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-147.nasl 11772 2018-10-08 07:20:02Z asteins $
#
# Microsoft Uniscribe Remote Code Execution Vulnerability (3204063)
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
  script_oid("1.3.6.1.4.1.25623.1.0.809832");
  script_version("$Revision: 11772 $");
  script_cve_id("CVE-2016-7274");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-08 09:20:02 +0200 (Mon, 08 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-12-14 09:12:25 +0530 (Wed, 14 Dec 2016)");
  script_name("Microsoft Uniscribe Remote Code Execution Vulnerability (3204063)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-147.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to the way Windows
  Uniscribe handles objects in the memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to take control of the affected system. An attacker could then:

  - install programs

  - view, change, or delete data

  - or create new accounts with full user rights.

  Users whose accounts are configured to have fewer user rights on the system could
  be less impacted than users who operate with administrative user rights.");

  script_tag(name:"affected", value:"Microsoft Windows 8.1 x32/x64 Edition

  Microsoft Windows 10 x32/x64

  Microsoft Windows Server 2012/2012R2

  Microsoft Windows 10 Version 1511 x32/x64

  Microsoft Windows 10 Version 1607 x32/x64

  Microsoft Windows Vista x32/x64 Edition Service Pack 2

  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2

  Microsoft Windows 7 x32/x64 Edition Service Pack 1

  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1

  Microsoft Windows Server 2016.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,

  https://technet.microsoft.com/library/security/MS16-147");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3204063");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-147");
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

if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2, winVistax64:3,
                   win2008x64:3, win2012:1, win2012R2:1, win8_1:1, win8_1x64:1, win10:1,
                   win10x64:1, win2016:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

usrVer = fetch_file_version(sysPath, file_name:"System32\Usp10.dll");
gdiVer = fetch_file_version(sysPath, file_name:"System32\Mshtml.dll");

if(!usrVer && !gdiVer){
  exit(0);
}

if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0 && usrVer)
{
    ## Presently GDR information is not available.
    if(version_is_less(version:usrVer, test_version:"1.626.7601.23585"))
    {
      Vulnerable_range1 = "Less than 1.626.7601.23585";
      VULN1 = TRUE ;
    }
}

else if(hotfix_check_sp(winVista:3, winVistax64:3, win2008:3, win2008x64:3) > 0 && usrVer)
{
    if(version_is_less(version:usrVer, test_version:"1.626.6002.19707"))
    {
      Vulnerable_range1 = "Less than 1.626.6002.19707";
      VULN1 = TRUE ;
    }

    else if(version_in_range(version:usrVer, test_version:"1.626.6002.24000", test_version2:"1.626.6002.24029"))
    {
      Vulnerable_range1 = "1.626.6002.24000 - 1.626.6002.24029";
      VULN1 = TRUE ;
    }
}

else if(hotfix_check_sp(win2012:1) > 0 && gdiVer)
{
  if(version_is_less(version:gdiVer, test_version:"10.0.9200.22028"))
  {
     Vulnerable_range = "Less than 10.0.9200.22028";
     VULN = TRUE ;
  }
}

## Win 8.1 and win2012R2
else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0 && gdiVer)
{
  if(version_is_less(version:gdiVer, test_version:"11.0.9600.18538"))
  {
    Vulnerable_range = "Less than 11.0.9600.18538";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win10:1, win10x64:1) > 0 && gdiVer)
{
  if(version_is_less(version:gdiVer, test_version:"11.0.10240.17202") )
  {
    Vulnerable_range = "Less than 11.0.10240.17202";
    VULN = TRUE;
  }

  else if(version_in_range(version:gdiVer, test_version:"11.0.10586.0", test_version2:"11.0.10586.712"))
  {
    Vulnerable_range = "11.0.10586.0 - 11.0.10586.712";
    VULN = TRUE ;
  }

  else if(version_in_range(version:gdiVer, test_version:"11.0.14393.0", test_version2:"11.0.14393.575"))
  {
    Vulnerable_range = "11.0.14393.0 - 11.0.14393.575";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win2016:1) > 0 && gdiVer)
{
  if(version_in_range(version:gdiVer, test_version:"11.0.14393.0", test_version2:"11.0.14393.575"))
  {
    Vulnerable_range = "11.0.14393.0 - 11.0.14393.575";
    VULN = TRUE ;
  }
}

if(VULN1)
{
  report = 'File checked:     ' + sysPath + "\System32\Usp10.dll" + '\n' +
           'File version:     ' + usrVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range1 + '\n' ;
  security_message(data:report);
  exit(0);
}

else if(VULN)
{
  report = 'File checked:     ' + sysPath + "\System32\Mshtml.dll" + '\n' +
           'File version:     ' + gdiVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
