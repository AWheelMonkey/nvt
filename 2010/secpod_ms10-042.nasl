###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-042.nasl 8266 2018-01-01 07:28:32Z teissa $
#
# Microsoft Help and Support Center Remote Code Execution Vulnerability (2229593)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
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

tag_impact = "Successful exploitation could allow remote attackers to inject malicious code
  in the Help and Support Center and execute arbitrary commands on a vulnerable
  system by tricking a user into visiting a specially crafted web page.
  Impact Level: System";
tag_affected = "Microsoft Windows XP Service Pack 3 and prior.
  Microsoft Windows 2003 Service Pack 2 and prior.";
tag_insight = "The flaw is due to the error in 'MPC::HTML::UrlUnescapeW()' function
  within the Help and Support Center application (helpctr.exe) that does not
  properly check the return code of 'MPC::HexToNum()' when escaping URLs.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/Bulletin/MS10-042.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS10-042.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902080");
  script_version("$Revision: 8266 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-01 08:28:32 +0100 (Mon, 01 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-07-14 10:07:03 +0200 (Wed, 14 Jul 2010)");
  script_bugtraq_id(40725);
  script_cve_id("CVE-2010-1885");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Microsoft Help and Support Center Remote Code Execution Vulnerability (2229593)");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/59267");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/1417");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/Bulletin/MS10-042.mspx");

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

# Check for MS10-042 Hotfix
if(hotfix_missing(name:"2229593") == 0){
  exit(0);
}

sysPath = registry_get_sz(key:"SOFTWARE\Microsoft\COM3\Setup",
                          item:"Install Path");
if(!sysPath){
  exit(0);
}

sysPath = sysPath - "\system32" + "\pchealth\helpctr\binaries\helpsvc.exe";

share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:sysPath);
file =  ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:sysPath);

sysVer = GetVer(file:file, share:share);
if(!sysVer){
  exit(0);
}

# Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if("Service Pack 2" >< SP)
  {
    # Grep for helpsvc.exe version < 5.1.2600.3720
    if(version_is_less(version:sysVer, test_version:"5.1.2600.3720")){
      security_message(0);
    }
    exit(0);
  }
  else if("Service Pack 3" >< SP)
  {
    # Grep for helpsvc.exe version < 5.1.2600.5997
    if(version_is_less(version:sysVer, test_version:"5.1.2600.5997")){
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
    # Grep for helpsvc.exe version < 5.2.3790.4726
    if(version_is_less(version:sysVer, test_version:"5.2.3790.4726")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}
