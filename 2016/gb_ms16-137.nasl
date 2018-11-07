###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-137.nasl 12096 2018-10-25 12:26:02Z asteins $
#
# Microsoft Windows Authentication Methods Multiple Vulnerabilities (3199173)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.809093");
  script_version("$Revision: 12096 $");
  script_cve_id("CVE-2016-7238", "CVE-2016-7237", "CVE-2016-7220");
  script_bugtraq_id(92835);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-25 14:26:02 +0200 (Thu, 25 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-11-09 10:09:34 +0530 (Wed, 09 Nov 2016)");
  script_name("Microsoft Windows Authentication Methods Multiple Vulnerabilities (3199173)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-137");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaws are due to,

  - The windows Virtual Secure Mode improperly handles objects in memory.

  - A denial of service vulnerability in the Local Security Authority Subsystem
    Service (LSASS).

  - The windows fails to properly handle NTLM password change requests.");

  script_tag(name:"impact", value:"Successful exploitation will allow a
  locally-authenticated to read sensitive information on the target system,
  cause the target system to become non-responsive and elevate their permissions
  from unprivileged to administrator which thereby allows him/her to install
  programs, view, change or delete data, or create new accounts.");

  script_tag(name:"affected", value:"Microsoft Windows 10 x32/x64.

  Microsoft Windows 8.1 x32/x64 Edition.

  Microsoft Windows Server 2012/2012R2.

  Microsoft Windows 10 Version 1511 x32/x64.

  Microsoft Windows 10 Version 1607 x32/x64.

  Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior.

  Microsoft Windows Vista x32/x64 Edition Service Pack 2 and prior.

  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior.

  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3199173");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/library/security/ms16-137");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-137");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2, winVistax64:3, win2008x64:3,
                   win2012:1, win2012R2:1, win8_1:1, win8_1x64:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath){
  exit(0);
}

winVer = fetch_file_version(sysPath:sysPath, file_name:"system32\Win32k.sys");
shVer = fetch_file_version(sysPath:sysPath, file_name:"system32\Schannel.dll");
if(!winVer && !shVer){
  exit(0);
}

if(hotfix_check_sp(winVista:3, winVistax64:3, win2008:3, win2008x64:3) > 0 && shVer)
{
  if(version_is_less(version:shVer, test_version:"6.0.6002.19678"))
  {
    Vulnerable_range2 = "Less than 6.0.6002.19678";
    VULN2 = TRUE ;
  }
  else if(version_in_range(version:shVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.24024"))
  {
    Vulnerable_range2 = "6.0.6002.23000 - 6.0.6002.24024";
    VULN2 = TRUE ;
  }
}

else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  if(version_is_less(version:winVer, test_version:"6.1.7601.23584"))
  {
    Vulnerable_range1 = "Less than 6.1.7601.23584";
    VULN1 = TRUE ;
  }
}

else if(hotfix_check_sp(win2012:1) > 0)
{
  if(version_is_less(version:winVer, test_version:"6.2.9200.22023"))
  {
     Vulnerable_range1 = "Less than 6.2.9200.22023";
     VULN1 = TRUE ;
  }
}

else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0 && winVer)
{
  if(version_is_less(version:winVer, test_version:"6.3.9600.18524"))
  {
    Vulnerable_range1 = "Less than 6.3.9600.18524";
    VULN1 = TRUE ;
  }
}

else if(hotfix_check_sp(win10:1, win10x64:1) > 0 && winVer)
{
  if(version_is_less(version:winVer, test_version:"10.0.10240.16384"))
  {
    Vulnerable_range1 = "Less than 10.0.10240.16384";
    VULN1 = TRUE ;
  }
  else if(version_in_range(version:winVer, test_version:"10.0.10586.0", test_version2:"10.0.10586.19"))
  {
    Vulnerable_range1 = "10.0.10586.0 - 10.0.10586.19";
    VULN1 = TRUE ;
  }
  else if(version_in_range(version:winVer, test_version:"10.0.14393.0", test_version2:"10.0.14393.446"))
  {
    Vulnerable_range1 = "10.0.14393.0 - 10.0.14393.446";
    VULN1 = TRUE ;
  }
}

if(VULN1)
{
  report = 'File checked:     ' + sysPath + "\system32\Win32k.sys"+ '\n' +
           'File version:     ' + winVer + '\n' +
           'Vulnerable range: ' + Vulnerable_range1 + '\n' ;
  security_message(data:report);
  exit(0);
}

else if(VULN2)
{
  report = 'File checked:     ' + sysPath + "\system32\Schannel.dll"+ '\n' +
           'File version:     ' + shVer + '\n' +
           'Vulnerable range: ' + Vulnerable_range2 + '\n' ;
  security_message(data:report);
  exit(0);
}
