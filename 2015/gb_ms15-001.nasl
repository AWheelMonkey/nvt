###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-001.nasl 11876 2018-10-12 12:20:01Z cfischer $
#
# Microsoft Windows Application Compatibility Cache Privilege Escalation (3023266)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.805125");
  script_version("$Revision: 11876 $");
  script_cve_id("CVE-2015-0002");
  script_bugtraq_id(71972);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:20:01 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-01-14 07:55:13 +0530 (Wed, 14 Jan 2015)");
  script_name("Microsoft Windows Application Compatibility Cache Privilege Escalation (3023266)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-001.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Flaw is due to the impersonation token
  of a caller is not properly checked when determining if an administrator or not.");

  script_tag(name:"impact", value:"Successful exploitation will allow local attacker
  to bypass the authorization check to create cache entries and in turn gain
  escalated privileges on the system.");

  script_tag(name:"affected", value:"Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior
  Microsoft Windows 8 x32/x64
  Microsoft Windows 8.1 x32/x64 Edition
  Microsoft Windows Server 2012/R2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the given link, https://technet.microsoft.com/library/security/MS15-001");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://support.microsoft.com/kb/3023266");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/ms15-001");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2, win8:1, win8x64:1,
                   win2012:1, win2012R2:1, win8_1:1, win8_1x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Win 8.1 and win2012R2
if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  sysVer = fetch_file_version(sysPath:sysPath, file_name:"system32\Drivers\Ahcache.sys");
  if(!sysVer){
    exit(0);
  }

  if(version_is_less(version:sysVer, test_version:"6.3.9600.17555")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

dllVer = fetch_file_version(sysPath:sysPath, file_name:"system32\ntoskrnl.exe");
if(!dllVer){
  exit(0);
}

if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.1.7601.18700") ||
     version_in_range(version:dllVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.22907")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

if(hotfix_check_sp(win8:1) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.2.9200.17214") ||
     version_in_range(version:dllVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21316")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

if(hotfix_check_sp(win8x64:1, win2012:1) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.2.9200.17213") ||
     version_in_range(version:dllVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21316")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}
