###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-074.nasl 8724 2018-02-08 15:02:56Z cfischer $
#
# Microsoft Foundation Classes Could Allow Remote Code Execution Vulnerability (2387149)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902319");
  script_version("$Revision: 8724 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-08 16:02:56 +0100 (Thu, 08 Feb 2018) $");
  script_tag(name:"creation_date", value:"2010-10-13 17:10:12 +0200 (Wed, 13 Oct 2010)");
  script_cve_id("CVE-2010-3227");
  script_bugtraq_id(41333);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Microsoft Foundation Classes Could Allow Remote Code Execution Vulnerability (2387149)");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : "Successful exploitation could allow remote attackers to run arbitrary code in
  the security context of the current user.

  Impact Level: System/Application");
  script_tag(name : "affected" , value : "Microsoft Windows XP Service Pack 3 and prior.

  Microsoft Windows 2K3 Service Pack 2 and prior.

  Microsoft Windows Vista Service Pack 2 and prior.

  Microsoft Windows Server 2008 Service Pack 2 and prior.

  Microsoft Windows 7");
  script_tag(name : "insight" , value : "The flaw is due to a buffer overflow error in the Microsoft Foundation
  Class (MFC) Library when handling application requests to rename window titles.");
  script_tag(name : "solution" , value : "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,

  http://www.microsoft.com/technet/security/bulletin/MS10-074.mspx");
  script_tag(name : "summary" , value : "This host is missing a critical security update according to
  Microsoft Bulletin MS10-074.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/2621");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/MS10-074.mspx");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(xp:4, win2003:3, winVista:3, win2008:3, win7:1) <= 0){
  exit(0);
}

## Hotfix check
if(hotfix_missing(name:"2387149") == 0){
  exit(0);
}

## Get System32 path
sysPath = smb_get_system32root();
if(sysPath)
{
  dllVer = fetch_file_version(sysPath, file_name:"mfc40.dll");
  if(dllVer)
  {
    ## Windows XP and  Windows 2003
    if(hotfix_check_sp(xp:4, win2003:3) > 0)
    {
      ## Grep for mfc40.dll version < 4.1.0.6151
      if(version_is_less(version:dllVer, test_version:"4.1.0.6151")){
        security_message(0);
      }
      exit(0);
    }
  }
}

sysPath = smb_get_system32root();
if(!sysPath){
  exit(0);
}

dllVer = fetch_file_version(sysPath, file_name:"mfc40.dll");
if(!dllVer){
  exit(0);
}

## Windows Vista and Windows Server 2008, Windows 7
if(hotfix_check_sp(winVista:2, win2008:2, win7:1) > 0)
{
  ## Grep for mfc40.dll version < 4.1.0.6151
  if(version_is_less(version:dllVer, test_version:"4.1.0.6151")){
      security_message(0);
  }
}
