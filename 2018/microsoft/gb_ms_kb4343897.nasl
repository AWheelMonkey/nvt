###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4343897.nasl 12193 2018-11-02 03:47:13Z ckuersteiner $
#
# Microsoft Windows Multiple Vulnerabilities (KB4343897)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.813842");
  script_version("$Revision: 12193 $");
  script_cve_id("CVE-2018-3615", "CVE-2018-3620", "CVE-2018-3646", "CVE-2018-0952",
                "CVE-2018-8200", "CVE-2018-8204", "CVE-2018-8266", "CVE-2018-8350",
                "CVE-2018-8316", "CVE-2018-8339", "CVE-2018-8340", "CVE-2018-8341",
                "CVE-2018-8343", "CVE-2018-8344", "CVE-2018-8345", "CVE-2018-8347",
                "CVE-2018-8348", "CVE-2018-8349", "CVE-2018-8351", "CVE-2018-8353",
                "CVE-2018-8355", "CVE-2018-8357", "CVE-2018-8377", "CVE-2018-8360",
                "CVE-2018-8370", "CVE-2018-8371", "CVE-2018-8372", "CVE-2018-8373",
                "CVE-2018-8381", "CVE-2018-8385", "CVE-2018-8390", "CVE-2018-8389",
                "CVE-2018-8394", "CVE-2018-8398", "CVE-2018-8401", "CVE-2018-8403",
                "CVE-2018-8399", "CVE-2018-8400", "CVE-2018-8404", "CVE-2018-8405",
                "CVE-2018-8406", "CVE-2018-8414", "CVE-2018-8388");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-02 04:47:13 +0100 (Fri, 02 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-08-15 12:31:47 +0530 (Wed, 15 Aug 2018)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4343897)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4343897");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,

  - A new speculative execution side channel vulnerability known as L1 Terminal
    Fault.

  - Diagnostics Hub Standard Collector allows file creation in arbitrary locations.

  - Multiple security feature bypass vulnerability exists in Device Guard.

  - Microsoft Windows PDF Library improperly handles objects in memory.

  - Chakra scripting engine improperly handles objects in memory in Microsoft Edge.

  - Internet Explorer improperly validates hyperlinks before loading executable
    libraries.

  - Windows Installer fails to properly sanitize input leading to an insecure library
    loading behavior.

  - Active Directory Federation Services (AD FS) improperly handles multi-factor
    authentication requests.

  - Windows kernel, DirectX Graphics Kernel (DXGKRNL) driver and Win32k component
    improperly handles objects in memory.

  - NDIS fails to check the length of a buffer prior to copying memory to it.

  - Windows font library improperly handles specially crafted embedded fonts.

  - An improper processing for a .LNK file.

  - Windows kernel fails to properly handle parsing of certain symbolic links.

  - 'Microsoft COM for Windows' fails to properly handle serialized objects.

  - Microsoft browsers improperly allow cross-frame interaction.

  - Microsoft browsers allowing sandbox escape.

  - Microsoft Edge improperly handles redirect requests and specific HTML content.

  - Microsoft .NET Framework improperly access information in multi-tenant environments.

  - WebAudio Library improperly handles audio requests.

  - Windows GDI component improperly discloses the contents of its memory.

  - Microsoft Edge improperly accesses objects in memory.

  - Windows Shell does not properly validate file paths.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to execute arbitrary code, run processes in an elevated context, obtain
  information to further compromise the user's system, trick a user into believing
  that the user was on a legitimate website, read privileged data across trust
  boundaries and also bypass certain security restrictions.");

  script_tag(name:"affected", value:"Windows 10 Version 1709 for 32-bit Systems

  Windows 10 Version 1709 for 64-based Systems.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4343897");
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

if(version_in_range(version:edgeVer, test_version:"11.0.16299.0", test_version2:"11.0.16299.610"))
{
  report = report_fixed_ver(file_checked:sysPath + "\Edgehtml.dll",
                            file_version:edgeVer, vulnerable_range:"11.0.16299.0 - 11.0.16299.610");
  security_message(data:report);
  exit(0);
}
