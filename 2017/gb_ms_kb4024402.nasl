###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4024402.nasl 7585 2017-10-26 15:03:01Z cfischer $
#
# Microsoft Windows Multiple Vulnerabilities (KB4024402)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.811204");
  script_version("$Revision: 7585 $");
  script_cve_id("CVE-2017-8543", "CVE-2017-8544");
  script_bugtraq_id(98824, 98826);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-10-26 17:03:01 +0200 (Thu, 26 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-06-14 08:32:08 +0530 (Wed, 14 Jun 2017)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4024402)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4024402");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaw exists when Windows Search 
  improperly handles objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  an attacker to take control of the affected system. An attacker could then 
  install programs; view, change, or delete data; or create new accounts with 
  full user rights and obtain sensitive information. 

  Impact Level: System");

  script_tag(name:"affected", value:"

  Microsoft Windows XP SP2 x64

  Microsoft Windows XP SP3 x86

  Microsoft Windows Vista x32/x64 Edition Service Pack 2

  Microsoft Windows 2003 x32/x64 Edition Service Pack 2 and prior

  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4024402");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/4024402");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/4025687");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
fileVer = "";

## Check for OS and Service Pack
## Windows XP, server2003
if(hotfix_check_sp(xp:4, xpx64:3, win2003:3, win2003x64:3, winVista:3,
                   win2008:3, winVistax64:3, win2008x64:3) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

##Fetch the version of 'query.dll'
fileVer = fetch_file_version(sysPath, file_name:"query.dll");
if(!fileVer){
  exit(0);
}

## Windows Vista and Server 2008, Path not static

## Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  ## Check for query.dll version, on 32bit xp sp3
  if(version_is_less(version:fileVer, test_version:"5.1.2600.7273"))
  {
    Vulnerable_range = "Less than 5.1.2600.7273";
    VULN = TRUE ;
  }
}

## Windows 2003, Windows XP SP2 64bit
else if(hotfix_check_sp(win2003:3, win2003x64:3, xpx64:3) > 0)
{
  ## Check for query.dll version
  if(version_is_less(version:fileVer, test_version:"5.2.3790.6100"))
  {
    Vulnerable_range = "Less than 5.2.3790.6100";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\query.dll" + '\n' +
           'File version:     ' + fileVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
