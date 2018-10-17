###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-026.nasl 8246 2017-12-26 07:29:20Z teissa $
#
# Microsoft MPEG Layer-3 Codecs Remote Code Execution Vulnerability (977816)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Updated By: Madhuri D <dmadhuri@secpod.com> on 2010-11-17
#      - To detect file version 'L3codeca.acm' on vista and win 2008
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
  script_oid("1.3.6.1.4.1.25623.1.0.902038");
  script_version("$Revision: 8246 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-26 08:29:20 +0100 (Tue, 26 Dec 2017) $");
  script_tag(name:"creation_date", value:"2010-04-14 17:51:53 +0200 (Wed, 14 Apr 2010)");
  script_cve_id("CVE-2010-0480");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Microsoft MPEG Layer-3 Codecs Remote Code Execution Vulnerability (977816)");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/Bulletin/MS10-026.mspx");
  script_xref(name : "URL" , value : "http://www.symantec.com/connect/blogs/microsoft-patch-tuesday-april-2010");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : "Successful exploitation could allow remote attackers to gain complete control
  of an affected system remotely. An attacker could install programs view,
  change, or delete data; or create new accounts with full user rights.
  Impact Level: System");
  script_tag(name : "affected" , value : "Microsoft Windows 2000 Service Pack 4 and prior
  Microsoft Windows XP Service Pack 3 and prior
  Microsoft Windows 2003 Service Pack 2 and prior
  Microsoft Windows Vista Service Pack 1/2 and prior.
  Microsoft Windows Server 2008 Service Pack 1/2 and prior.");
  script_tag(name : "insight" , value : "The flaw is due the error in 'Microsoft MPEG Layer-3 audio codecs', which
  does not properly handle specially crafted AVI files containing an MPEG
  Layer-3 audio stream.");
  script_tag(name : "solution" , value : "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/Bulletin/MS10-026.mspx");
  script_tag(name : "summary" , value : "This host is missing a critical security update according to
  Microsoft Bulletin MS10-026.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");



if(hotfix_check_sp(win2k:5, xp:4, win2003:3, winVista:3, win2008:3) <= 0){
  exit(0);
}

# Check for MS10-026 Hotfix
if(hotfix_missing(name:"977816") == 0){
 exit(0);
}

## Get System32 path
sysPath = smb_get_system32root();
if(sysPath)
{
  sysVer = fetch_file_version(sysPath, file_name:"l3codecx.ax");
  if(!sysVer){
    exit(0);
  }
}

## Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  # Grep L3codecx.ax version < 1.6.0.51
  if(version_is_less(version:sysVer, test_version:"1.6.0.51"))
  {
    security_message(0);
    exit(0);
  }
}

## Get System32 path
sysPath = smb_get_system32root();
if(sysPath)
{ 
  sysVer = fetch_file_version(sysPath, file_name:"L3codeca.acm");
  if(!sysVer){
    exit(0);
  }
}

## Windows Vista and 2008 Server
if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  # Grep L3codeac.acm version < 1.9.0.402
  if(version_is_less(version:sysVer, test_version:"1.9.0.402")){
    security_message(0);
  }
}

