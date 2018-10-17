###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4034664.nasl 7585 2017-10-26 15:03:01Z cfischer $
#
# Microsoft Windows Multiple Vulnerabilities (KB4034664)
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
  script_oid("1.3.6.1.4.1.25623.1.0.811600");
  script_version("$Revision: 7585 $");
  script_cve_id("CVE-2017-0174", "CVE-2017-0250", "CVE-2017-0293", "CVE-2017-8593", 
                "CVE-2017-8620", "CVE-2017-8624", "CVE-2017-8633", "CVE-2017-8636", 
                "CVE-2017-8641", "CVE-2017-8653", "CVE-2017-8666", "CVE-2017-8668", 
                "CVE-2017-8691");
  script_bugtraq_id(100038, 98100, 100039, 100032, 100034, 100061, 100069, 100056,
                    100057, 100059, 100089, 100092, 100090);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-10-26 17:03:01 +0200 (Thu, 26 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-08-09 08:59:58 +0530 (Wed, 09 Aug 2017)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4034664)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4034664");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,
  
  - The Win32k component fails to properly handle objects in memory. 

  - Windows Error Reporting (WER).

  - Improperly accessing objects in memory. 

  - Windows font library improperly handles specially crafted embedded fonts. 

  - The Microsoft JET Database Engine that could allow remote code execution on 
    an affected system.

  - Windows Search handles objects in memory.

  - The way that Microsoft browser JavaScript engines render content when 
    handling objects in memory. 

  - When the win32k component improperly provides kernel information. 

  - When the Volume Manager Extension Driver component improperly provides 
    kernel information.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker to
  run arbitrary code in kernel mode, gain access to sensitive information and system
  functionality, gain the same user rights as the current user and obtain information
  to further compromise the user's system.

  Impact Level: System");

  script_tag(name:"affected", value:"

  Windows Server 2008 R2 for x64-based Systems Service Pack 1

  Windows 7 for 32-bit/x64 Systems Service Pack 1");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4034664");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/4034664");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
fileVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(win2008r2:2, win7:2, win7x64:2) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

##Fetch the version of 'mssph.dll'
fileVer = fetch_file_version(sysPath, file_name:"mssph.dll");
if(!fileVer){
  exit(0);
}

## Check for mssph.dll version
if(version_is_less(version:fileVer, test_version:"7.0.7601.23877"))
{
  report = 'File checked:     ' + sysPath + "\mssph.dll" + '\n' +
           'File version:     ' + fileVer  + '\n' +
           'Vulnerable range:  Less than 7.0.7601.23877\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
