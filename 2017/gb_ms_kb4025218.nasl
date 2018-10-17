###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4025218.nasl 11879 2018-10-12 12:48:49Z mmartin $
#
# Microsoft Windows 'olecnv32.dll' Remote Code Execution Vulnerability (KB4025218)
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
  script_oid("1.3.6.1.4.1.25623.1.0.811203");
  script_version("$Revision: 11879 $");
  script_cve_id("CVE-2017-8487");
  script_bugtraq_id(99013);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:48:49 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-16 09:45:29 +0530 (Fri, 16 Jun 2017)");
  script_name("Microsoft Windows 'olecnv32.dll' Remote Code Execution Vulnerability (KB4025218)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4025218");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error within OLE
  which fails to properly validate user input.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to execute arbitrary code in the context of current user.");

  script_tag(name:"affected", value:"Microsoft Windows XP SP2 x64

  Microsoft Windows XP SP3 x86

  Microsoft Windows 2003 x32/x64 Edition Service Pack 2 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4025218");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4025687");

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

if(hotfix_check_sp(xp:4, xpx64:3, win2003:3, win2003x64:3) <= 0){
  exit(0);
}

sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

winVer = fetch_file_version(sysPath:sysPath, file_name:"Olecnv32.dll");
if(!winVer){
  exit(0);
}

if(hotfix_check_sp(xp:4) > 0)
{
  if(version_is_less(version:winVer, test_version:"5.1.2600.7285"))
  {
    Vulnerable_range = "Less than 5.1.2600.7285";
    VULN = TRUE ;
  }
}

if(hotfix_check_sp(win2003:3, win2003x64:3, xpx64:3) > 0)
{
  if(version_is_less(version:winVer, test_version:"5.2.3790.6113"))
  {
    Vulnerable_range = "Less than 5.2.3790.6113";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\Olecnv32.dll" + '\n' +
           'File version:     ' + winVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
