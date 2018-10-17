###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms07-042.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Microsoft XML Core Services Remote Code Execution Vulnerability (936227)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow the attacker to execute arbitrary code in
  the context of the user running the application.
  Impact Level: System/Application";
tag_affected = "Microsoft XML Core Services 3.0/4.0/5.0/6.0

  Microsoft Windows 2K Service Pack 4 and prior

  Microsoft Windows XP Service Pack 3 and prior

  Microsoft Windows 2003 Service Pack 2 and prior

  Microsoft Windows Vista

  Microsoft Office 2003 Service Pack 2

  Microsoft Office 2007

  Microsoft Office Compatibility Pack for Word/Excel/PowerPoint 2007 File Formats";
tag_insight = "The flaw is due to an integer overflow error in the 'substringData()'
  method of an XMLDOM/TextNode JavaScript object.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/ms07-042.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS07-042.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801715");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-01-14 09:03:25 +0100 (Fri, 14 Jan 2011)");
  script_cve_id("CVE-2007-2223");
  script_bugtraq_id(25301);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Microsoft XML Core Services Remote Code Execution Vulnerability (936227)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/26447/");
  script_xref(name : "URL" , value : "http://securitytracker.com/alerts/2007/Aug/1018559.html");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/ms07-042.mspx");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
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

## Office 2003
if(get_kb_item("MS/Office/Ver") =~ "^11\..*")
{
  ## Get Office File Path
  offPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                            item:"CommonFilesDir");
  if(offPath)
  {
    offPath += "\Microsoft Shared\OFFICE11";
    dllVer = FileVer(file:"\msxml5.dll", path:offPath);
    if(dllVer)
    {
      # Grep for msxml5.dll version < 5.20.1081.0
      if(version_is_less(version:dllVer, test_version:"5.20.1081.0"))
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
    dllVer = FileVer(file:"\msxml5.dll", path:offPath);
    if(dllVer)
    {
      # Grep for msxml5.dll version  < 5.20.1081.0
      if(version_is_less(version:dllVer, test_version:"5.20.1081.0"))
      {
        security_message(0);
        exit(0);
      }
    }
  }
}

## Check for OS and Service Pack
if(hotfix_check_sp(xp:4, win2k:5, win2003:3, winVista:3, win2008:3) <= 0){
  exit(0);
}

## Get System32 path
sysPath = registry_get_sz(key:"SOFTWARE\Microsoft\COM3\Setup",
                          item:"Install Path");
if(sysPath)
{
  dllVer = fetch_file_version(sysPath, file_name:"Msxml3.dll");
  dllVer2 = fetch_file_version(sysPath, file_name:"Msxml4.dll");
  dllVer3 = fetch_file_version(sysPath, file_name:"Msxml6.dll");
  if(dllVer || dllVer2 || dllVer3)
  {

    ## Avoid passing FALSE values to the version_* functions later if fetch_file_version() returns FALSE
    if( ! dllVer ) dllVer = "unknown";
    if( ! dllVer2 ) dllVer2 = "unknown";
    if( ! dllVer3 ) dllVer3 = "unknown";

    # Windows 2K, 2k3 and xp
    if(hotfix_check_sp(win2k:5, xp:4, win2003:3) > 0)
    {
      # Grep for Msxml3.dll version
      if(version_in_range(version:dllVer, test_version:"8.0", test_version2:"8.90.1100.0")||
         version_in_range(version:dllVer2, test_version:"4.0", test_version2:"4.20.9847.0") ||
         version_in_range(version:dllVer3, test_version:"6.0", test_version2:"6.10.1199.0")){
        security_message(0);
      }
    }
  }  
}    

sysPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows NT\CurrentVersion",
                      item:"PathName");
if(!sysPath){
  exit(0);
}

dllVer = fetch_file_version(sysPath, file_name:"system32\Msxml3.dll");
dllVer2 = fetch_file_version(sysPath, file_name:"system32\Msxml4.dll");
dllVer3 = fetch_file_version(sysPath, file_name:"system32\Msxml6.dll");
if(dllVer || dllVer2 || dllVer3)
{

  ## Avoid passing FALSE values to the version_* functions later if fetch_file_version() returns FALSE
  if( ! dllVer ) dllVer = "unknown";
  if( ! dllVer2 ) dllVer2 = "unknown";
  if( ! dllVer3 ) dllVer3 = "unknown";

  ## Windows Vista
  if(hotfix_check_sp(winVista:3) > 0)
  {
    ## Check for Msxml3.dll version
    if(version_in_range(version:dllVer, test_version:"8.0", test_version2:"8.90.1100.0") ||
       version_in_range(version:dllVer2, test_version:"4.0", test_version2:"4.20.9847.0") ||
       version_in_range(version:dllVer3, test_version:"6.0", test_version2:"6.10.1199.0")){
      security_message(0);
    }
  }

  ## Windows 2008
  if(hotfix_check_sp(win2008:3) > 0)
  {
    ## Check for Msxml4.dll version 
    if(version_in_range(version:dllVer2, test_version:"4.0", test_version2:"4.20.9847.0")){
      security_message(0);
    }
  }
}