#############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-152.nasl 11837 2018-10-11 09:17:05Z asteins $
#
# Microsoft Windows Kernel Information Disclosure Vulnerability (3199709)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.810309");
  script_version("$Revision: 11837 $");
  script_cve_id("CVE-2016-7258");
  script_bugtraq_id(94736);
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 11:17:05 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-12-14 09:02:07 +0530 (Wed, 14 Dec 2016)");
  script_name("Microsoft Windows Kernel Information Disclosure Vulnerability (3199709)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-152");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to the Windows kernel
  fails to properly handle certain page fault system calls.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  attackers to disclose information from one process to another.");

  script_tag(name:"affected", value:"Microsoft Windows 10 x32/x64.
  Microsoft Windows Server 2016.
  Microsoft Windows 10 Version 1511 x32/x64.
  Microsoft Windows 10 Version 1607 x32/x64.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3199709");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/library/security/MS16-152");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-152");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win10:1, win10x64:1, win2016:1) <= 0){
  exit(0);
}

kerPath = smb_get_systemroot();
if(!kerPath ){
  exit(0);
}

kerVer = fetch_file_version(sysPath: kerPath, file_name:"System32\Ntoskrnl.exe");
if(!kerVer){
  exit(0);
}

if(hotfix_check_sp(win10:1, win10x64:1, win2016:1) > 0)
{
  if(version_is_less(version:kerVer, test_version:"10.0.10240.17202"))
  {
    Vulnerable_range = "Less than 10.0.10240.17202";
    VULN = TRUE ;
  }
  else if(version_in_range(version:kerVer, test_version:"10.0.10586.0", test_version2:"10.0.10586.671"))
  {
    Vulnerable_range = "10.0.10586.0 - 10.0.10586.671";
    VULN = TRUE ;
  }
  else if(version_in_range(version:kerVer, test_version:"10.0.14393.0", test_version2:"10.0.14393.575"))
  {
    Vulnerable_range = "10.0.14393.0 - 10.0.14393.575";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + kerPath + "\system32\Ntoskrnl.exe" + '\n' +
           'File version:     ' + kerVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
