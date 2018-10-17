###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-061.nasl 11876 2018-10-12 12:20:01Z cfischer $
#
# MS Windows Kernel-Mode Driver Privilege Elevation Vulnerabilities (3057839)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.805582");
  script_version("$Revision: 11876 $");
  script_cve_id("CVE-2015-1719", "CVE-2015-1720", "CVE-2015-1721", "CVE-2015-1722",
                "CVE-2015-1723", "CVE-2015-1724", "CVE-2015-1725", "CVE-2015-1726",
                "CVE-2015-1727", "CVE-2015-1768", "CVE-2015-2360");
  script_bugtraq_id(74999, 75000, 74998, 75005, 75009, 75010, 75006, 75012,
                    75008, 75024, 75025);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:20:01 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-06-10 08:00:55 +0530 (Wed, 10 Jun 2015)");
  script_name("MS Windows Kernel-Mode Driver Privilege Elevation Vulnerabilities (3057839)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-061.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - Improper handling of buffer elements by windows kernel-mode driver under
    certain conditions.

  - Improper freeing of an object in memory by windows kernel-mode driver.

  - Insufficient validation of certain data passed from user mode by the windows
    kernel-mode driver.

  - Windows kernel-mode driver when it accesses an object in memory that has
    either not been correctly initialized or deleted.

  - Windows kernel-mode driver when it improperly validates user input.

  - Windows kernel-mode driver 'Win32k.sys' fails to properly free memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to bypass security, gain elevated privileges and execute arbitrary
  code on affected system.");

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
  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3057839");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/library/security/ms15-061.aspx");

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

dllVer = fetch_file_version(sysPath:sysPath, file_name:"system32\Win32k.sys");
if(!dllVer){
  exit(0);
}

if(hotfix_check_sp(win2003:3, win2003x64:3) > 0)
{
  if(version_is_less(version:dllVer, test_version:"5.2.3790.5640")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

## Currently not supporting for Vista and Windows Server 2008 64 bit
if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.0.6002.19399") ||
     version_in_range(version:dllVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23705")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.1.7601.18869") ||
     version_in_range(version:dllVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.23071")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

if(hotfix_check_sp(win8:1, win8x64:1, win2012:1) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.2.9200.17385") ||
     version_in_range(version:dllVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21495")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

## Win 8.1 and win2012R2
if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.3.9600.17837")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}
