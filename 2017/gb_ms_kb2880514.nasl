###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb2880514.nasl 12467 2018-11-21 14:04:59Z cfischer $
#
# Microsoft Office 2007 Service Pack 3 Remote Code Execution Vulnerability (KB2880514)
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
  script_oid("1.3.6.1.4.1.25623.1.0.811222");
  script_version("$Revision: 12467 $");
  script_cve_id("CVE-2017-0243");
  script_bugtraq_id(99446);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-21 15:04:59 +0100 (Wed, 21 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-07-13 12:18:16 +0530 (Thu, 13 Jul 2017)");
  script_name("Microsoft Office 2007 Service Pack 3 Remote Code Execution Vulnerability (KB2880514)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("MS/Office/Ver");
  script_require_ports(139, 445);

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/2880514");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB2880514");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error in Microsoft
  Office software when it fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow the attacker
  to perform actions in the security context of the current user.");

  script_tag(name:"affected", value:"Microsoft Office 2007 Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");

  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

officeVer = get_kb_item("MS/Office/Ver");
if(!officeVer){
  exit(0);
}

path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion", item:"ProgramFilesDir");
if(!path){
  exit(0);
}

# nb: Office 2007
if(officeVer =~ "^12\.")
{
  offpath = path + "\Microsoft Office\Office12\PROOF";
  offexeVer = fetch_file_version(sysPath:offpath, file_name:"mssp3gl.dll");
  if(!offexeVer)
  {
    commonpath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                                 item:"CommonFilesDir");
    if(!commonpath){
      exit(0);
    }
    offPath = commonpath + "\Microsoft Shared\PROOF";

    offexeVer = fetch_file_version(sysPath:offpath, file_name:"mssp3gl.dll");
  }

  if(offexeVer && version_is_less(version:offexeVer, test_version:"15.0.4569.1503"))
  {
    report = 'File checked:     ' + offpath + "\mssp3gl.dll" + '\n' +
             'File version:     ' + offexeVer  + '\n' +
             'Vulnerable range: ' + "Less than 15.0.4569.1503" + '\n' ;
    security_message(data:report);
    exit(0);
  }
}

exit(0);
