###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-105.nasl 11876 2018-10-12 12:20:01Z cfischer $
#
# MS Windows Hyper-V Security Feature Bypass Vulnerability (3091287)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.806046");
  script_version("$Revision: 11876 $");
  script_cve_id("CVE-2015-2534");
  script_tag(name:"cvss_base", value:"1.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:20:01 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-09-09 12:21:46 +0530 (Wed, 09 Sep 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("MS Windows Hyper-V Security Feature Bypass Vulnerability (3091287)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-105.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an improper use of access
  control lists.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  attacker to bypass network access control lists, allowing the attacker
  to gain unauthorized access to network resources.");

  script_tag(name:"affected", value:"Microsoft Windows 8.1 x64
  Microsoft Windows 10 x64
  Microsoft Windows Server 2012R2.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and install the hotfixes from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3087088");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS15-105");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(hotfix_check_sp(win8_1x64:1, win2012R2:1, win10x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath){
  exit(0);
}

dllVer = fetch_file_version(sysPath:sysPath, file_name:"system32\Vmsif.dll");
if(!dllVer){
  exit(0);
}

## Win 8.1 x64 and win2012R2
if(hotfix_check_sp(win8_1x64:1, win2012R2:1) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.3.9600.17396"))
  {
    Vulnerable_range = "Less than 6.3.9600.17396";
    VULN = TRUE ;
  }
}

##  Windows 10
else if(hotfix_check_sp(win10x64:1) > 0)
{
  if(version_is_less(version:dllVer, test_version:"10.0.10240.16384"))
  {
    Vulnerable_range = "Less than 10.0.10240.16384";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\system32\Vmsif.dll" + '\n' +
           'File version:     ' + dllVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
