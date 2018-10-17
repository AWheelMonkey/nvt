###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-014.nasl 8314 2018-01-08 08:01:01Z teissa $
#
# Microsoft Kerberos Denial of Service Vulnerability (977290)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Updated by : Madhuri D <dmadhuri@secpod.com> on 2010-01-10
#       - To detect file version 'Kdcsvc.dll' on win 2008
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

tag_impact = "Successful exploitation could allow remote attackers to cause a vulnerable
  Windows domain controller to stop responding.
  Impact Level: System";
tag_affected = "Microsoft Windows 2000 Service Pack 4 and prior.
  Microsoft Windows 2003 Service Pack 2 and prior.
  Microsoft Windows 2008 Service Pack 3 and prior.";
tag_insight = "The issue is caused by a NULL pointer dereference error when handling
  'Ticket-Granting-Ticket' renewal requests sent by a client on a remote
   non-Windows realm in a mixed-mode Kerberos implementation.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/ms10-014.mspx";
tag_summary = "This host is missing a critical security update according to Microsoft
  Bulletin MS10-014.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902115");
  script_version("$Revision: 8314 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-08 09:01:01 +0100 (Mon, 08 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-02-10 16:06:43 +0100 (Wed, 10 Feb 2010)");
  script_tag(name:"cvss_base", value:"6.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:N/A:C");
  script_cve_id("CVE-2010-0035");
  script_bugtraq_id(38110);
  script_name("Microsoft Kerberos Denial of Service Vulnerability (977290)");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/0344");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/ms10-014.mspx");

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

if(hotfix_check_sp(win2k:5, xp:4, win2003:3, win2008:3) <= 0){
  exit(0);
}

# Check for MS10-014 Hotfix
if(hotfix_missing(name:"977290") == 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath){
  exit(0);
}

sysVer = fetch_file_version(sysPath, file_name:"system32\Kdcsvc.dll");
if(!sysVer){
 exit(0);
}

# Windows 2K
if(hotfix_check_sp(win2k:5) > 0)
{
  # Grep for Kdcsvc.dll version < 5.0.2195.7361
  if(version_is_less(version:sysVer, test_version:"5.0.2195.7361")){
    security_message(0);
  }
}

# Windows 2003
else if(hotfix_check_sp(win2003:3) > 0)
{
  SP = get_kb_item("SMB/Win2003/ServicePack");
  if("Service Pack 2" >< SP)
  {
    # Grep for Kdcsvc.dll version <  5.2.3790.4628
    if(version_is_less(version:sysVer, test_version:"5.2.3790.4628")){
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
  if("Service Pack 1" >< SP)
  {
    ## Grep for Kdcsvc.dll version
    if(version_in_range(version:sysVer, test_version:"6.0.6001.18000", test_version2:"6.0.6001.18373")||
       version_in_range(version:sysVer, test_version:"6.0.6001.22000", test_version2:"6.0.6001.22573")){
      security_message(0);
    }
    exit(0);
  }

  if("Service Pack 2" >< SP)
  {
    ## Grep for Kdcsvc.dll version
    if(version_in_range(version:sysVer, test_version:"6.0.6002.18000", test_version2:"6.0.6002.18156")||
       version_in_range(version:sysVer, test_version:"6.0.6002.22000", test_version2:"6.0.6002.22279")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}
