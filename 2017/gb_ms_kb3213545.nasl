###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb3213545.nasl 11835 2018-10-11 08:38:49Z mmartin $
#
# Microsoft Office 2016 Remote Code Execution Vulnerability (KB3213545)
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
  script_oid("1.3.6.1.4.1.25623.1.0.811231");
  script_version("$Revision: 11835 $");
  script_cve_id("CVE-2017-8570");
  script_bugtraq_id(99445);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 10:38:49 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-07-12 12:14:16 +0530 (Wed, 12 Jul 2017)");
  script_name("Microsoft Office 2016 Remote Code Execution Vulnerability (KB3213545)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB3213545");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error in Microsoft
  Office software when it fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to use a specially crafted file to perform actions in the security context of
  the current user.");

  script_tag(name:"affected", value:"Microsoft Office 2016");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3213545");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("MS/Office/Ver");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## MS Office
officeVer = get_kb_item("MS/Office/Ver");
if(!officeVer){
  exit(0);
}

path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                       item:"ProgramFilesDir");
if(!path){
  exit(0);
}

##For x86 based installation
##To Do, Check path for 64bit installation and update path here
offPath = path + "\Microsoft Office\root\VFS\ProgramFilesCommonX86\Microsoft Shared\Office16";

if(officeVer =~ "^16\.*")
{
  offdllVer = fetch_file_version(sysPath:offPath, file_name:"mso30win32client.dll");
  if(!offdllVer){
    exit(0);
  }

  if(offdllVer =~ "^16\.0" && version_is_less(version:offdllVer, test_version:"16.0.4561.1002"))
  {
    report = 'File checked:     ' + offPath + "\mso30win32client.dll" + '\n' +
             'File version:     ' + offdllVer  + '\n' +
             'Vulnerable range: ' + "16.0 - 16.0.4561.1001" + '\n' ;
    security_message(data:report);
    exit(0);
  }
}
exit(0);
