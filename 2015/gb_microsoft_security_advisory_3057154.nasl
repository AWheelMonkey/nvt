###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_microsoft_security_advisory_3057154.nasl 11876 2018-10-12 12:20:01Z cfischer $
#
# Microsoft DES Encryption Security Advisory (3057154)
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
  script_oid("1.3.6.1.4.1.25623.1.0.805678");
  script_version("$Revision: 11876 $");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:20:01 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-07-22 12:14:41 +0530 (Wed, 22 Jul 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft DES Encryption Security Advisory (3057154)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft advisory (3057154).");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"An update is available that provides
  enhanced user protection in environments where DES is still enabled for
  application compatibility reasons.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  attackers to break certain authentication scenarios.");

  script_tag(name:"affected", value:"Microsoft Windows 8 x32/x64

  Microsoft Windows Server 2012

  Microsoft Windows Vista x32/x64 Edition Service Pack 2 and prior

  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior

  Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior

  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and install the hotfixes from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3057154");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/3057154");

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

if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2,
                   win8:1, win8x64:1, win2012:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath){
  exit(0);
}

dllVer = fetch_file_version(sysPath:sysPath, file_name:"system32\Kerberos.dll");
if(!dllVer){
  exit(0);
}

## Currently not supporting for Vista and Windows Server 2008 64 bit
if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.0.6002.19428") ||
     version_in_range(version:dllVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23733")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.1.7601.18912") ||
     version_in_range(version:dllVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.23114")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

## Win 8 and 2012
if(hotfix_check_sp(win8:1, win8x64:1, win2012:1) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.2.9200.17415") ||
     version_in_range(version:dllVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21524")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

