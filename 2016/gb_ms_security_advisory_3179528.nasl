###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_security_advisory_3179528.nasl 12313 2018-11-12 08:53:51Z asteins $
#
# Microsoft Kernel Mode Blacklist Update Security Advisory (3179528)
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
  script_oid("1.3.6.1.4.1.25623.1.0.808655");
  script_version("$Revision: 12313 $");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-11-12 09:53:51 +0100 (Mon, 12 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-08-17 11:46:52 +0530 (Wed, 17 Aug 2016)");
  script_name("Microsoft Kernel Mode Blacklist Update Security Advisory (3179528)");

  script_tag(name:"summary", value:"This host is missing a security
  update according to Microsoft advisory (3179528).");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to Windows Secure Kernel Mode
  improperly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow a
  locally-authenticated attacker to read sensitive information on the target system.");

  script_tag(name:"affected", value:"Microsoft Windows 10 x32/x64
  Windows 10 Version 1511 x32/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory at the references.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3176493");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-in/kb/3176492");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/3179528");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-in/kb/3176492");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win10:1, win10x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

edgedllVer = fetch_file_version(sysPath:sysPath, file_name:"system32\edgehtml.dll");
if(!edgedllVer){
  exit(0);
}

if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  if(version_is_less(version:edgedllVer, test_version:"11.0.10240.17071"))
  {
    Vulnerable_range = "Less than 11.0.10240.17071";
    VULN = TRUE ;
  }

  else if(version_in_range(version:edgedllVer, test_version:"11.0.10586.0", test_version2:"11.0.10586.544"))
  {
    Vulnerable_range = "11.0.10586.0 - 11.0.10586.544";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\System32\Edgehtml.dll" + '\n' +
           'File version:     ' + edgedllVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
