###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb3191828.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# Microsoft Office Multiple Vulnerabilities (KB3191828)
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
  script_oid("1.3.6.1.4.1.25623.1.0.811091");
  script_version("$Revision: 11863 $");
  script_cve_id("CVE-2017-8528", "CVE-2017-0282", "CVE-2017-0284", "CVE-2017-0285",
                "CVE-2017-8534");
  script_bugtraq_id(98949, 98885, 98918, 98914, 98822);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-14 10:19:06 +0530 (Wed, 14 Jun 2017)");
  script_name("Microsoft Office Multiple Vulnerabilities (KB3191828)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB3191828");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,

  - Multiple errors in Windows Uniscribe which improperly discloses the contents
    of its memory.

  - An error due to the way Windows Uniscribe handles objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to obtain sensitive information and take complete control of the
  affected system. An attacker could then install programs; view, change, or
  delete data; or create new accounts with full user rights. Also.");

  script_tag(name:"affected", value:"Microsoft Office 2007 Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3191828");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("MS/Office/Ver");
  script_require_ports(139, 445);
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## MS Office 2007
OfficeVer = get_kb_item("MS/Office/Ver");
if(!OfficeVer  || OfficeVer !~ "^(12\.)"){
  exit(0);
}

msPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                            item:"CommonFilesDir");
if(msPath)
{
  offPath = msPath + "\Microsoft Shared\OFFICE12" ;
  msdllVer = fetch_file_version(sysPath:offPath, file_name:"Ogl.dll");
  if(!msdllVer){
    exit(0);
  }

  if(msdllVer =~ "^(12\.)" && version_is_less(version:msdllVer, test_version:"12.0.6769.5000"))
  {
    report = 'File checked:     ' + offPath + "\Ogl.dll" + '\n' +
             'File version:     ' + msdllVer  + '\n' +
             'Vulnerable range: ' + "12.0 - 12.0.6769.4999" + '\n' ;
    security_message(data:report);
    exit(0);
  }
}
