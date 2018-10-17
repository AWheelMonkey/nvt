###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms13-048.nasl 11876 2018-10-12 12:20:01Z cfischer $
#
# Microsoft Windows Kernel Information Disclosure Vulnerability (2839229)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2013 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902974");
  script_version("$Revision: 11876 $");
  script_cve_id("CVE-2013-3136");
  script_bugtraq_id(60357);
  script_tag(name:"cvss_base", value:"4.4");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:S/C:C/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:20:01 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-06-12 08:18:44 +0530 (Wed, 12 Jun 2013)");
  script_name("Microsoft Windows Kernel Information Disclosure Vulnerability (2839229)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/53739/");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2839229");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms13-048");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name:"impact", value:"Successful exploitation will allow local attackers to disclose potentially
  sensitive information.");
  script_tag(name:"affected", value:"Microsoft Windows 8
  Microsoft Windows 7 x32 Edition Service Pack 1 and prior
  Microsoft Windows XP x32 Edition Service Pack 3 and prior
  Microsoft Windows 2003 x32 Edition Service Pack 2 and prior
  Microsoft Windows Vista x32 Edition Service Pack 2 and prior
  Microsoft Windows Server 2008 x32 Edition Service Pack 2 and prior");
  script_tag(name:"insight", value:"The weakness is due to an error when handling certain page fault system calls,
  which can be exploited to disclose information from kernel memory.");
  script_tag(name:"solution", value:"Run Windows Update and update the listed hotfixes or download and
  install the hotfixes from the referenced advisory.");
  script_tag(name:"summary", value:"This host is missing an important security update according to
  Microsoft Bulletin MS13-048.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(xp:4, win2003:3, winVista:3, win7:2, win2008:3, win8:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

exeVer = fetch_file_version(sysPath:sysPath, file_name:"system32\ntoskrnl.exe");
if(!exeVer){
  exit(0);
}

if(hotfix_check_sp(xp:4) > 0)
{
  if(version_is_less(version:exeVer, test_version:"5.1.2600.6387")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

else if(hotfix_check_sp(win2003:3) > 0)
{
  if(version_is_less(version:exeVer, test_version:"5.2.3790.5157")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

else if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  if(version_is_less(version:exeVer, test_version:"6.0.6002.18832") ||
     version_in_range(version:exeVer, test_version:"6.0.6002.22000", test_version2:"6.0.6002.23102")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

else if(hotfix_check_sp(win7:2) > 0)
{
  if(version_is_less(version:exeVer, test_version:"6.1.7601.18147") ||
     version_in_range(version:exeVer, test_version:"6.1.7601.21000", test_version2:"6.1.7601.22317")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

else if(hotfix_check_sp(win8:1) > 0)
{
  if(version_is_less(version:exeVer, test_version:"6.2.9200.16604") ||
     version_in_range(version:exeVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.20707")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}
