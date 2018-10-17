###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms11-070.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Microsoft Windows WINS Local Privilege Escalation Vulnerability (2571621)
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

tag_impact = "Successful exploits will allow local attackers to execute arbitrary code with
  local system privileges and potentially compromise the affected computer.
  Impact Level: System/Application";
tag_affected = "Microsoft Windows 2K3 Service Pack 2 and prior
  Microsoft Windows Server 2008 Service Pack 2 and prior";
tag_insight = "The flaw is caused by an error in the Windows Internet Name Service (WINS)
  when handling handling a series of malformed packets sent over the loopback
  interface, leading to arbitrary code execution with elevated privileges.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://technet.microsoft.com/en-us/security/bulletin/ms11-070";
tag_summary = "This host is missing an important security update according to
  Microsoft Bulletin MS11-070.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902566");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-09-14 16:05:49 +0200 (Wed, 14 Sep 2011)");
  script_cve_id("CVE-2011-1984");
  script_bugtraq_id(49523);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Microsoft Windows WINS Local Privilege Escalation Vulnerability (2571621)");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2571621");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/17831/");
  script_xref(name : "URL" , value : "http://technet.microsoft.com/en-us/security/bulletin/ms11-070");
  script_xref(name : "URL" , value : "http://www.coresecurity.com/content/ms-wins-ecommenddlg-input-validation");

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
if(hotfix_check_sp(win2003:3, win2008:3) <= 0){
  exit(0);
}

## MS11-070 Hotfix (2571621)
if(hotfix_missing(name:"2571621") == 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Confirm WINS Installation
if(!registry_key_exists(key:"SYSTEM\CurrentControlSet\Services\WINS")){
  exit(0);
}

## Get Version from Wins.exe file
exeVer = fetch_file_version(sysPath, file_name:"system32\Wins.exe");
if(!exeVer){
  exit(0);
}

## Windows 2003
if(hotfix_check_sp(win2003:3) > 0)
{
  SP = get_kb_item("SMB/Win2003/ServicePack");
  if("Service Pack 2" >< SP)
  {
    ## Check for Wins.exe version
    if(version_is_less(version:exeVer, test_version:"5.2.3790.4893")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Windows Server 2008
else if(hotfix_check_sp(win2008:3) > 0)
{
  SP = get_kb_item("SMB/Win2008/ServicePack");
  if("Service Pack 2" >< SP)
  {
    ## Check for Wins.exe version
    if(version_is_less(version:exeVer, test_version:"6.0.6002.18501") ||
       version_in_range(version:exeVer, test_version:"6.0.6002.22000", test_version2:"6.0.6002.22692")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}
