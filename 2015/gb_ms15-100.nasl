###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-100.nasl 11876 2018-10-12 12:20:01Z cfischer $
#
# Microsoft Windows Media Center Remote Code Execution Vulnerability (3087918)
#
# Authors:
# Deependra Bapna <bdeependra@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.805737");
  script_version("$Revision: 11876 $");
  script_cve_id("CVE-2015-2509");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:20:01 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-09-09 11:34:04 +0530 (Wed, 09 Sep 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Windows Media Center Remote Code Execution Vulnerability (3087918)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-100.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Flaw is due to an improper handling media
  center link file.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary code in the context of the current user.");

  script_tag(name:"affected", value:"Windows Media Center for

  - Microsoft Windows Vista x32/x64 Service Pack 2 and prior

  - Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior

  - Microsoft Windows 8 x32/x64 Edition

  - Microsoft Windows 8.1 x32/x64 Edition");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  link, https://technet.microsoft.com/en-us/library/security/MS15-100");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3087918");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/library/security/MS15-100");

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

if(hotfix_check_sp(win7:2, win7x64:2, win8:1, win8x64:1, win8_1:1, win8_1x64:1,
                   winVista:3) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath){
  exit(0);
}

media_center_ver = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\Current" +
                                       "Version\Media Center", item:"Ident");

if(!media_center_ver){
  exit(0);
}

ehshell_ver = fetch_file_version(sysPath:sysPath, file_name:"ehome\Ehshell.dll");
if(!ehshell_ver){
  exit(0);
}

if(hotfix_check_sp(win7:2) > 0)
{
  if(version_is_less(version:ehshell_ver, test_version:"6.1.7601.18968")){
      Vulnerable_range = "Less Than 6.1.7601.18968";
      VULN = TRUE ;
  }
  else if(version_in_range(version:ehshell_ver, test_version:"6.1.7601.22000", test_version2:"6.1.7601.23170"))
  {
     Vulnerable_range = "6.1.7601.22000 - 6.1.7601.23170";
     VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win8:1, win8x64:1) > 0)
{
  if(version_is_less(version:ehshell_ver, test_version:"6.2.9200.17486"))
  {
    Vulnerable_range = "Less Than 6.2.9200.17486";
    VULN = TRUE ;
  }
  else if(version_in_range(version:ehshell_ver, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21600"))
  {
    Vulnerable_range = "6.2.9200.20000 - 6.2.9200.21600";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win8_1:1, win8_1x64:1) > 0)
{
  if(version_is_less(version:ehshell_ver, test_version:"6.3.9600.18015"))
  {
    Vulnerable_range = "Less Than 6.3.9600.18015";
    VULN = TRUE ;
  }
}

## Currently not supporting for Vista 64 bit
else if(hotfix_check_sp(winVista:3) > 0)
{
  if(version_is_less(version:ehshell_ver, test_version:"6.0.6002.19478"))
  {
    Vulnerable_range = "Less Than 6.0.6002.19478";
    VULN = TRUE ;
  }
  else if (version_in_range(version:ehshell_ver, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23787"))
  {
    Vulnerable_range = "6.0.6002.23000 - 6.0.6002.23787";
    VULN = TRUE ;
  }
}


if(VULN)
{
  report = 'File checked:     ' + sysPath + "ehome\Ehshell.dll" + '\n' +
           'File version:     ' + ehshell_ver  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
