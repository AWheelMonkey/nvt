###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms09-020.nasl 4706 2016-12-07 14:50:30Z cfi $
#
# Microsoft IIS Security Bypass Vulnerability (970483)
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900567");
  script_version("$Revision: 4706 $");
  script_tag(name:"last_modification", value:"$Date: 2016-12-07 15:50:30 +0100 (Wed, 07 Dec 2016) $");
  script_tag(name:"creation_date", value:"2009-06-10 19:23:54 +0200 (Wed, 10 Jun 2009)");
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-1122", "CVE-2009-1535");
  script_bugtraq_id(34993, 35232);
  script_name("Microsoft IIS Security Bypass Vulnerability (970483)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl", "secpod_ms_iis_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("IIS/installed");

  script_xref(name:"URL", value:"http://secunia.com/advisories/35109");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/970483");
  script_xref(name:"URL", value:"http://www.microsoft.com/technet/security/bulletin/ms09-018.mspx");

  tag_impact = "Remote attackers could exploit this issue to bypass authentication and gain
  unauthorized read and upload access to protected folders.

  Impact Level: System";

  tag_affected = "Microsoft Windows 2K  Service Pack 4 and prior
  Microsoft Windows XP  Service Pack 3 and prior
  Microsoft Windows 2k3 Service Pack 2 and prior";

  tag_insight = "The flaw is due to,
  - WebDAV extension does not properly decode requested URLs, which could
    cause an incorrect configuration to be applied.
  - WebDav fails to verify credentials before accessing password-protected
    resources when handling HTTP GET or PROPFIND requests containig a Unicode
    encoded character with a 'Translate: f' header.";

  tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link.
  http://www.microsoft.com/technet/security/bulletin/ms09-020.mspx";

  tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS09-020.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(xp:4, win2k:5, win2003:3) <= 0){
  exit(0);
}

# Check for Hotfix 970483 (MS09-020).
if(hotfix_missing(name:"970483") == 0){
  exit(0);
}

httpPath = registry_get_sz(key:"SOFTWARE\Microsoft\COM3\Setup",
                           item:"Install Path");
if(!httpPath){
  exit(0);
}

share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:httpPath);
file =  ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1",
                     string:httpPath + "\inetsrv\httpext.dll");

httpVer = GetVer(file:file, share:share);
if(!httpVer){
  exit(0);
}

if(hotfix_check_sp(win2k:5) > 0)
{
  # Check for httpext.dll version < 5.0.2195.7290
  if(version_in_range(version:httpVer, test_version:"5.0",
                      test_version2:"5.0.2195.7289")){
    security_message(0);
  }
}

else if(hotfix_check_sp(win2003:3) > 0)
{
  SP = get_kb_item("SMB/Win2003/ServicePack");
  if("Service Pack 2" >< SP)
  {
    # Check for httpext.dll version < 6.0.3790.4518
    if(version_in_range(version:httpVer, test_version:"6.0",
                       test_version2:"6.0.3790.4517")){
      security_message(0);
    }
  }
  security_message(0);
}

else if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if("Service Pack 2" >< SP)
  {
    # Check for httpext.dll version < 6.0.2600.3574
    if(version_in_range(version:httpVer, test_version:"6.0",
                       test_version2:"6.0.2600.3573")){
      security_message(0);
    }
  }
  else if("Service Pack 3" >< SP)
  {
    # Check for httpext.dll version < 6.0.2600.5817
    if(version_in_range(version:httpVer, test_version:"6.0",
                       test_version2:"6.0.2600.5816")){
      security_message(0);
    }
  }
  security_message(0);
}
