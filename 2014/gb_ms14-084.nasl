###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms14-084.nasl 11876 2018-10-12 12:20:01Z cfischer $
#
# MS Windows VBScript Remote Code Execution Vulnerability (3016711)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:microsoft:ie";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805206");
  script_version("$Revision: 11876 $");
  script_cve_id("CVE-2014-6363");
  script_bugtraq_id(71504);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:20:01 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-12-10 08:42:37 +0530 (Wed, 10 Dec 2014)");
  script_tag(name:"solution_type", value:"VendorFix");
  script_name("MS Windows VBScript Remote Code Execution Vulnerability (3016711)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS14-084.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to error in Microsoft VBScript
  Engine triggered when user-supplied input is not properly sanitized.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary code and corrupt memory.");

  script_tag(name:"affected", value:"Microsoft Windows 2003 x32/x64 Service Pack 2 and prior
  Microsoft Windows Vista x32/x64 Service Pack 2 and prior
  Microsoft Windows Server 2008 x32/x64 Service Pack 2 and prior
  Microsoft Windows 7 x32/x64 Service Pack 1 and prior
  Microsoft Windows Server 2008 R2 x64 Service Pack 1 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and install the hotfixes from the referenced advisory.");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://support.microsoft.com/kb/3016711");
  script_xref(name:"URL", value:"https://support.microsoft.com/kb/3012168");
  script_xref(name:"URL", value:"https://support.microsoft.com/kb/3012172");
  script_xref(name:"URL", value:"https://support.microsoft.com/kb/3012176");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/ms14-084");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl", "gb_ms_ie_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/IE/Version");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS14-084");
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win2003:3, win2003x64:3, winVista:3, winVistax64:3,
                   win7:2, win7x64:2, win2008:3, win2008x64:3, win2008r2:2) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

ieVer = get_app_version(cpe:CPE);
if(!ieVer || !(ieVer =~ "^(6|7|8)")){
  exit(0);
}

dllVer = fetch_file_version(sysPath:sysPath, file_name:"system32\Vbscript.dll");
if(!dllVer){
  exit(0);
}

if(hotfix_check_sp(win2003:3, win2003x64:3) > 0)
{
  if((ieVer =~ "^6" && version_in_range(version:dllVer, test_version:"5.6", test_version2:"5.6.0.8852")) ||
     (ieVer =~ "^(6|7)" && version_in_range(version:dllVer, test_version:"5.7", test_version2:"5.7.6002.23527")) ||
     (ieVer =~ "^8" && version_in_range(version:dllVer, test_version:"5.8", test_version2:"5.8.6001.23641"))){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

## Currently not supporting for Vista and Windows Server 2008 64 bit
if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  if((ieVer =~ "^(6|7)" && version_in_range(version:dllVer, test_version:"5.7", test_version2:"5.7.6002.19220")) ||
     (ieVer =~ "^(6|7)" && version_in_range(version:dllVer, test_version:"5.7.6002.23000", test_version2:"5.7.6002.23527")) ||
     (ieVer =~ "^8" && version_in_range(version:dllVer, test_version:"5.8.6001.19000", test_version2:"5.8.6001.19586")) ||
     (ieVer =~ "^8" && version_in_range(version:dllVer, test_version:"5.8.6001.23000", test_version2:"5.8.6001.23641"))){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  if(ieVer && ieVer =~ "^8")
  {
    if(version_in_range(version:dllVer, test_version:"5.8", test_version2:"5.8.7601.18647") ||
       version_in_range(version:dllVer, test_version:"5.8.7601.22000", test_version2:"5.8.7601.22855")){
      security_message( port: 0, data: "The target host was found to be vulnerable" );
      exit(0);
    }
  }
}
