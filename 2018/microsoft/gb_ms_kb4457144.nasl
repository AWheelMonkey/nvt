###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4457144.nasl 11417 2018-09-17 05:40:56Z cfischer $
#
# Microsoft Windows Multiple Vulnerabilities (KB4457144)
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
  script_oid("1.3.6.1.4.1.25623.1.0.814015");
  script_version("$Revision: 11417 $");
  script_cve_id("CVE-2018-5391", "CVE-2018-8271", "CVE-2018-8315", "CVE-2018-8332",
                "CVE-2018-8336", "CVE-2018-8392", "CVE-2018-8393", "CVE-2018-8410",
                "CVE-2018-8419", "CVE-2018-8420", "CVE-2018-8422", "CVE-2018-8424",
                "CVE-2018-8433", "CVE-2018-8434", "CVE-2018-8440", "CVE-2018-8442",
                "CVE-2018-8443", "CVE-2018-8446", "CVE-2018-8447", "CVE-2018-8452",
                "CVE-2018-8457", "CVE-2018-8468", "CVE-2018-8470", "CVE-2018-8475");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-17 07:40:56 +0200 (Mon, 17 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-12 12:17:54 +0530 (Wed, 12 Sep 2018)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4457144)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4457144.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,

  - Denial of service vulnerability (named 'FragmentSmack').

  - Hyper-V on a host server fails to properly validate guest operating system
    user input.

  - Windows bowser.sys kernel-mode driver fails to properly handle objects in
    memory.

  - Browser scripting engine improperly handle object types.

  - Windows font library improperly handles specially crafted embedded fonts.

  - Windows kernel improperly handles objects in memory.

  - Microsoft JET Database Engine improperly handles objects in memory.

  - Windows Kernel API improperly handles registry objects in memory.

  - Windows kernel fails to properly initialize a memory address.

  - MSXML parser improperly processes user input.

  - Windows GDI component improperly handles objects in memory.

  - Windows GDI component improperly discloses the contents of its memory.

  - Windows Graphics component improperly handles objects in memory.

  - Windows improperly handles calls to Advanced Local Procedure Call (ALPC).

  - Internet Explorer improperly accesses objects in memory.

  - Scripting engine improperly handles objects in memory.

  - Windows improperly parses files.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to crash the affected system, execute arbitrary code on the host operating system,
  disclose contents of System memory and also read privileged data across trust
  boundaries.");

  script_tag(name:"affected", value:"Windows Server 2008 R2 for x64-based Systems Service Pack 1

  Windows 7 for 32-bit/x64-based Systems Service Pack 1.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4457144");
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

if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) <= 0){
  exit(0);
}

sysPath = smb_get_system32root();
if(!sysPath){
  exit(0);
}

urlVer = fetch_file_version(sysPath, file_name:"Urlmon.dll");
if(!urlVer){
  exit(0);
}

if(version_is_less(version:urlVer, test_version:"11.0.9600.19130"))
{
  report = report_fixed_ver(file_checked:sysPath + "\Urlmon.dll",
                            file_version:urlVer, vulnerable_range:"Less than 11.0.9600.19130");
  security_message(port:0, data:report);
  exit(0);
}

exit(99);