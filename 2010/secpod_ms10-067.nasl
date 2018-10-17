###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-067.nasl 8250 2017-12-27 07:29:15Z teissa $
#
# WordPad Text Converters Remote Code Execution Vulnerability (2259922)
#
# Authors:
# Veerendra G.G <veerendragg@secpod.com>
#
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

tag_impact = "Successful exploitation of this issue may allow attackers to execute
  arbitrary code in the context of a logged-on user by tricking a user to
  open specially crafted Word 97 document.
  Impact Level: System";
tag_affected = "Microsoft Windows XP Service Pack 3 and prior.
  Microsoft Windows 2003 Service Pack 2 and prior.";
tag_insight = "A flaw exists in the Microsoft WordPad text converter, which incorrectly
  parses specific fields in a Word 97 document.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/MS10-067.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS10-067.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902245");
  script_version("$Revision: 8250 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-27 08:29:15 +0100 (Wed, 27 Dec 2017) $");
  script_tag(name:"creation_date", value:"2010-09-15 17:01:07 +0200 (Wed, 15 Sep 2010)");
  script_bugtraq_id(43122);
  script_cve_id("CVE-2010-2563");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("WordPad Text Converters Remote Code Execution Vulnerability (2259922)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/41416");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2259922");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
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

## Check for Hotfix 2259922 (MS10-067)
if(hotfix_missing(name:"2259922") == 0){
  exit(0);
}

## Get Program Files Dir Path and construct complete path
progDir = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion\",
                           item:"ProgramFilesDir");
if(!progDir){
  exit(0);
}
filePath = progDir + "\Windows NT\Accessories";

share = ereg_replace(pattern:"([a-zA-Z]):.*", replace:"\1$", string:filePath);
file =  ereg_replace(pattern:"[a-zA-Z]:(.*)", replace:"\1",
                     string:filePath + "\Mswrd8.wpc");

## Get File Version
sysVer = GetVer(file:file, share:share);
if(!sysVer){
  exit(0);
}

## Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if("Service Pack 3" >< SP)
  {
    ## Grep for Mswrd8.wpc < 2010.6.31.10
    if(version_is_less(version:sysVer, test_version:"2010.6.31.10")){
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
    ## Grep for Mswrd8.wpc < 2010.6.31.10
    if(version_is_less(version:sysVer, test_version:"2010.6.31.10")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}
