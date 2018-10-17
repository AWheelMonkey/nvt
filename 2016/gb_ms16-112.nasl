###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-112.nasl 11837 2018-10-11 09:17:05Z asteins $
#
# Microsoft Windows Lock Screen Elevation of Privilege Vulnerability (3178469)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.809308");
  script_version("$Revision: 11837 $");
  script_cve_id("CVE-2016-3302");
  script_bugtraq_id(92853);
  script_tag(name:"cvss_base", value:"6.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 11:17:05 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-09-14 07:48:12 +0530 (Wed, 14 Sep 2016)");
  script_name("Microsoft Windows Lock Screen Elevation of Privilege Vulnerability (3178469)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-112.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to when windows improperly
  allows web content to load from the Windows lock screen.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to execute code on a user's locked computer.");

  script_tag(name:"affected", value:"Microsoft Windows 8.1 x32/x64 Edition

  Microsoft Windows 10 x32/x64

  Microsoft Windows Server 2012R2

  Microsoft Windows 10 Version 1511 x32/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3178469");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-112");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(hotfix_check_sp(win2012R2:1, win8_1:1, win8_1x64:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

PniVer = fetch_file_version(sysPath, file_name:"System32\Pnidui.dll");
if(!PniVer){
  exit(0);
}


## Win 8.1 and win2012R2
if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  if(version_is_less(version:PniVer, test_version:"6.3.9600.18434"))
  {
    Vulnerable_range = "Less than 6.3.9600.18434";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  if(version_is_less(version:PniVer, test_version:"10.0.10240.17113"))
  {
    Vulnerable_range = "Less than 10.0.10240.17113";
    VULN = TRUE;
  }

  else if(version_in_range(version:PniVer, test_version:"10.0.10586.0", test_version2:"10.0.10586.588"))
  {
    Vulnerable_range = "10.0.10586.0 - 10.0.10586.588";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\System32\Pnidui.dll" + '\n' +
           'File version:     ' + PniVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
