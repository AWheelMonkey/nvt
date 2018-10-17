###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4338819.nasl 11388 2018-09-14 13:45:12Z cfischer $
#
# Microsoft Windows Multiple Vulnerabilities (KB4338819)
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
  script_oid("1.3.6.1.4.1.25623.1.0.813647");
  script_version("$Revision: 11388 $");
  script_cve_id("CVE-2018-8282", "CVE-2018-8284", "CVE-2018-0949", "CVE-2018-8125",
                "CVE-2018-8202", "CVE-2018-8206", "CVE-2018-8222", "CVE-2018-8242",
                "CVE-2018-8260", "CVE-2018-8262", "CVE-2018-8274", "CVE-2018-8275",
                "CVE-2018-8276", "CVE-2018-8278", "CVE-2018-8279", "CVE-2018-8280",
                "CVE-2018-8286", "CVE-2018-8287", "CVE-2018-8288", "CVE-2018-8289",
                "CVE-2018-8290", "CVE-2018-8291", "CVE-2018-8294", "CVE-2018-8296",
                "CVE-2018-8297", "CVE-2018-8301", "CVE-2018-8307", "CVE-2018-8308",
                "CVE-2018-8309", "CVE-2018-8313", "CVE-2018-8324", "CVE-2018-8325",
                "CVE-2018-8356", "CVE-2016-7279");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-14 15:45:12 +0200 (Fri, 14 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-07-11 10:43:41 +0530 (Wed, 11 Jul 2018)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4338819)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4338819");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaws exist due to errors,

  - When Windows improperly handles File Transfer Protocol (FTP) connections.

  - When Windows improperly handles objects in memory.

  - When the Windows kernel fails to properly handle objects in memory.

  - When Microsoft WordPad improperly handles embedded OLE objects.

  - When Microsoft Edge improperly accesses objects in memory.

  - When scripting engine improperly handles objects in memory in Microsoft
    browsers.

  - When Chakra scripting engine improperly handles objects in memory in
    Microsoft Edge.

  - When the Windows kernel-mode driver fails to properly handle objects in
    memory.

  - Microsoft Chakra scripting engine allows Control Flow Guard (CFG) to be
    bypassed.

  - When Microsoft Internet Explorer improperly handles requests involving UNC
    resources.

  - When Microsoft Edge improperly handles specific HTML content.

  - When Windows Kernel API improperly enforces permissions.

  - When Microsoft .NET Framework components do not correctly validate
    certificates.

  - A security feature bypass vulnerability exists in Device Guard.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to cause a target system to stop responding, elevate their privilege level,
  run arbitrary code, bypass security, disclose sensitive information and also
  take control of an affected system.

  Impact Level: System");

  script_tag(name:"affected", value:"Windows 10 Version 1803 for 32-bit Systems

  Windows 10 Version 1803 for x64-based Systems");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4338819");
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

edgeVer = fetch_file_version(sysPath, file_name:"edgehtml.dll");
if(!edgeVer){
  exit(0);
}

if(version_in_range(version:edgeVer, test_version:"11.0.17134.0", test_version2:"11.0.17134.164"))
{
  report = report_fixed_ver(file_checked:sysPath + "\Edgehtml.dll",
                            file_version:edgeVer, vulnerable_range:"11.0.17134.0 - 11.0.17134.164");
  security_message(data:report);
  exit(0);
}
exit(99);
