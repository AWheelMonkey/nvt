###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_powerpoint_ms16-107.nasl 11702 2018-10-01 07:31:38Z asteins $
#
# Microsoft Office PowerPoint Remote Code Execution Vulnerability (3185852)
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
  script_oid("1.3.6.1.4.1.25623.1.0.807359");
  script_version("$Revision: 11702 $");
  script_cve_id("CVE-2016-3360");
  script_bugtraq_id(92796);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-01 09:31:38 +0200 (Mon, 01 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-09-14 11:08:57 +0530 (Wed, 14 Sep 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office PowerPoint Remote Code Execution Vulnerability (3185852)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-107.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists as Office software fails to
  properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary code in the context of the currently logged-in
  user. Failed exploit attempts will likely result in denial of service
  conditions.");

  script_tag(name:"affected", value:"Microsoft PowerPoint 2010 Service Pack 2 and prior,
  Microsoft PowerPoint 2007 Service Pack 3 and prior,
  Microsoft PowerPoint 2013 Service Pack 1 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  below link,
  https://technet.microsoft.com/library/security/MS16-107");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3115487");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3114744");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3115467");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-107");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/Office/Ver", "SMB/Office/PowerPnt/Version");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

pptVer = get_kb_item("SMB/Office/PowerPnt/Version");
if(!pptVer){
  exit(0);
}

# Office Power Point for 2010/2013
path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                          item:"ProgramFilesDir");
if(!path){
  exit(0);
}

foreach ver (make_list("OFFICE12", "OFFICE14", "OFFICE15"))
{
  offPath = path + "\Microsoft Office\" + ver ;

  exeVer  = fetch_file_version(sysPath:offPath, file_name:"ppcore.dll");
  if(exeVer && exeVer =~ "^(12|14|15).*")
  {
    if(exeVer =~ "^14"){
      Vulnerable_range  =  "14 - 14.0.7173.4999";
    }
    else if(exeVer =~ "^15"){
      Vulnerable_range  =  "15 - 15.0.4859.0999";
    }
    else if(exeVer =~ "^12"){
      Vulnerable_range  =  "12 - 12.0.6755.4999";
    }

    if(version_in_range(version:exeVer, test_version:"12.0", test_version2:"12.0.6755.4999") ||
       version_in_range(version:exeVer, test_version:"14.0", test_version2:"14.0.7173.4999") ||
       version_in_range(version:exeVer, test_version:"15.0", test_version2:"15.0.4859.0999"))
    {
       report = 'File checked:    ' + offPath + "\ppcore.dll"  + '\n' +
                'File version:     ' + exeVer  + '\n' +
                'Vulnerable range: ' + Vulnerable_range + '\n' ;
       security_message(data:report);
       exit(0);
    }
  }
}
