###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms09-042.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Telnet NTLM Credential Reflection Authentication Bypass Vulnerability (960859)
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Updated By: Madhuri D <dmadhuri@secpod.com> on 2011-01-13
#       - To detect file version 'telnet.exe' on vista and win 2008
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

tag_impact = "Successful exploitation will allow attackers to execute arbitrary code and
  completely compromise the affected computer.
  Impact Level: System";
tag_affected = "Microsoft Windows 2K Service Pack 4 and prior.
  Microsoft Windows XP Service Pack 3 and prior.
  Microsoft Windows 2003 Service Pack 2 and prior.
  Microsoft Vista Service Pack 2 and prior.
  Microsoft Windows 2008 Service Pack 2 and prior.";
tag_insight = "An error in the Telnet service when handling NTLM authentication can be
  exploited to reflect the user credentials and gain unauthorized access
  to the affected system.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/Bulletin/MS09-042.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS09-042.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900909");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-08-12 19:54:51 +0200 (Wed, 12 Aug 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-1930");
  script_bugtraq_id(35993);
  script_name("Telnet NTLM Credential Reflection Authentication Bypass Vulnerability (960859)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/36222/");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/960859");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/Bulletin/MS09-042.mspx");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
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

if(hotfix_check_sp(xp:4, win2k:5, win2003:3, winVista:3, win2008:3) <= 0){
  exit(0);
}

# MS09-042 Hotfix (960859)
if(hotfix_missing(name:"960859") == 0){
  exit(0);
}

exePath = registry_get_sz(item:"Install Path",
                          key:"SOFTWARE\Microsoft\COM3\Setup");
if(!exePath){
  exit(0);
}

share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:exePath);
file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:exePath +
                                                         "\telnet.exe");
telnetVer = GetVer(file:file, share:share);
if(!telnetVer){
   exit(0);
}

if(hotfix_check_sp(win2k:5) > 0)
{
  # Check for telnet.exe version 5.0 < 5.0.33670.4
  if(version_in_range(version:telnetVer, test_version:"5.0",
                      test_version2:"5.0.33670.3")){
    security_message(0);
  }
}

else if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if("Service Pack 2" >< SP)
  {
    # Check for telnet.exe version 5.1 < 5.1.2600.3587
    if(version_in_range(version:telnetVer, test_version:"5.1",
                        test_version2:"5.1.2600.3586")){
      security_message(0);
    }
     exit(0);
  }
  else if("Service Pack 3" >< SP)
  {
    # Check for telnet.exe version 5.1 < 5.1.2600.5829
    if(version_in_range(version:telnetVer, test_version:"5.1",
                        test_version2:"5.1.2600.5828")){
      security_message(0);
    }
     exit(0);
  }
  security_message(0);
}

else if(hotfix_check_sp(win2003:3) > 0)
{
  SP = get_kb_item("SMB/Win2003/ServicePack");
  if("Service Pack 2" >< SP)
  {
    # Check for telnet.exe version 5.2 < 5.2.3790.4528
    if(version_in_range(version:telnetVer, test_version:"5.2",
                        test_version2:"5.2.3790.4527")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Get System Path
sysPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows NT\CurrentVersion",
                          item:"PathName");
if(!sysPath){
  exit(0);
}

share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:sysPath);
file =  ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1",
                     string:sysPath + "\System32\telnet.exe");

## Get File Version
exeVer = GetVer(file:file, share:share);
if(exeVer)
{
  # Windows Vista
  if(hotfix_check_sp(winVista:3) > 0)
  {
    SP = get_kb_item("SMB/WinVista/ServicePack");
    if("Service Pack 1" >< SP)
    {
      # Grep for telnet.exe version < 6.0.6001.18270
      if(version_is_less(version:exeVer, test_version:"6.0.6001.18270")){
        security_message(0);
      }
      exit(0);
    }

    if("Service Pack 2" >< SP)
    {
      # Grep for telnet.exe version < 6.0.6002.18049
      if(version_is_less(version:exeVer, test_version:"6.0.6002.18049")){
        security_message(0);
      }
       exit(0);
    }
    security_message(0);
  }

  # Windows Server 2008
  else if(hotfix_check_sp(win2008:3) > 0)
  {
    SP = get_kb_item("SMB/Win2008/ServicePack");
    if("Service Pack 1" >< SP)
    {
      # Grep for telnet.exe version < 6.0.6001.18270
      if(version_is_less(version:exeVer, test_version:"6.0.6001.18270")){
        security_message(0);
      }
       exit(0);
    }

    if("Service Pack 2" >< SP)
    {
      # Grep for telnet.exe version < 6.0.6002.18049
      if(version_is_less(version:exeVer, test_version:"6.0.6002.18049")){
        security_message(0);
      }
      exit(0);
    }
    security_message(0);
  }
}
