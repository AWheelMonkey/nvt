###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms12-041.nasl 11876 2018-10-12 12:20:01Z cfischer $
#
# Windows Kernel-Mode Drivers Privilege Elevation Vulnerabilities (2709162)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2012 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902917");
  script_version("$Revision: 11876 $");
  script_cve_id("CVE-2012-1864", "CVE-2012-1865", "CVE-2012-1866", "CVE-2012-1867",
                "CVE-2012-1868");
  script_bugtraq_id(53815, 53816, 53817, 53819, 53820);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:20:01 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2012-06-13 10:45:30 +0530 (Wed, 13 Jun 2012)");
  script_name("Windows Kernel-Mode Drivers Privilege Elevation Vulnerabilities (2709162)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/49436/");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2709162");
  script_xref(name:"URL", value:"http://technet.microsoft.com/en-us/security/bulletin/ms12-041");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name:"impact", value:"Successful exploitation could allow remote attackers to execute arbitrary
  code with kernel-mode privileges");
  script_tag(name:"affected", value:"Microsoft Windows XP x32 Edition Service Pack 3 and prior
  Microsoft Windows XP x64 Edition Service Pack 2 and prior
  Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior
  Microsoft Windows 2003 x32/x64 Edition Service Pack 2 and prior
  Microsoft Windows Vista x32/x64 Edition Service Pack 2 and prior
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior");
  script_tag(name:"insight", value:"Multiple flaws are due to,

  - An error in win32k.sys within the string atom class name and lipboard
    format atom name handling and can be exploited to execute arbitrary code.

  - An integer overflow error when handling the reference counter for font
    resources when loading TrueType fonts.

  - A race condition error in win32k.sys when handling particular thread
    creation attempts and can be exploited to execute arbitrary code.");
  script_tag(name:"solution", value:"Run Windows Update and install the listed hotfixes or download and
  install the hotfixes from the referenced advisory.");
  script_tag(name:"summary", value:"This host is missing an important security update according to
  Microsoft Bulletin MS12-041.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(xp:4, xpx64:3, win2003:3, win2003x64:3, winVista:3, win7:2,
                   win7x64:2, win2008:3, win2008r2:2) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(! sysPath){
  exit(0);
}

sysVer = fetch_file_version(sysPath:sysPath, file_name:"system32\Win32k.sys");
if(! sysVer){
  exit(0);
}

if(hotfix_check_sp(xp:4) > 0)
{
  if(version_is_less(version:sysVer, test_version:"5.1.2600.6228")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

else if(hotfix_check_sp(win2003:3, xpx64:3, win2003x64:3) > 0)
{
  if(version_is_less(version:sysVer, test_version:"5.2.3790.5004")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

## Currently not supporting for Vista and Windows Server 2008 64 bit
else if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  if(version_is_less(version:sysVer, test_version:"6.0.6002.18633") ||
     version_in_range(version:sysVer, test_version:"6.0.6002.22000", test_version2:"6.0.6002.22859")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  if(version_is_less(version:sysVer, test_version:"6.1.7600.17024") ||
     version_in_range(version:sysVer, test_version:"6.1.7600.20000", test_version2:"6.1.7600.21214")||
     version_in_range(version:sysVer, test_version:"6.1.7601.17000", test_version2:"6.1.7601.17841")||
     version_in_range(version:sysVer, test_version:"6.1.7601.21000", test_version2:"6.1.7601.21994")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
