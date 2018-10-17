###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms11-092.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Microsoft Windows Media Remote Code Execution Vulnerability (2648048)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
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

tag_impact = "Successful exploitation could allow attackers to execute arbitrary code
  with the privileges of the user running the application.

  Impact Level: System";
tag_affected = "Microsoft Windows 7 Service Pack 1 and prior

  Microsoft Windows XP Service Pack 3 and prior

  Microsoft Windows Vista Service Pack 2 and prior";
tag_insight = "The flaw is due to an error in Windows Media Player and Windows Media
  Center when parsing Microsoft Digital Video Recording files (DVR-MS) and can
  be exploited to corrupt memory.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,

  http://technet.microsoft.com/en-us/security/bulletin/ms11-092";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS11-092.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902597");
  script_version("$Revision: 9351 $");
  script_bugtraq_id(50957);
  script_cve_id("CVE-2011-3401");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-12-14 10:10:10 +0530 (Wed, 14 Dec 2011)");
  script_name("Microsoft Windows Media Remote Code Execution Vulnerability (2648048)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/47117");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2619339");
  script_xref(name : "URL" , value : "http://www.securitytracker.com/id/1026407");
  script_xref(name : "URL" , value : "http://technet.microsoft.com/en-us/security/bulletin/ms11-092");

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
if(hotfix_check_sp(xp:4, winVista:3, win7:2) <= 0){
  exit(0);
}

## MS11-092 Hotfix (2619339)
if(hotfix_missing(name:"2619339") == 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath){
  exit(0);
}

## Get Version from Encdec.dll file
dllVer = fetch_file_version(sysPath, file_name:"system32\Encdec.dll");
if(!dllVer){
  exit(0);
}

## Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if("Service Pack 3" >< SP)
  {
    ## Check for Encdec.dll version before 6.5.2600.6161
    if(version_is_less(version:dllVer, test_version:"6.5.2600.6161")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Windows Vista
else if(hotfix_check_sp(winVista:3) > 0)
{
  SP = get_kb_item("SMB/WinVista/ServicePack");

  if("Service Pack 2" >< SP)
  {
    ## Check for Encdec.dll version GDR 6.6.6002.18528, LDR 6.6.6002.22726
    if(version_in_range(version:dllVer, test_version:"6.0.6002.18000", test_version2:"6.6.6002.18527")||
       version_in_range(version:dllVer, test_version:"6.6.6002.22000", test_version2:"6.6.6002.22725")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Windows 7
else if(hotfix_check_sp(win7:2) > 0)
{
  ## Check for Encdec.dll version
  ## GDR 6.6.7600.16899 LDR 6.6.7600.21070
  ## GDR 6.6.7601.17708 LDR 6.6.7601.21840
  if(version_is_less(version:dllVer, test_version:"6.6.7600.16899") ||
     version_in_range(version:dllVer, test_version:"6.6.7600.20000", test_version2:"6.6.7600.21069")||
     version_in_range(version:dllVer, test_version:"6.6.7601.17000", test_version2:"6.6.7601.17707")||
     version_in_range(version:dllVer, test_version:"6.6.7601.21000", test_version2:"6.6.7601.21839")){
    security_message(0);
  }
}
