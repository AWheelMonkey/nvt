###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-040.nasl 11876 2018-10-12 12:20:01Z cfischer $
#
# MS Active Directory Federation Services Information Disclosure Vulnerability (3045711)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.805164");
  script_version("$Revision: 11876 $");
  script_cve_id("CVE-2015-1638");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:20:01 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-04-15 12:47:54 +0530 (Wed, 15 Apr 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("MS Active Directory Federation Services Information Disclosure Vulnerability (3045711)");

  script_tag(name:"summary", value:"This host is missing a important security
  update according to Microsoft Bulletin MS15-040.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Flaw is due to the Active Directory
  Federation Services (AD FS) fails to properly log off a user.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to gain access to users sensitive information.");

  script_tag(name:"affected", value:"Active Directory Federation Services
  3.0 on Windows Server 2012 R2");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  link, https://technet.microsoft.com/library/security/MS15-040");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3045711");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS15-040");

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

if(hotfix_check_sp(win2012R2:1) <= 0){
  exit(0);
}

adfs = registry_key_exists(key:"SOFTWARE\Microsoft\ADFS");
if(!adfs){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

adfs_ver = fetch_file_version(sysPath:sysPath, file_name:"\ADFS\Microsoft.identityserver.dll");
if(adfs_ver)
{
  if(version_is_less(version:adfs_ver, test_version:"6.3.9600.17720"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

exit(99);