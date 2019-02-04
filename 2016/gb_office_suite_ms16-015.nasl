###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_office_suite_ms16-015.nasl 12465 2018-11-21 13:24:34Z cfischer $
#
# Microsoft Office Suite Remote Code Execution Vulnerabilities (3134226)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.807302");
  script_version("$Revision: 12465 $");
  script_cve_id("CVE-2016-0022", "CVE-2016-0052", "CVE-2016-0053", "CVE-2016-0054",
                "CVE-2016-0055", "CVE-2016-0056");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-21 14:24:34 +0100 (Wed, 21 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-02-10 10:23:22 +0530 (Wed, 10 Feb 2016)");
  script_name("Microsoft Office Suite Remote Code Execution Vulnerabilities (3134226)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_ms_office_detection_900025.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/Office/Ver");

  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms16-015");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3134226");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3114752");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3114742");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-015");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-015.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist when,

  - The Office software improperly handles objects in memory while parsing
    specially crafted Office files.

  - The Office software fails to properly handle rich text format files in
    memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to run arbitrary code in the context of the current user and
  to perform actions in the security context of the current user.");

  script_tag(name:"affected", value:"Microsoft Office 2007 Service Pack 3 and prior

  Microsoft Office 2010 Service Pack 2 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");

  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

offVer = get_kb_item("MS/Office/Ver");
if(!offVer){
  exit(0);
}

## MS Office 2007,2010, 2015
if(offVer =~ "^1[245].*")
{
  InsPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion", item:"CommonFilesDir");
  if(InsPath)
  {
    offPath = InsPath + "\Microsoft Shared\Office12";

    exeVer = fetch_file_version(sysPath:offPath, file_name:"Mso.dll");
    if(exeVer)
    {
      if(exeVer =~ "^12")
      {
        ## For office 2010 Wwlibcxm.dll is mentioned and it is not available so ignoring
        if(version_in_range(version:exeVer, test_version:"12.0", test_version2:"12.0.6743.4999"))
        {
          report = 'File checked:     ' + offPath + "\mso.dll" + '\n' +
                   'File version:     ' + exeVer  + '\n' +
                   'Vulnerable range: 12.0 - 12.0.6743.4999 \n' ;
          security_message(data:report);
          exit(0);
        }
      }
    }
  }
}
