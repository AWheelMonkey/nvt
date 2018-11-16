###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_office_suite_ms16-029.nasl 12338 2018-11-13 14:51:17Z asteins $
#
# Microsoft Office Security Feature Bypass Vulnerabilities (3141806)
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
  script_oid("1.3.6.1.4.1.25623.1.0.807602");
  script_version("$Revision: 12338 $");
  script_cve_id("CVE-2016-0057", "CVE-2016-0021", "CVE-2016-0134");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-13 15:51:17 +0100 (Tue, 13 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-03-09 15:29:29 +0530 (Wed, 09 Mar 2016)");
  script_name("Microsoft Office Security Feature Bypass Vulnerabilities (3141806)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-029.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaws due to,

  - An invalidly signed binary,

  - The Office software fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to reliably predict the memory offsets of specific instructions
  which may allow arbitrary code execution.");

  script_tag(name:"affected", value:"Microsoft Office 2007 Service Pack 3 and prior. ");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL" , value:"https://support.microsoft.com/kb/2956063");
  script_xref(name:"URL" , value:"https://support.microsoft.com/kb/3039746");
  script_xref(name:"URL" , value:"https://support.microsoft.com/kb/2956110");
  script_xref(name:"URL" , value:"https://support.microsoft.com/kb/3114873");
  script_xref(name:"URL" , value:"https://technet.microsoft.com/library/security/ms16-029");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/Office/Ver");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms16-029");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

path = "";
dllVer = "";
offPath = "";

## MS Office 2007/2010/2013
if(!get_kb_item("MS/Office/Ver") =~ "^[12|14|15].*"){
  exit(0);
}

path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                           item:"ProgramFilesDir");
if(path)
{
  {
    offPath = path + "\Microsoft Office\OFFICE12\ADDINS";
    dllVer = fetch_file_version(sysPath:offPath, file_name:"Msvcr71.dll");
    if(dllVer &&
       (version_in_range(version:dllVer, test_version:"7.0", test_version2:"7.10.3077.0")))
    {
      report = 'File checked:     ' + offPath + "\Msvcr71.dll" + '\n' +
               'File version:     ' + dllVer  + '\n' +
               'Vulnerable range:  7.0 - 7.10.3077.0'  + '\n' ;
      security_message(data:report);
      exit(0);
    }
  }
}
