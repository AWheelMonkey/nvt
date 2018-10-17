###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-090.nasl 8246 2017-12-26 07:29:20Z teissa $
#
# Microsoft Internet Explorer Multiple Vulnerabilities (2416400)
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
  http://www.microsoft.com/technet/security/bulletin/MS10-090.mspx";

tag_impact = "Successful exploitation could allow remote attackers to execute arbitrary
  code in the context of the logged-on user and potentially bypassing Internet
  Explorer domain restriction.
  Impact Level: System/Application";
tag_affected = "Microsoft Internet Explorer version 6.x/7.x/8.x";
tag_insight = "- An error occurs when IE attempts to access incorrectly initialized memory
    under certain conditions, causing memory corruption in such a way that an
    attacker could execute arbitrary code.
  - An error occurs when IE caches data and incorrectly allows the cached
    content to be rendered as HTML, potentially bypassing Internet Explorer
    domain restriction.
  - An error occurs when IE attempts to access an object that has not been
    initialized or has been deleted, causing memory corruption in such a way
    that an attacker could execute arbitrary code in the context of the
    logged-on user.";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS10-090.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900262");
  script_version("$Revision: 8246 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-26 08:29:20 +0100 (Tue, 26 Dec 2017) $");
  script_tag(name:"creation_date", value:"2010-12-15 14:53:45 +0100 (Wed, 15 Dec 2010)");
  script_cve_id("CVE-2010-3340", "CVE-2010-3342", "CVE-2010-3343",
                "CVE-2010-3345", "CVE-2010-3346", "CVE-2010-3348",
                "CVE-2010-3962");
  script_bugtraq_id(45255, 45256, 45263, 44536);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Microsoft Internet Explorer Multiple Vulnerabilities (2416400)");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2416400");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/MS10-090.mspx");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_ie_detect.nasl");
  script_mandatory_keys("MS/IE/Version");
  script_require_ports(139, 445);

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

if(hotfix_check_sp(xp:4, win2003:3, winVista:3, win2008:3, win7:1) <= 0){
  exit(0);
}

ieVer = get_kb_item("MS/IE/Version");
if(!ieVer){
  exit(0);
}

## MS10-071 Hotfix (2416400)
if(hotfix_missing(name:"2416400") == 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

dllPath = sysPath + "\system32\Iepeers.dll";
share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:dllPath);
file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:dllPath);

## Get Version from Iepeers.dll file
dllVer = GetVer(file:file, share:share);
if(!dllVer){
  exit(0);
}

## Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if("Service Pack 3" >< SP)
  {
    ## Check for Iepeers.dll version
    if(version_in_range(version:dllVer, test_version:"6.0", test_version2:"6.0.2900.6048") ||
       version_in_range(version:dllVer, test_version:"7.0", test_version2:"7.0.6000.17092")||
       version_in_range(version:dllVer, test_version:"8.0", test_version2:"8.0.6001.18991")){
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
    ## Check for Iepeers.dll version
    if(version_in_range(version:dllVer, test_version:"6.0", test_version2:"6.0.3790.4794") ||
       version_in_range(version:dllVer, test_version:"7.0", test_version2:"7.0.6000.17092")||
       version_in_range(version:dllVer, test_version:"8.0", test_version2:"8.0.6001.18991")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Windows Vista and Windows Server 2008
else if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  SP = get_kb_item("SMB/WinVista/ServicePack");

  if(!SP) {
    SP = get_kb_item("SMB/Win2008/ServicePack");
  }

  if("Service Pack 1" >< SP)
  {
    ## Check for Iepeers.dll version
    if(version_in_range(version:dllVer, test_version:"7.0", test_version2:"7.0.6001.18541")||
       version_in_range(version:dllVer, test_version:"8.0", test_version2:"8.0.6001.18998")){
      security_message(0);
    }
    exit(0);
  }

  if("Service Pack 2" >< SP)
  {
    ## Check for Iepeers.dll version
    if(version_in_range(version:dllVer, test_version:"7.0", test_version2:"7.0.6002.18331")||
       version_in_range(version:dllVer, test_version:"8.0", test_version2:"8.0.6001.18998")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Windows 7
else if(hotfix_check_sp(win7:1) > 0)
{
  ## Check for Iepeers.dll version
  if(version_in_range(version:dllVer, test_version:"8.0", test_version2:"8.0.7600.16699")){
    security_message(0);
  }
}
