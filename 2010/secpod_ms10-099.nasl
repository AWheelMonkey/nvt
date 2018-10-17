###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-099.nasl 8269 2018-01-02 07:28:22Z teissa $
#
# Routing and Remote Access Privilege Escalation Vulnerability (2440591)
#
# Authors:
# Veerendra GG <veerendragg@secpod.com>
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

tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/ms10-099.mspx";

tag_impact = "Successful exploitation could allow remote attackers to bypass security
  restrictions and gain the privileges.
  Impact Level: System";
tag_affected = "Microsoft Windows XP Service Pack 3 and prior.
  Microsoft Windows 2003 Service Pack 2 and prior.";
tag_insight = "The flaw is due to Routing and Remote Access NDProxy component which
  does not properly validate user-supplied input when passing data from user
  mode to the kernel.";
tag_summary = "This host is missing an important security update according to
  Microsoft Bulletin MS10-099.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900264");
  script_version("$Revision: 8269 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-02 08:28:22 +0100 (Tue, 02 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-12-15 14:53:45 +0100 (Wed, 15 Dec 2010)");
  script_bugtraq_id(45269);
  script_cve_id("CVE-2010-3963");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Routing and Remote Access Privilege Escalation Vulnerability (2440591)");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2440591");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/ms10-099.mspx");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Check For OS and Service Packs
if(hotfix_check_sp(xp:4, win2003:3) <= 0){
  exit(0);
}

## Check for MS10-091 Hotfix
if(hotfix_missing(name:"2440591") == 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

dllPath = sysPath + "\system32\drivers\Ndproxy.sys";
share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:dllPath);
file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:dllPath);

## Get Version from atmfd.dll file
dllVer = GetVer(file:file, share:share);
if(!dllVer){
  exit(0);
}

## Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if(("Service Pack 3" >< SP))
  {
    ## Grep for atmfd.dll version < 5.1.2600.6048
    if(version_is_less(version:dllVer, test_version:"5.1.2600.6048")){
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
    ## Grep for atmfd.dll version < 5.2.3790.4795
    if(version_is_less(version:dllVer, test_version:"5.2.3790.4795")){
      security_message(0);
    }
     exit(0);
  }
  security_message(0);
}
