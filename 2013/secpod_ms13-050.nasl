###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms13-050.nasl 11876 2018-10-12 12:20:01Z cfischer $
#
# Microsoft Windows Print Spooler Components Privilege Escalation Vulnerability (2839894)
#
# Authors:
# Arun Kallavi <karun@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.903212");
  script_version("$Revision: 11876 $");
  script_cve_id("CVE-2013-1339");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:20:01 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-06-12 09:16:20 +0530 (Wed, 12 Jun 2013)");
  script_name("Microsoft Windows Print Spooler Components Privilege Escalation Vulnerability (2839894)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/53742");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2839894");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms13-050");
  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/viewAlert.x?alertId=29560");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_smb_windows_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name:"impact", value:"Successful exploitation could allow remote attackers to execute arbitrary
  code with system privileges, resulting in complete compromise of the target.");
  script_tag(name:"affected", value:"Microsoft Windows 8
  Microsoft Windows Server 2012
  Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior
  Microsoft Windows Vista x32/x64 Edition Service Pack 2 and prior
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior");
  script_tag(name:"insight", value:"The vulnerability is caused due to improper memory operations performed by
  the affected software when deleting printer connections.");
  script_tag(name:"solution", value:"Run Windows Update and update the listed hotfixes or download and
  install the hotfixes from the referenced advisory.");
  script_tag(name:"summary", value:"This host is missing an important security update according to
  Microsoft Bulletin MS13-050.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2,
   win8:1, win2012:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

exeVer = fetch_file_version(sysPath:sysPath, file_name:"system32\Win32spl.dll");
if(!exeVer){
  exit(0);
}

if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  if(version_is_less(version:exeVer, test_version:"6.1.7601.18142") ||
     version_in_range(version:exeVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.22310")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

## Currently not supporting for Vista and Windows Server 2008 64 bit
else if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  if(version_is_less(version:exeVer, test_version:"6.0.6002.18832") ||
     version_in_range(version:exeVer, test_version:"6.0.6002.22000", test_version2:"6.0.6002.23102")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

else if(hotfix_check_sp(win8:1, win2012:1) > 0)
{
if(version_is_less(version:exeVer, test_version:"6.2.9200.16598") ||
   version_in_range(version:exeVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.20701")){
     security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}
