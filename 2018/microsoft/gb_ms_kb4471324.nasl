###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4471324.nasl 12777 2018-12-12 16:20:50Z santu $
#
# Microsoft Windows Multiple Vulnerabilities (KB4471324)
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
  script_oid("1.3.6.1.4.1.25623.1.0.814611");
  script_version("$Revision: 12777 $");
  script_cve_id("CVE-2018-8477", "CVE-2018-8514", "CVE-2018-8517", "CVE-2018-8540",
                "CVE-2018-8596", "CVE-2018-8599", "CVE-2018-8611", "CVE-2018-8612",
                "CVE-2018-8617", "CVE-2018-8618", "CVE-2018-8619", "CVE-2018-8624",
                "CVE-2018-8625", "CVE-2018-8626", "CVE-2018-8629", "CVE-2018-8631",
                "CVE-2018-8634", "CVE-2018-8637", "CVE-2018-8639", "CVE-2018-8641",
                "CVE-2018-8643", "CVE-2018-8583", "CVE-2018-8595");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-12-12 17:20:50 +0100 (Wed, 12 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-12 09:46:04 +0530 (Wed, 12 Dec 2018)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4471324)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4471324");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,

  - Windows kernel fails to properly handle objects in memory.

  - Connected User Experiences and Telemetry Service fails to validate
    certain function values.

  - Chakra scripting engine improperly handles objects in memory in Microsoft Edge.

  - Internet Explorer VBScript execution policy does not properly restrict
    VBScript under specific conditions.

  - VBScript engine improperly handles objects in memory.

  - Windows Domain Name System (DNS) servers fail to properly handle requests.

  - Scripting engine handles objects in memory in Internet Explorer.

  - Windows kernel-mode driver fails to properly handle objects in memory.

  - Windows GDI component improperly discloses the contents of its memory.

  - Diagnostics Hub Standard Collector Service improperly impersonates certain
    file operations.

  - Remote Procedure Call runtime improperly initializes objects in memory.

  - Windows Win32k component fails to properly handle objects in memory.

  - An error in Windows kernel could allow an attacker to retrieve information
    that could lead to a Kernel Address Space Layout Randomization (KASLR) bypass.

  - Microsoft text-to-speech fails to properly handle objects in the memory.

  - Internet Explorer improperly accesses objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to run arbitrary code in kernel mode, deny dependent security feature functionality,
  gain elevated privileges, obtain sensitive information and could cause a denial
  of service.");

  script_tag(name:"affected", value:"Windows 10 Version 1803 for 32-bit Systems

  Windows 10 Version 1803 for x64-based Systems");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4471324");
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

if(version_in_range(version:edgeVer, test_version:"11.0.17134.0", test_version2:"11.0.17134.470"))
{
  report = report_fixed_ver(file_checked:sysPath + "\Edgehtml.dll",
                            file_version:edgeVer, vulnerable_range:"11.0.17134.0 - 11.0.17134.470");
  security_message(data:report);
  exit(0);
}
exit(99);
