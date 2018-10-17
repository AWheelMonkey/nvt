###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms11-014.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Microsoft Windows LSASS Privilege Escalation Vulnerability (2478960)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

tag_impact = "Successful exploitation could allow authenticated attackers to execute
  arbitrary code with elevated privileges.
  Impact Level: System";
tag_affected = "Microsoft Windows XP Service Pack 3 and prior.
  Microsoft Windows 2003 Service Pack 2 and prior.";
tag_insight = "The flaw is caused by an error in the Local Security Authority Subsystem
  Service (LSASS) when processing malformed authentication requests.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/ms11-014.mspx";
tag_summary = "This host is missing a critical security update according to Microsoft
  Bulletin MS11-014.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902289");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-02-09 17:14:46 +0100 (Wed, 09 Feb 2011)");
  script_cve_id("CVE-2011-0039");
  script_bugtraq_id(46152);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Microsoft Windows LSASS Privilege Escalation Vulnerability (2478960)");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2478960");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2011/0327");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/ms11-014.mspx");

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

# Check for MS11-014 Hotfix
if(hotfix_missing(name:"2478960") == 0){
  exit(0);
}

## Get the system32 directory
sysPath = smb_get_systemroot();
if(!sysPath){
  exit(0);
}

## Get the file version
sysVer = fetch_file_version(sysPath, file_name:"System32\Lsasrv.dll");
if(!sysVer){
  exit(0);
}

## Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if("Service Pack 3" >< SP)
  {
    ## Grep for Lsasrv.dll version < 5.1.2600.6058
    if(version_is_less(version:sysVer, test_version:"5.1.2600.6058")){
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
    # Grep for Lsasrv.dll version < 5.2.3790.4806
    if(version_is_less(version:sysVer, test_version:"5.2.3790.4806")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}
