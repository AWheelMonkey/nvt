###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4088782.nasl 12410 2018-11-19 10:06:05Z cfischer $
#
# Microsoft Windows Multiple Vulnerabilities (KB4088782)
#
# Authors:
# Rajat Mishra <rajatm@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.812830");
  script_version("$Revision: 12410 $");
  script_cve_id("CVE-2018-0811", "CVE-2018-0813", "CVE-2018-0814", "CVE-2018-0886",
                "CVE-2018-0888", "CVE-2018-0889", "CVE-2018-0891", "CVE-2018-0893",
                "CVE-2018-0894", "CVE-2018-0895", "CVE-2018-0896", "CVE-2018-0897",
                "CVE-2018-0898", "CVE-2018-0899", "CVE-2018-0900", "CVE-2018-0901",
                "CVE-2018-0902", "CVE-2018-0904", "CVE-2018-0926", "CVE-2018-0927",
                "CVE-2018-0929", "CVE-2018-0931", "CVE-2018-0932", "CVE-2018-0933",
                "CVE-2018-0934", "CVE-2018-0935", "CVE-2018-0937", "CVE-2018-0939",
                "CVE-2018-0942", "CVE-2018-0977", "CVE-2018-0983", "CVE-2018-0817",
                "CVE-2018-0868", "CVE-2018-0872", "CVE-2018-0873", "CVE-2018-0874",
                "CVE-2018-0876", "CVE-2018-0877", "CVE-2018-0878", "CVE-2018-0880",
                "CVE-2018-0881", "CVE-2018-0882", "CVE-2018-0883", "CVE-2018-0884",
                "CVE-2018-0885");
  script_bugtraq_id(103232, 103250, 103251, 103265, 103262, 103295, 103309, 103288,
                    103231, 103238, 103240, 103241, 103242, 103243, 103244, 103245,
                    103266, 103246, 103247, 103310, 103299, 103273, 103307, 103274,
                    103275, 103298, 103271, 103305, 103312, 103380, 103381, 103236,
                    103267, 103268, 103269, 103289, 103227, 103230, 103303, 103256,
                    103256, 103257, 103259, 103260, 103261);
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-19 11:06:05 +0100 (Mon, 19 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-03-14 09:56:32 +0530 (Wed, 14 Mar 2018)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4088782)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4088782");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,

  - The way that the scripting engine handles objects in memory in Microsoft
    Edge and Internet Explorer.

  - Windows Hyper-V on a host operating system fails to properly validate
    input from an authenticated user on a guest operating system.

  - Windows Scripting Host which could allow an attacker to bypass Device
    Guard.

  - Microsoft Hyper-V Network Switch on a host server fails to properly
    validate input from a privileged user on a guest operating system.

  - The Credential Security Support Provider protocol (CredSSP).

  - Windows kernel-mode driver fails to properly handle
    objects in memory.

  - Windows Desktop Bridge does not properly manage the virtual registry.

  - Microsoft Video Control mishandles objects in memory.

  - Windows Shell does not properly validate file copy destinations.

  - Storage Services improperly handles objects in memory.

  - Internet Explorer fails a check, allowing sandbox escape.

  - The Windows kernel that could allow an attacker to retrieve information
    that could lead to a Kernel Address Space Layout Randomization (ASLR) bypass.

  - The Windows Installer when the Windows Installer fails to properly sanitize
    input leading to an insecure library loading behavior.

  - The Cryptography Next Generation (CNG) kernel-mode driver.

  - Windows Desktop Bridge VFS does not take into acccount user/kernel
    mode when managing file paths.

  - Windows Remote Assistance incorrectly processes XML External Entities
    (XXE).

  - Windows Graphics Device Interface (GDI) handles objects in
    memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker
  to gain access to information, crash server and run arbitrary code in system
  mode.");

  script_tag(name:"affected", value:"Microsoft Windows 10 Version 1703 x32/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4088782");
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

if(hotfix_check_sp(win10:1, win10x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

edgeVer = fetch_file_version(sysPath:sysPath, file_name:"edgehtml.dll");
if(!edgeVer){
  exit(0);
}

if(version_in_range(version:edgeVer, test_version:"11.0.15063.0", test_version2:"11.0.15063.965"))
{
  report = report_fixed_ver(file_checked:sysPath + "\edgehtml.dll",
  file_version:edgeVer, vulnerable_range:"11.0.15063.0 - 11.0.15063.965");
  security_message(data:report);
  exit(0);
}
exit(0);
