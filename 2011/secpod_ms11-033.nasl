###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms11-033.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# WordPad Text Converters Remote Code Execution Vulnerability (2485663)
#
# Authors:
# Veerendra G.G <veerendragg@secpod.com>
#
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

tag_impact = "Successful exploitation of this issue may allow attackers to execute
  arbitrary code in the context of a logged-on user by tricking a user to
  open specially crafted Word document.
  Impact Level: System";
tag_affected = "Microsoft Windows XP Service Pack 3 and prior.
  Microsoft Windows 2003 Service Pack 2 and prior.";
tag_insight = "A flaw exists in the Microsoft WordPad text converter, which incorrectly
  parses specific fields in a Word document.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/Bulletin/MS11-033.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS11-033.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900284");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-04-13 17:05:53 +0200 (Wed, 13 Apr 2011)");
  script_bugtraq_id(47236);
  script_cve_id("CVE-2011-0028");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("WordPad Text Converters Remote Code Execution Vulnerability (2485663)");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2485663");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/Bulletin/MS11-033.mspx");

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


if(hotfix_check_sp(xp:4, win2003:3) <= 0){
  exit(0);
}

## Check for Hotfix 2485663 (MS11-033)
if(hotfix_missing(name:"2485663") == 0){
  exit(0);
}

## Get Program Files Dir Path and construct complete path
progDir = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion\",
                           item:"ProgramFilesDir");
if(!progDir){
  exit(0);
}

## Get Version from Mswrd8.wpc file
sysVer = fetch_file_version(sysPath:progDir, file_name:"Windows NT" +
                                          "\Accessories\Mswrd8.wpc");
if(!sysVer){
  exit(0);
}

## Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if("Service Pack 3" >< SP)
  {
    ## Grep for Mswrd8.wpc < 2011.1.31.10
    if(version_is_less(version:sysVer, test_version:"2011.1.31.10")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Windows 2003
if(hotfix_check_sp(win2003:3) > 0)
{
  SP = get_kb_item("SMB/Win2003/ServicePack");
  if("Service Pack 2" >< SP)
  {
    ## Grep for Mswrd8.wpc < 2011.1.31.10
    if(version_is_less(version:sysVer, test_version:"2011.1.31.10")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}
