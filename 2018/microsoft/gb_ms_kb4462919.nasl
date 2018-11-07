###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4462919.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# Microsoft Windows Multiple Vulnerabilities (KB4462919)
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
  script_oid("1.3.6.1.4.1.25623.1.0.814080");
  script_version("$Revision: 12120 $");
  script_cve_id("CVE-2018-8494", "CVE-2018-8495", "CVE-2018-8497", "CVE-2018-8503",
                "CVE-2018-8320", "CVE-2018-8329", "CVE-2018-8330", "CVE-2018-8333",
                "CVE-2018-8411", "CVE-2018-8413", "CVE-2018-8423", "CVE-2018-8453",
                "CVE-2018-8460", "CVE-2018-8472", "CVE-2018-8481", "CVE-2018-8482",
                "CVE-2018-8484", "CVE-2018-8486", "CVE-2018-8489", "CVE-2018-8491",
                "CVE-2018-8492", "CVE-2018-8493", "CVE-2018-8505", "CVE-2018-8506",
                "CVE-2018-8509", "CVE-2018-8530");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-10 09:28:04 +0530 (Wed, 10 Oct 2018)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4462919)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4462919");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,

  - Windows Hyper-V on a host server fails to properly validate input from an
    authenticated user on a guest operating system.

  - Internet Explorer improperly accesses objects in memory.

  - Windows Media Player improperly discloses file information.

  - DirectX Graphics Kernel (DXGKRNL) driver improperly handles objects in memory.

  - Windows Subsystem for Linux fails to properly handle objects in memory.

  - Microsoft Edge improperly handles requests of different origins.

  - Windows Theme API does not properly decompress files.

  - NTFS improperly checks access.

  - Windows Win32k component fails to properly handle objects in memory.

  - Windows Graphics Device Interface (GDI) improperly handles objects in memory.

  - Windows Kernel improperly handles objects in memory.

  - Windows Shell improperly handles URIs.

  - Microsoft XML Core Services MSXML parser improperly processes user input.

  - Windows TCP/IP stack improperly handles fragmented IP packets.

  - An input validation error in Device Guard.

  - Filter Manager improperly handles objects in memory.

  - Windows kernel improperly handles objects in memory.

  - Microsoft Edge improperly accesses objects in memory.

  - Chakra scripting engine improperly handles objects in memory in Microsoft Edge.

  - Microsoft Windows Codecs Library improperly handles objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to run arbitrary code, bypass security restrictions, gain the same user rights
  as the current user, obtain information to further compromise the user's system,
  improperly discloses file information and escalate privileges.");

  script_tag(name:"affected", value:"Windows 10 Version 1803 for 32-bit Systems

  Windows 10 Version 1803 for x64-based Systems");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4462919");
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

if(version_in_range(version:edgeVer, test_version:"11.0.17134.0", test_version2:"11.0.17134.344"))
{
  report = report_fixed_ver(file_checked:sysPath + "\Edgehtml.dll",
                            file_version:edgeVer, vulnerable_range:"11.0.17134.0 - 11.0.17134.344");
  security_message(data:report);
  exit(0);
}
exit(99);
