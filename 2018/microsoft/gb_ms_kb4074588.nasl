###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4074588.nasl 10918 2018-08-10 17:32:46Z cfischer $
#
# Microsoft Windows Multiple Vulnerabilities (KB4074588)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.812915");
  script_version("$Revision: 10918 $");
  script_cve_id("CVE-2018-0742", "CVE-2018-0756", "CVE-2018-0757", "CVE-2018-0763",
                "CVE-2018-0809", "CVE-2018-0820", "CVE-2018-0821", "CVE-2018-0822",
                "CVE-2018-0823", "CVE-2018-0825", "CVE-2018-0826", "CVE-2018-0827",
                "CVE-2018-0829", "CVE-2018-0830", "CVE-2018-0831", "CVE-2018-0832",
                "CVE-2018-0834", "CVE-2018-0835", "CVE-2018-0836", "CVE-2018-0837",
                "CVE-2018-0838", "CVE-2018-0840", "CVE-2018-0842", "CVE-2018-0843",
                "CVE-2018-0844", "CVE-2018-0846", "CVE-2018-0847", "CVE-2018-0856",
                "CVE-2018-0857", "CVE-2018-0859", "CVE-2018-0860", "CVE-2018-0866");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 19:32:46 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-02-14 13:19:41 +0530 (Wed, 14 Feb 2018)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4074588)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4074588");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,

  - Multiple errors error in the way the scripting engine handles objects in
    memory in Microsoft  browsers.

  - An error when the Windows kernel fails to properly handle objects in memory.

  - An error when the Windows kernel fails to properly initialize a memory address.

  - An error when the Windows Common Log File System (CLFS) driver improperly
    handles objects in memory.

  - An error when VBScript improperly discloses the contents of its memory, which
    could provide an attacker with information to further compromise the user
    computer or data.

  - An error when Storage Services improperly handles objects in memory.

  - An error in Windows Scripting Host which could allow an attacker to bypass
    Device Guard.

  - An error in StructuredQuery when the software fails to properly handle objects
    in memory.

  - An error when NTFS improperly handles objects.

  - An error when Named Pipe File System improperly handles objects.

  - An error when AppContainer improperly implements constrained impersonation.

  - An error as Microsoft has deprecated the Document Signing functionality in XPS
    Viewer.

  - An error in the Windows kernel that could allow an attacker to retrieve
    information that could lead to a Kernel Address Space Layout Randomization
    (ASLR) bypass.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to gain the same user rights as the current user, run arbitrary code in kernel
  mode, obtain information to further compromise the user, run processes in an
  elevated context, circumvent a User Mode Code Integrity (UMCI) policy on the
  machine, spoof content, perform phishing attacks, or otherwise manipulate
  content of a document.

  Impact Level: System");

  script_tag(name:"affected", value:"Windows 10 Version 1709 for 32-bit Systems

  Windows 10 Version 1709 for 64-based Systems");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4074588");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4074588");
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

sysPath = "";
edgeVer = "";

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

if(version_in_range(version:edgeVer, test_version:"11.0.16299.0", test_version2:"11.0.16299.247"))
{
  report = report_fixed_ver(file_checked:sysPath + "\edgehtml.dll",
           file_version:edgeVer, vulnerable_range:"11.0.16299.0 - 11.0.16299.247");
  security_message(data:report);
  exit(0);
}
exit(0);
