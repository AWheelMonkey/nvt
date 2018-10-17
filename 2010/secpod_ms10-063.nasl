###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-063.nasl 8269 2018-01-02 07:28:22Z teissa $
#
# MS Unicode Scripts Processor and MS Office Remote Code Execution Vulnerability (2320113)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

tag_impact = "Successful exploitation could allow remote attackers to execute arbitrary code
  with SYSTEM privileges and to take complete control of an affected system.
  Impact Level: System/Application";
tag_affected = "Microsoft Office XP SP 3 and prior
  Microsoft Office 2003 SP 3 and prior
  Microsoft Office 2007 SP 2 and prior
  Microsoft Windows XP SP 3 and prior
  Microsoft Windows Vista SP 2 and prior
  Microsoft Windows Server 2008 SP 2 and prior
  Microsoft Windows Server 2003 SP 2 and prior";
tag_insight = "The flaw is caused by an invalid index within the Unicode Script Processor
  (USP10.DLL) when handling a table in the OpenType font layout, which could be
  exploited by attackers to execute arbitrary code by tricking a user into
  visiting a specially crafted web page or opening a malicious Office document.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/ms10-063.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS10-063.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902224");
  script_version("$Revision: 8269 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-02 08:28:22 +0100 (Tue, 02 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-09-15 17:01:07 +0200 (Wed, 15 Sep 2010)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2010-2738");
  script_name("MS Unicode Scripts Processor and MS Office Could Code Execution Vulnerability (2320113)");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/981322");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2288608");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/2384");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("MS/Office/Ver");
  script_require_ports(139, 445);
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


## Get File Version
function FileVer (file, path)
{
  share = ereg_replace(pattern:"([A-Za-z]):.*", replace:"\1$", string:path);
  if(share =~ "[a-z]\$")
    share = toupper(share);
  file = ereg_replace(pattern:"[A-Za-z]:(.*)", replace:"\1", string:path + file);
  ver = GetVer(file:file, share:share);
  return ver;
}

## Office XP
if(get_kb_item("MS/Office/Ver") =~ "^10\..*")
{
  ## Get Office File Path
  offPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                            item:"CommonFilesDir");
  if(offPath)
  {
    offPath += "\Microsoft Shared\OFFICE10";
    dllVer = FileVer(file:"\Usp10.dll", path:offPath);
    if(dllVer)
    {
      # Grep for Usp10.dll version < 1.420.2600.5969
      if(version_is_less(version:dllVer, test_version:"1.420.2600.5969"))
      {
        security_message(0);
        exit(0);
      }
    }
  }
}

## Office 2003
if(get_kb_item("MS/Office/Ver") =~ "^11\..*")
{
  ## Get Office File Path
  offPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                            item:"CommonFilesDir");
  if(offPath)
  {
    offPath += "\Microsoft Shared\OFFICE11";
    dllVer = FileVer(file:"\Usp10.dll", path:offPath);
    if(dllVer)
    {
      # Grep for Usp10.dll version 1.626.6000.21258,
      if(version_is_less(version:dllVer, test_version:"1.626.6000.21258"))
      {
        security_message(0);
        exit(0);
      }
    }
  }
}

## Office 2007
if(get_kb_item("MS/Office/Ver") =~ "^12\..*")
{
  ## Get Office File Path
  offPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                            item:"CommonFilesDir");
  if(offPath)
  {
    offPath += "\Microsoft Shared\OFFICE12";
    dllVer = FileVer(file:"\Usp10.dll", path:offPath);
    if(dllVer)
    {
      # Grep for Usp10.dll version  < 1.626.6002.22402
      if(version_is_less(version:dllVer, test_version:"1.626.6002.22402"))
      {
        security_message(0);
        exit(0);
      }
    }
  }
}

if(hotfix_check_sp(xp:4, win2003:3, winVista:3, win2008:3) <= 0){
  exit(0);
}

# Check for MS10-063 Hotfix
if(hotfix_missing(name:"981322") == 0){
  exit(0);
}


dllPath = registry_get_sz(key:"SOFTWARE\Microsoft\COM3\Setup",
                          item:"Install Path");
if(dllPath)
{
  share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:dllPath);
  file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1",
                      string:dllPath + "\Usp10.dll");

  dllVer = GetVer(file:file, share:share);
  if(dllVer)
  {
    # Windows XP
    if(hotfix_check_sp(xp:4) > 0)
    {
      SP = get_kb_item("SMB/WinXP/ServicePack");
      if("Service Pack 3" >< SP)
      {
        # Grep for Usp10.dll < 1.420.2600.5969
        if(version_is_less(version:dllVer, test_version:"1.420.2600.5969")){
          security_message(0);
        }
        exit(0);
      }
      security_message(0);
    }

    # Windows 2003
    else if(hotfix_check_sp(win2003:3) > 0)
    {
      SP = get_kb_item("SMB/Win2003/ServicePack");
      if("Service Pack 2" >< SP)
      {
        # Grep for Usp10.dll version < 1.422.3790.4695
        if(version_is_less(version:dllVer, test_version:"1.422.3790.4695")){
          security_message(0);
        }
        exit(0);
      }
      security_message(0);
    }
  }
}

sysPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows NT\CurrentVersion",
                          item:"PathName");
if(!sysPath){
  exit(0);
}

share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:sysPath);
file =  ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1",
                     string:sysPath + "\system32\Usp10.dll");

sysVer = GetVer(file:file, share:share);
if(!sysVer){
  exit(0);
}

# Windows Vista
if(hotfix_check_sp(winVista:2) > 0)
{
  SP = get_kb_item("SMB/WinVista/ServicePack");
  if("Service Pack 1" >< SP)
  {
    # Grep for Usp10.dll version < 1.626.6001.18461
    if(version_is_less(version:sysVer, test_version:"1.626.6001.18461")){
      security_message(0);
    }
    exit(0);
  }

  if("Service Pack 2" >< SP)
  {
    # Grep for Usp10.dll version < 1.626.6002.18244
    if(version_is_less(version:sysVer, test_version:"1.626.6002.18244")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

# Windows Server 2008
else if(hotfix_check_sp(win2008:2) > 0)
{
  SP = get_kb_item("SMB/Win2008/ServicePack");
  if("Service Pack 1" >< SP)
  {
    # Grep for Usp10.dll version < 1.626.6001.18461
    if(version_is_less(version:sysVer, test_version:"1.626.6001.18461")){
      security_message(0);
    }
    exit(0);
  }

  if("Service Pack 2" >< SP)
  {
    # Grep for Usp10.dll version < 1.626.6002.18244
    if(version_is_less(version:sysVer, test_version:"1.626.6002.18244")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}
