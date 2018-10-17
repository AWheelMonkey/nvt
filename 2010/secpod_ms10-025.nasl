###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-025.nasl 8168 2017-12-19 07:30:15Z teissa $
#
# Microsoft Windows Media Services Remote Code Execution Vulnerability (980858)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Updated By: Antu Sanadi <santu@secpod.com> on 2010-04-23
# Updated to check the workaround
#
# Updated By: Antu Sanadi <santu@secpod.com> on 2010-04-28
#  -Removed the workaround check
#  -Updated the file version check according new updates
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

tag_impact = "Successful exploitation could allow attackers to execute arbitrary code with
  system level privileges.
  Impact Level: System";
tag_affected = "Microsoft Windows 2000 Server Service Pack 4 and prior.";
tag_insight = "This flaw is caused by a buffer overflow error in the Windows Media Unicast
  Service within the Windows Media Services component when handling transport
  information network packets, which could allow remote attackers to crash an
  affected service or execute arbitrary code by sending malformed packets.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/Bulletin/MS10-026.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS10-025.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.901102");
  script_version("$Revision: 8168 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-19 08:30:15 +0100 (Tue, 19 Dec 2017) $");
  script_tag(name:"creation_date", value:"2010-04-14 17:51:53 +0200 (Wed, 14 Apr 2010)");
  script_cve_id("CVE-2010-0478");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Microsoft Windows Media Services Remote Code Execution Vulnerability (980858)");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/0868");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/ms10-025.mspx");

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

if(hotfix_check_sp(win2k:5) <= 0){
 exit(0);
}

##Check for MS10-025 Hotfix
if(hotfix_missing(name:"980858") == 0){
  exit(0);
}


sysPath = registry_get_sz(key:"SOFTWARE\Microsoft\COM3\Setup",
                          item:"Install Path");
if(!sysPath){
  exit(0);
}

share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:sysPath);
file =  ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1",
                     string:sysPath + "\windows media\server\Nsum.exe");

exeVer = GetVer(file:file, share:share);
if(!exeVer){
  exit(0);
}

## Windows 2K
if(hotfix_check_sp(win2k:5) > 0)
{
  ## Grep for Nsum.exe version < 4.1.0.3939
  if(version_is_less(version:exeVer, test_version:"4.1.0.3939")){
    security_message(0);
  }
}
