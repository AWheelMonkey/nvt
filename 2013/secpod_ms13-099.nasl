###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms13-099.nasl 33665 2013-12-11 08:15:24Z dec$
#
# MS Windows Scripting Runtime Object Library RCE Vulnerability (2909158)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2013 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.903505");
  script_version("$Revision: 11878 $");
  script_cve_id("CVE-2013-5056");
  script_bugtraq_id(64082);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:40:08 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-12-11 08:15:24 +0530 (Wed, 11 Dec 2013)");
  script_name("MS Windows Scripting Runtime Object Library RCE Vulnerability (2909158)");


  script_tag(name:"summary", value:"This host is missing an critical security update according to Microsoft
Bulletin MS13-099.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"solution", value:"Run Windows Update and update the listed hotfixes or download and
install the hotfixes from the referenced advisory.");
  script_tag(name:"insight", value:"The flaw is due to memory corruption resulting from improperly handling
of an object in memory by Scripting Runtime Object Library.");
  script_tag(name:"affected", value:"Microsoft Windows XP Service Pack 3 and prior
Microsoft Windows XP x64 Edition Service Pack 2 and prior
Microsoft Windows 2003 x32/x64 Service Pack 2 and prior
Microsoft Windows Vista x32/x64 Service Pack 2 and prior
Microsoft Windows Server 2008 x32/x64 Service Pack 2 and prior
Microsoft Windows 7 x32/x64 Service Pack 1 and prior
Microsoft Windows Server 2008 R2 x64 Service Pack 1 and prior
Microsoft Windows 8 x32/x64
Microsoft Windows 8.1 x32/x64
Microsoft Windows Server 2012
Microsoft Windows Server 2012 R2");
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to execute arbitrary code,
cause a DoS (Denial of Service), and compromise the vulnerable system.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/55981");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2892074");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2892075");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2892076");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms13-099");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 SecPod");
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

if(hotfix_check_sp(xp:4, xpx64:3, win2003:3, win2003x64:3, winVista:3, win7:2,
                   win7x64:2, win2008:3, win2008r2:2, win8:1, win8x64:1,
                   win2012:1, win8_1:1, win8_1x64:1) <= 0)
{
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

scrVer = fetch_file_version(sysPath:sysPath, file_name:"system32\Scrrun.dll");
if(!scrVer){
  exit(0);
}


if(hotfix_check_sp(xp:4, xpx64:3, win2003:3, win2003x64:3) > 0)
{
  if(version_in_range(version:scrVer, test_version:"5.6.0.0", test_version2:"5.6.0.8850") ||
     version_in_range(version:scrVer, test_version:"5.7.6002.0", test_version2:"5.7.6002.18959")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

## Currently not supporting for Vista and Windows Server 2008 64 bit
else if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  if(version_is_less(version:scrVer, test_version:"5.7.6002.18960") ||
     version_in_range(version:scrVer, test_version:"5.7.6002.23000", test_version2:"5.7.6002.23241")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  if(version_is_less(version:scrVer, test_version:"5.8.7601.18283") ||
     version_in_range(version:scrVer, test_version:"5.8.7601.22480", test_version2:"5.8.7601.22479")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

## Win 8 and 2012
else if(hotfix_check_sp(win8:1, win8x64:1, win2012:1) > 0)
{
  if(version_is_less(version:scrVer, test_version:"5.8.9200.16734") ||
     version_in_range(version:scrVer, test_version:"5.8.9200.20000", test_version2:"5.8.9200.20844")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

## Win 8.1
## Currently not supporting for Windows Server 2012 R2
else if(hotfix_check_sp(win8_1:1, win8_1x64:1) > 0)
{
  if(version_is_less(version:scrVer, test_version:"5.8.9600.16429")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}
