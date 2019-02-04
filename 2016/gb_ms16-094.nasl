###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-094.nasl 12768 2018-12-12 09:09:14Z cfischer $
#
# Microsoft Windows Secure Boot Security Feature Bypass Vulnerability(3177404)
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
  script_oid("1.3.6.1.4.1.25623.1.0.808196");
  script_version("$Revision: 12768 $");
  script_cve_id("CVE-2016-3287");
  script_bugtraq_id(91604);
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-12-12 10:09:14 +0100 (Wed, 12 Dec 2018) $");
  script_tag(name:"creation_date", value:"2016-07-13 12:13:04 +0530 (Wed, 13 Jul 2016)");
  script_name("Microsoft Windows Secure Boot Security Feature Bypass Vulnerability(3177404)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-094");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to Windows Secure Boot
  improperly applies an affected policy.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to disable code integrity checks, allowing test-signed executables
  and drivers to be loaded on a target device and to bypass the secure boot
  integrity validation for bitLocker and the device encryption security features.");

  script_tag(name:"affected", value:"Microsoft Windows 8.1 x32/x64 Edition

  Microsoft Windows Server 2012/2012R2

  Microsoft Windows 10 x32/x64

  Windows 10 Version 1511 32-bit/64-bit.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3175677");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-094");

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

if(hotfix_check_sp(win2012:1, win2012R2:1, win8_1:1, win8_1x64:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

ciVer = fetch_file_version(sysPath:sysPath, file_name:"ci.dll");
if(ciVer)
{
  if(hotfix_check_sp(win2012:1) > 0)
  {
    if(version_is_less(version:ciVer, test_version:"6.2.9200.20679"))
    {
      Vulnerable_range = "Less than 6.2.9200.20679";
      VULN = TRUE ;
    }
  }

  else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
  {
    if(version_is_less(version:ciVer, test_version:"6.3.9600.17550"))
    {
      Vulnerable_range = "Less than 6.3.9600.17550";
      VULN = TRUE ;
    }
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\ci.dll" + '\n' +
           'File version:     ' + ciVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}

WinEdgeVer = fetch_file_version(sysPath:sysPath, file_name:"edgehtml.dll");
if(!WinEdgeVer){
  exit(0);
}

if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  if(version_is_less(version:WinEdgeVer, test_version:"11.0.10240.17024"))
  {
    Vulnerable_range = "Less than 11.0.10240.17024";
    VULN1 = TRUE ;
  }
  else if(version_in_range(version:WinEdgeVer, test_version:"11.0.10586.0", test_version2:"11.0.10586.493"))  {
    Vulnerable_range = "11.0.10586.0 - 11.0.10586.493";
    VULN1 = TRUE ;
  }
}

if(VULN1)
{
  report = 'File checked:     ' + sysPath + "\edgehtml.dll" + '\n' +
           'File version:     ' + WinEdgeVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
