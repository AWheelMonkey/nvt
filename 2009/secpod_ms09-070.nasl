###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms09-070.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Microsoft Windows ADFS Remote Code Execution Vulnerability (971726)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Updated By: Madhuri D <dmadhuri@secpod.com> on 2011-01-12
#  - To detect the vuln file version on windows 2008 server
#
# Copyright:
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

tag_impact = "Successful exploitation will allow remote attackers to take complete
  control of the victim's system.
  Impact Level: System";
tag_affected = "Microsoft Windows 2K3 Service Pack 2 and prior.
  Microsoft Windows Server 2008 Service Pack 2 and prior.";
tag_insight = "The vulnerability is due to incorrect validation of request headers when an
  authenticated user connects to an ADFS enabled Web Server. An attacker who
  successfully exploited this vulnerability could take complete control of an
  affected system.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/ms09-070.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS09-070.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.901064");
  script_version("$Revision: 9350 $");
  script_cve_id("CVE-2009-2508", "CVE-2009-2509");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-12-09 16:08:24 +0100 (Wed, 09 Dec 2009)");
  script_name("Microsoft Windows ADFS Remote Code Execution Vulnerability (971726)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/37542/");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/971726");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2009/3434");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/MS09-070.mspx");

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

if(hotfix_check_sp(win2003:3, win2008:3) <= 0){
  exit(0);
}

## Check for Active Directory Federation Services Installation
if(!registry_key_exists(key:"SOFTWARE\Microsoft\ADFS\Setup\Parameters")){
  exit(0);
}

# MS09-070 Hotfix check
if(hotfix_missing(name:"971726") == 0){
  exit(0);
}

dllPath = registry_get_sz(key:"SOFTWARE\Microsoft\COM3\Setup",
                          item:"Install Path");
if(!dllPath){
  exit(0);
}

dllPath = dllPath - "\system32" + "\adfs\Adfsreg.exe";
share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:dllPath);
file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:dllPath);

dllVer = GetVer(file:file, share:share);
if(!dllVer){
  exit(0);
}

# Windows 2003
if(hotfix_check_sp(win2003:3) > 0)
{
  SP = get_kb_item("SMB/Win2003/ServicePack");
  if("Service Pack 2" >< SP)
  {
    # Grep for Adfsreg.exe version < 5.2.3790.4578
    if(version_is_less(version:dllVer, test_version:"5.2.3790.4578")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

dllPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows NT\CurrentVersion",
                          item:"PathName");
if(!dllPath){
  exit(0);
}

dllPath = dllPath + "\adfs\bin\Adfsgc.exe";
share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:dllPath);
file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:dllPath);

dllVer = GetVer(file:file, share:share);
if(!dllVer){
  exit(0);
}

# Windows 2008
if(hotfix_check_sp(win2008:3) > 0)
{
  SP = get_kb_item("SMB/Win2008/ServicePack");
  if("Service Pack 1" >< SP)
  {
    ## Grep for Adfsgc.exe version < 6.0.6001.18000
    if(version_is_less(version:dllVer, test_version:"6.0.6001.18000")){
       security_message(0);
       exit(0);
    }
  }

  if("Service Pack 2" >< SP)
  {
    ## Grep for Adfsgc.exe version < 6.0.6002.18005
    if(version_is_less(version:dllVer, test_version:"6.0.6002.18005")){
       security_message(0);
        exit(0);
    }
  }
}
