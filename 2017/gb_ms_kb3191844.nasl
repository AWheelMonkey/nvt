###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb3191844.nasl 11816 2018-10-10 10:42:56Z mmartin $
#
# Microsoft Office Multiple Vulnerabilities (KB3191844)
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
  script_oid("1.3.6.1.4.1.25623.1.0.811093");
  script_version("$Revision: 11816 $");
  script_cve_id("CVE-2017-8527", "CVE-2017-8531", "CVE-2017-0283", "CVE-2017-8532",
                "CVE-2017-8533", "CVE-2017-0287", "CVE-2017-0288", "CVE-2017-0289",
                "CVE-2017-0286");
  script_bugtraq_id(98933, 98819, 98920, 98820, 98821, 98922, 98923, 98929, 98891);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-10 12:42:56 +0200 (Wed, 10 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-14 11:38:00 +0530 (Wed, 14 Jun 2017)");
  script_name("Microsoft Office Multiple Vulnerabilities (KB3191844)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB3191844");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,

  - An error in the way Windows Uniscribe handles objects in memory.

  - Multiple errors in the Windows GDI component which improperly discloses the
    contents of its memory.

  - An error in the Windows font library which improperly handles specially crafted
    embedded fonts.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to gain access to potentially sensitive information and execute
  arbitrary code in the context of current user.");

  script_tag(name:"affected", value:"Microsoft Office 2010 Service Pack 2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3191844");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("MS/Office/Ver");
  script_require_ports(139, 445);
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3191844");
  exit(0);
}



include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

offVer = get_kb_item("MS/Office/Ver");
if(!offVer || !(offVer =~ "^14\.")){
  exit(0);
}

## Common Files Directory
msPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                            item:"CommonFilesDir");
if(msPath)
{
  msPath =  msPath +  "\Microsoft Office\OFFICE14";
  msdllVer = fetch_file_version(sysPath:msPath, file_name:"Usp10.dll");
  if(!msdllVer){
    exit(0);
  }

  if(version_is_less(version:msdllVer, test_version:"1.0626.7601.23800"))
  {
    report = 'File checked:     ' + msPath + "\Usp10.dll" + '\n' +
             'File version:     ' + msdllVer  + '\n' +
             'Vulnerable range: ' + "Less than 1.0626.7601.23800" + '\n' ;
    security_message(data:report);
    exit(0);
  }
}
