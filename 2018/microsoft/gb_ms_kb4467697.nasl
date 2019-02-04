###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4467697.nasl 12851 2018-12-21 01:34:55Z ckuersteiner $
#
# Microsoft Windows Multiple Vulnerabilities (KB4467697)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.814174");
  script_version("$Revision: 12851 $");
  script_cve_id("CVE-2018-8562", "CVE-2018-8563", "CVE-2018-8565", "CVE-2018-8256",
                "CVE-2018-8407", "CVE-2018-8408", "CVE-2018-8415", "CVE-2018-8450",
                "CVE-2018-8471", "CVE-2018-8476", "CVE-2018-8485", "CVE-2018-8544",
                "CVE-2018-8547", "CVE-2018-8549", "CVE-2018-8550", "CVE-2018-8552",
                "CVE-2018-8553", "CVE-2018-8561");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-12-21 02:34:55 +0100 (Fri, 21 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-11-14 15:52:27 +0530 (Wed, 14 Nov 2018)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4467697)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4467697.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists,

  - when DirectX improperly handles objects in memory.

  - in Windows when the Win32k component fails to properly handle objects in
    memory.

  - when an open source customization for Microsoft Active Directory Federation
    Services (AD FS) does not properly sanitize a specially crafted web request to
    an affected AD FS server.

  - when Windows Search handles objects in memory.

  - in the way that the Microsoft RemoteFX Virtual GPU miniport driver handles
    objects in memory.

  - An elevation of privilege exists in Windows COM Aggregate Marshaler.

  - when the win32k component improperly provides kernel information.

  - in the way that the VBScript engine handles objects in memory.

  - A security feature bypass exists when Windows incorrectly validates kernel
    driver signatures.

  - in PowerShell that could allow an attacker to execute unlogged code.

  - in the way that Windows Deployment Services TFTP Server handles objects in
    memory.

  - in the way that Microsoft Graphics Components handle objects in memory.

  - when Kernel Remote Procedure Call Provider driver improperly initializes
    objects in memory.

  - when the Windows kernel improperly initializes objects in memory.

  - when VBScript improperly discloses the contents of its memory, which could
    provide an attacker with information to further compromise the user's computer
    or data.

  - when PowerShell improperly handles specially crafted files.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to run arbitrary code, bypass security restrictions and load improperly signed
  drivers into the kernel, gain the same user rights as the current user, obtain
  information to further compromise the user's system, improperly discloses file
  information and escalate privileges.");

  script_tag(name:"affected", value:"Microsoft Windows 8.1 for 32-bit/x64

  Microsoft Windows Server 2012 R2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4467697");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) <= 0){
  exit(0);
}

sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

fileVer = fetch_file_version(sysPath:sysPath, file_name:"Ole32.dll");
if(!fileVer){
  exit(0);
}

if(version_is_less(version:fileVer, test_version:"6.3.9600.19178"))
{
  report = report_fixed_ver(file_checked:sysPath + "\Ole32.dll",
                            file_version:fileVer, vulnerable_range:"Less than 6.3.9600.19178");
  security_message(data:report);
  exit(0);
}
exit(99);
