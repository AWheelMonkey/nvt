###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-081.nasl 8724 2018-02-08 15:02:56Z cfischer $
#
# Windows Common Control Library Remote Code Execution Vulnerability (2296011)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation will allow the attacker to execute arbitrary code on
  the targeted system.

  Impact Level: System/Application";
tag_affected = "Microsoft Windows XP Service Pack 3 and prior.

  Microsoft Windows 2K3 Service Pack 2 and prior.

  Microsoft Windows Vista Service Pack 2 and prior.

  Microsoft Windows Server 2008 Service Pack 2 and prior.

  Microsoft Windows 7";
tag_insight = "The flaw is caused by a heap overflow error in the Windows common control
  library 'Comctl32.dll' when handling certain messages while rendering scalable
  vector graphics passed from a third-party scalable vector graphics viewer,
  which could allow attackers to execute arbitrary code by tricking into
  rendering malformed scalable vector graphics via a third-party application.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,

  http://www.microsoft.com/technet/security/Bulletin/MS10-081.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS10-081.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.901165");
  script_version("$Revision: 8724 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-08 16:02:56 +0100 (Thu, 08 Feb 2018) $");
  script_tag(name:"creation_date", value:"2010-10-13 17:10:12 +0200 (Wed, 13 Oct 2010)");
  script_cve_id("CVE-2010-2746");
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_name("Windows Common Control Library Remote Code Execution Vulnerability (2296011)");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2296011");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/2628");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/MS10-081.mspx");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
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
if(hotfix_check_sp(xp:4, win2003:3, winVista:3, win2008:3, win7:1) <= 0){
  exit(0);
}

## MS10-081 Hotfix (2296011)
if(hotfix_missing(name:"2296011") == 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

dllPath = sysPath + "\system32\Comctl32.dll";
share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:dllPath);
file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:dllPath);

## Get Version from Comctl32.dll file
dllVer = GetVer(file:file, share:share);
if(!dllVer){
  exit(0);
}

## Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if("Service Pack 3" >< SP)
  {
    ## Check for Comctl32.dll version
    if(version_is_less(version:dllVer, test_version:"5.82.2900.6028")){
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
    ## Check for Comctl32.dll version
    if(version_is_less(version:dllVer, test_version:"5.82.3790.4770")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Windows Vista and Windows Server 2008
else if(hotfix_check_sp(winVista:2, win2008:2) > 0)
{
  SP = get_kb_item("SMB/WinVista/ServicePack");

  if(!SP) {
    SP = get_kb_item("SMB/Win2008/ServicePack");
  }

  if("Service Pack 1" >< SP)
  {
    ## Check for Comctl32.dll version
    if(version_is_less(version:dllVer, test_version:"5.82.6001.18523")){
      security_message(0);
    }
    exit(0);
  }

  if("Service Pack 2" >< SP)
  {
    ## Check for Comctl32.dll version
    if(version_is_less(version:dllVer, test_version:"6.10.6002.18305")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Windows 7
else if(hotfix_check_sp(win7:1) > 0)
{
  ## Check for Comctl32.dll version
  if(version_is_less(version:dllVer, test_version:"5.82.7600.16661")){
    security_message(0);
  }
}
