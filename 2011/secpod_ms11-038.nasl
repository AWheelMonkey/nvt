###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms11-038.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Microsoft Windows OLE Automation Remote Code Execution Vulnerability (2476490)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation could allow attackers to execute arbitrary code in the
  context of the user running the application, which can compromise the
  application and possibly the computer.
  Impact Level: System/Application";
tag_affected = "Microsoft Windows 7 Service Pack 1 and prior
  Microsoft Windows XP Service Pack 3 and prior
  Microsoft Windows 2K3 Service Pack 2 and prior
  Microsoft Windows Vista Service Pack 2 and prior
  Microsoft Windows Server 2008 Service Pack 2 and prior";
tag_insight = "The flaw is due to an error in Object Linking and Embedding (OLE)
  Automation (oleaut32.dll) when parsing a Windows Metafile (WMF) images.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/MS11-038.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS11-038.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902377");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-06-15 15:55:00 +0200 (Wed, 15 Jun 2011)");
  script_cve_id("CVE-2011-0658");
  script_bugtraq_id(48174);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Microsoft Windows OLE Automation Remote Code Execution Vulnerability (2476490)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/44733/");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2476490");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/MS11-037.mspx");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Check for OS and Service Pack
if(hotfix_check_sp(xp:4, win2003:3, winVista:3, win2008:3, win7:2) <= 0){
  exit(0);
}

## MS11-038 Hotfix
if((hotfix_missing(name:"2476490") == 0)){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Get 'Oleaut32.dll' file Version 
dllVer = fetch_file_version(sysPath, file_name:"system32\Oleaut32.dll");
if(!dllVer){
  exit(0);
}

## Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if("Service Pack 3" >< SP)
  {
    ## Check for Oleaut32.dll version
    if(version_is_less(version:dllVer, test_version:"5.1.2600.6058")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Windows 2003
else if(hotfix_check_sp(win2003:3) > 0)
{
  SP = get_kb_item("SMB/Win2003/ServicePack");
  if("Service Pack 2" >< SP)
  {
    ## Check for Oleaut32.dll version
    if(version_is_less(version:dllVer, test_version:"5.2.3790.4807")){
      security_message(0);
    }
   exit(0);
  }
  security_message(0);
}

## Windows Vista and Windows Server 2008
else if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  SP = get_kb_item("SMB/WinVista/ServicePack");

  if(!SP) {
    SP = get_kb_item("SMB/Win2008/ServicePack");
  }

  if("Service Pack 1" >< SP)
  {
    ## Check for Oleaut32.dll version
    if(version_in_range(version:dllVer, test_version:"6.0.6001.18000", test_version2:"6.0.6001.18564")||
       version_in_range(version:dllVer, test_version:"6.0.6001.22000", test_version2:"6.0.6001.22815")){
      security_message(0);
    }
    exit(0);
  }

  if("Service Pack 2" >< SP)
  {
    ## Check for Oleaut32.dll version
    if(version_in_range(version:dllVer, test_version:"6.0.6002.18000", test_version2:"6.0.6002.18356")||
       version_in_range(version:dllVer, test_version:"6.0.6002.22000", test_version2:"6.0.6002.22550")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Windows 7
else if(hotfix_check_sp(win7:2) > 0)
{
  ## Check for Oleaut32.dll version
  if(version_is_less(version:dllVer, test_version:"6.1.7600.16722")||
     version_in_range(version:dllVer, test_version:"6.1.7600.20000", test_version2:"6.1.7600.20860")||
     version_in_range(version:dllVer, test_version:"6.1.7601.17000", test_version2:"6.1.7601.17566")||
     version_in_range(version:dllVer, test_version:"6.1.7601.21000", test_version2:"6.1.7601.21668")){
    security_message(0);
  }
}
