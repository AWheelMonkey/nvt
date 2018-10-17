###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_hypervisor_kb3217845.nasl 11879 2018-10-12 12:48:49Z mmartin $
#
# Microsoft Windows Hypervisor Code Integrity Privilege Escalation Vulnerability (KB3217845)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.811211");
  script_version("$Revision: 11879 $");
  script_cve_id("CVE-2017-0193");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:48:49 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-20 17:50:43 +0530 (Tue, 20 Jun 2017)");
  script_name("Microsoft Windows Hypervisor Code Integrity Privilege Escalation Vulnerability (KB3217845)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB3217845");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error in the
  Windows Hyper-V instruction emulation which fails to properly enforce privilege
  levels.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to gain elevated privileges on a target guest operating system. The host operating
  system is not vulnerable to this attack.");

  script_tag(name:"affected", value:"Windows Server 2008 for x64-based Systems Service Pack 2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3217845");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3217845");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win2008x64:3) <= 0){
  exit(0);
}

sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

fileVer = fetch_file_version(sysPath:sysPath, file_name:"hvax64.exe");
if(!fileVer){
  exit(0);
}

if(version_is_less(version:fileVer, test_version:"6.0.6002.19783"))
{
  Vulnerable_range = "Less than 6.0.6002.19783";
  VULN = TRUE ;
}

else if(version_in_range(version:fileVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.24101"))
{
  Vulnerable_range = "6.0.6002.23000 - 6.0.6002.24101";
  VULN = TRUE ;
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\hvax64.exe" + '\n' +
           'File version:     ' + fileVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
