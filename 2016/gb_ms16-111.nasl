#############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-111.nasl 12363 2018-11-15 09:51:15Z asteins $
#
# Microsoft Windows Kernel Multiple Vulnerabilities (3186973)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.809220");
  script_version("$Revision: 12363 $");
  script_cve_id("CVE-2016-3305", "CVE-2016-3306", "CVE-2016-3371", "CVE-2016-3372",
                "CVE-2016-3373");
  script_bugtraq_id(92812, 92813, 92814, 92815, 92845);
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-11-15 10:51:15 +0100 (Thu, 15 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-09-14 08:08:04 +0530 (Wed, 14 Sep 2016)");
  script_name("Microsoft Windows Kernel Multiple Vulnerabilities (3186973)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-111");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaws are due to,

  - The kernel API improperly allows a user to access sensitive registry information.

  - The kernel API improperly enforces permissions.

  - Windows improperly handles session objects");

  script_tag(name:"impact", value:"Successful exploitation will allow local
  attackers to hijack the session of another user and to gain access to
  information that is not intended for the user and to impersonate processes,
  interject cross-process communication, or interrupt sslystem functionality.");

  script_tag(name:"affected", value:"Microsoft Windows Vista x32/x64 Edition Service Pack 2
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2
  Microsoft Windows 7 x32/x64 Edition Service Pack 1
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1
  Microsoft Windows 8.1 x32/x64 Edition
  Microsoft Windows Server 2012/2012R2
  Microsoft Windows 10 x32/x64
  Microsoft Windows 10 Version 1511 x32/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3186973");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/library/security/MS16-111");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networksgb_ms16-111.nasl GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-111");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, winVistax64:3, win2008:3, win2008x64:3,
                   win2008r2:2, win2012:1, win2012R2:1, win8_1:1, win8_1x64:1,
                   win10:1, win10x64:1) <= 0){
  exit(0);
}

kerPath = smb_get_systemroot();
if(!kerPath ){
  exit(0);
}

kerVer = fetch_file_version(sysPath: kerPath, file_name:"System32\Ntoskrnl.exe");
if(!kerVer){
  exit(0);
}

if (kerVer =~ "^(6\.0\.6002\.1)"){
  Vulnerable_range = "Less than 6.0.6002.19680";
}
else if (kerVer =~ "^(6\.0\.6002\.2)"){
  Vulnerable_range = "6.0.6002.24000 - 6.0.6002.24006";
}
else if (kerVer =~ "^(6\.1\.7601)"){
  Vulnerable_range = "Less than 6.1.7601.23539";
}
else if (kerVer =~ "^(6\.2\.9200)"){
  Vulnerable_range = "Less than 6.2.9200.21971";
}
else if (kerVer =~ "^(6\.3\.9600\.1)"){
  Vulnerable_range = "Less than 6.3.9600.18438";
}
else if (kerVer =~ "^(10\.0\.10240)"){
  Vulnerable_range = "Less than 10.0.10240.17113";
}
else if (kerVer =~ "^(10\.0\.10586)"){
  Vulnerable_range = "10.0.10586.0 - 10.0.10586.588";
}

if(hotfix_check_sp(winVista:3, winVistax64:3, win2008x64:3, win2008:3) > 0)
{
  if(version_is_less(version:kerVer, test_version:"6.0.6002.19680")||
     version_in_range(version:kerVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.24006")){
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  ## Presently GDR information is not available.
  if(version_is_less(version:kerVer, test_version:"6.1.7601.23539")){
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win2012:1) > 0)
{
  ## Presently GDR information is not available.
  if(version_is_less(version:kerVer, test_version:"6.2.9200.21971")){
     VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  if(version_is_less(version:kerVer, test_version:"6.3.9600.18438")){
    VULN = TRUE ;
  }
}

if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  if(version_is_less(version:kerVer, test_version:"10.0.10240.17113"))
  {
    Vulnerable_range = "Less than 10.0.10240.17113";
    VULN = TRUE ;
  }
  else if(version_in_range(version:kerVer, test_version:"10.0.10586.0", test_version2:"10.0.10586.588"))
  {
    Vulnerable_range = "10.0.10586.0 - 10.0.10586.588";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + kerPath + "\system32\Ntoskrnl.exe" + '\n' +
           'File version:     ' + kerVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
