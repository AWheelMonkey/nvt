###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms09-013.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Windows HTTP Services Could Allow Remote Code Execution Vulnerabilities (960803)
#
# Authors:
# Chandan S <schandan@secpod.com>
#  
# Updated By: Madhuri D <dmadhuri@secpod.com> on 2010-12-02
#       - To detect file version 'Winhttp.dll' on vista and win 2008
#
# Copyright (c) 2009 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.900092");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-04-15 18:21:29 +0200 (Wed, 15 Apr 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-0086", "CVE-2009-0089", "CVE-2009-0550");
  script_bugtraq_id(34435, 34437, 34439);
  script_name("Windows HTTP Services Could Allow Remote Code Execution Vulnerabilities (960803)");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/ms09-013.mspx");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : "Attacker who successfully exploited could allow malicious people to conduct
  spoofing attacks and compromise a user's system.
  Impact Level: System");
  script_tag(name : "affected" , value : "Microsoft Windows 2K Service Pack 4 and prior.
  Microsoft Windows XP Service Pack 3 and prior.
  Microsoft Windows 2003 Service Pack 2 and prior.
  Microsoft Windows Vista Service Pack 1 and prior.
  Microsoft Windows Server 2008 Service Pack 1 and prior.");
  script_tag(name : "insight" , value : "- Integer underflow error in Windows HTTP Services allow to execute arbitrary
    code via a specially crafted parameter returned by a malicious web server.
  - Error in Windows HTTP Services while validating the distinguished name
    of a certificate can leads to spoof a valid certificate.
    Successful exploitation requires the ability to perform DNS spoofing attacks.
  - Error in Windows HTTP Services reflect NTLM credentials and execute arbitrary
    code by tricking a user into connecting to a malicious web server.");
  script_tag(name : "solution" , value : "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/ms09-013.mspx");
  script_tag(name : "summary" , value : "This host is missing a critical security update according to
  Microsoft Bulletin MS09-013.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win2k:5, xp:4, win2003:3, winVista:2, win2008:2) <= 0){
  exit(0);
}

# Check for Hotfix 960803 (MS09-013)
if(hotfix_missing(name:"960803") == 0){
  exit(0);
}

## Get System32 path
sysPath = smb_get_system32root();
if(sysPath)
{
  sysVer = fetch_file_version(sysPath, file_name:"Winhttp.dll");
  if(sysVer)
  {
    # Windows 2K
    if(hotfix_check_sp(win2k:5) > 0)
    {
      # Grep for Winhttp.dll version < 5.1.2600.3490
      if(version_is_less(version:sysVer, test_version:"5.1.2600.3490")){
       security_message(0);
      }
      exit(0);
    }

    # Windows XP
    if(hotfix_check_sp(xp:4) > 0)
    {
      SP = get_kb_item("SMB/WinXP/ServicePack");
      if("Service Pack 2" >< SP)
      {
        # Grep for Winhttp.dll < 5.1.2600.3494
        if(version_is_less(version:sysVer, test_version:"5.1.2600.3494")){
          security_message(0);
        }
          exit(0);
      }
      else if("Service Pack 3" >< SP)
      {
        # Grep for Winhttp.dll < 5.1.2600.5727
    	if(version_is_less(version:sysVer, test_version:"5.1.2600.5727")){
          security_message(0);
        }
         exit(0);
      }
       security_message(0);
    }

    # Windows 2003
    if(hotfix_check_sp(win2003:3) > 0)
    {
      SP = get_kb_item("SMB/Win2003/ServicePack");
      if("Service Pack 1" >< SP)
      {
        # Grep for Winhttp.dll version < 5.2.3790.3262
        if(version_is_less(version:sysVer, test_version:"5.2.3790.3262")){
          security_message(0);
        }
          exit(0);
      }
      else if("Service Pack 2" >< SP)
      {
        # Grep for Winhttp.dll version < 5.2.3790.4427
        if(version_is_less(version:sysVer, test_version:"5.2.3790.4427")){
          security_message(0);
        }
        exit(0);
      }
       security_message(0);
    }
  }
}

## Get System32 path
sysPath = smb_get_system32root();
if(sysPath)
{
  dllVer = fetch_file_version(sysPath, file_name:"Winhttp.dll");
  if(dllVer)
  {
    # Windows Vista
    if(hotfix_check_sp(winVista:2) > 0)
    {
      SP = get_kb_item("SMB/WinVista/ServicePack");
      if("Service Pack 1" >< SP)
      {
        # Grep for Winhttp.dll version < 6.0.6001.18178
        if(version_is_less(version:dllVer, test_version:"6.0.6001.18178")){
          security_message(0);
        }
         exit(0);
      }
    }

    # Windows Server 2008
    else if(hotfix_check_sp(win2008:2) > 0)
    {
      SP = get_kb_item("SMB/Win2008/ServicePack");
      if("Service Pack 1" >< SP)
      {
        # Grep for Winhttp.dll version < 6.0.6001.18178
        if(version_is_less(version:dllVer, test_version:"6.0.6001.18178")){
          security_message(0);
        }
         exit(0);
      }
    }
  }
}

