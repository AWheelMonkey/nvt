###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4022717.nasl 12021 2018-10-22 14:54:51Z mmartin $
#
# Microsoft Windows Multiple Vulnerabilities (KB4022717)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.811165");
  script_version("$Revision: 12021 $");
  script_cve_id("CVE-2017-0193", "CVE-2017-8473", "CVE-2017-8474", "CVE-2017-8475",
                "CVE-2017-8527", "CVE-2017-8528", "CVE-2017-0282", "CVE-2017-8476",
                "CVE-2017-8477", "CVE-2017-8531", "CVE-2017-0283", "CVE-2017-0284",
                "CVE-2017-8478", "CVE-2017-8479", "CVE-2017-8532", "CVE-2017-8533",
                "CVE-2017-0285", "CVE-2017-0287", "CVE-2017-8480", "CVE-2017-8481",
                "CVE-2017-8543", "CVE-2017-0288", "CVE-2017-0289", "CVE-2017-8482",
                "CVE-2017-8483", "CVE-2017-8544", "CVE-2017-0291", "CVE-2017-0292",
                "CVE-2017-8484", "CVE-2017-8485", "CVE-2017-8553", "CVE-2017-0294",
                "CVE-2017-0296", "CVE-2017-8488", "CVE-2017-8489", "CVE-2017-8490",
                "CVE-2017-0297", "CVE-2017-0298", "CVE-2017-0299", "CVE-2017-8491",
                "CVE-2017-8492", "CVE-2017-0300", "CVE-2017-8460", "CVE-2017-8493",
                "CVE-2017-8462", "CVE-2017-8464", "CVE-2017-8469", "CVE-2017-8470",
                "CVE-2017-8471", "CVE-2017-8465", "CVE-2017-8466", "CVE-2017-8468",
                "CVE-2017-8554");
  script_bugtraq_id(98878, 98852, 98902, 98853, 98933, 98949, 98885, 98903, 98854,
                    98819, 98920, 98918, 98845, 98856, 98820, 98821, 98914, 98922,
                    98857, 98862, 98824, 98923, 98929, 98858, 98859, 98826, 98835,
                    98836, 98847, 98860, 98940, 98837, 98839, 98864, 98865, 98867,
                    98840, 98884, 98869, 98870, 98901, 98887, 98850, 98900, 98818,
                    98842, 98848, 98849, 98843, 98844, 98846);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-22 16:54:51 +0200 (Mon, 22 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-14 10:42:25 +0530 (Wed, 14 Jun 2017)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4022717)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4022717");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"This security update includes quality
  improvements.

  - Addressed issue where, after installing KB3170455 (MS16-087), users have
    difficulty importing printer drivers and get errors with error code 0x80070bcb.

  - Addressed a rare issue where mouse input can cease to function. The mouse
    pointer may continue to move, but movements and clicks produce no response other
    than a beeping noise.

  - Addressed issue where printing a document using a 32-bit application can crash a
    Print Server in a call to nt!MiGetVadWakeList.

  - Addressed issue where an unsupported hardware notification is shown and Windows
    Updates not scanning, for systems using the AMD Carrizo DDR4 processor or
    Windows Server 2012 R2 systems using Xeon E3V6 processor.

  - Security updates to Microsoft Windows PDF, Windows shell, Windows Kernel,
    Microsoft Graphics Component, Microsoft Uniscribe, Microsoft Scripting Engine,
    Windows COM, and Windows Kernel-Mode Drivers. For more information about the
    security vulnerabilities resolved, please refer to the Security Update Guide.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  attackers to gain the same user rights as the current user. If the current user is
  logged on with administrative user rights, an attacker who successfully exploited the
  vulnerability could take control of an affected system. An attacker could then install
  programs. View, change, or delete data, or create new accounts with full user rights.");

  script_tag(name:"affected", value:"Microsoft Windows 8.1 for 32-bit/x64

  Microsoft Windows Server 2012 R2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4022717");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

fileVer = fetch_file_version(sysPath:sysPath, file_name:"Win32k.sys");
if(!fileVer){
  exit(0);
}

if(version_is_less(version:fileVer, test_version:"6.3.9600.18698"))
{
  report = 'File checked:     ' + sysPath + "\Win32k.sys" + '\n' +
           'File version:     ' + fileVer  + '\n' +
           'Vulnerable range:  Less than 6.3.9600.18698\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
