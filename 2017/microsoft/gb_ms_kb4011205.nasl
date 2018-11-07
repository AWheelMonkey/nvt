###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011205.nasl 11983 2018-10-19 10:04:45Z mmartin $
#
# Microsoft Office Compatibility Pack Service Pack 3 Multiple Vulnerabilities (KB4011205)
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
  script_oid("1.3.6.1.4.1.25623.1.0.812084");
  script_version("$Revision: 11983 $");
  script_cve_id("CVE-2017-11877", "CVE-2017-11878");
  script_bugtraq_id(101747, 101756);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 12:04:45 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-11-15 07:07:43 +0530 (Wed, 15 Nov 2017)");
  script_name("Microsoft Office Compatibility Pack Service Pack 3 Multiple Vulnerabilities (KB4011205)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011205");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - An error in Microsoft Office software which do not enforce macro settings
    on an Excel document.

  - An error in Microsoft Office software when the software fails to properly
    handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  who successfully exploited the vulnerability to bypass certain security feature
  and run arbitrary code in the context of the current user.");

  script_tag(name:"affected", value:"Microsoft Office Compatibility Pack Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4011205");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/ComptPack/Version");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

xlcnvVer = "";
wordcnvVer = "";
path = "";
sysVer = "";

path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                              item:"ProgramFilesDir");
if(!path){
  exit(0);
}

if(get_kb_item("SMB/Office/ComptPack/Version") =~ "^12\..*")
{
  xlcnvVer = get_kb_item("SMB/Office/XLCnv/Version");

  if(xlcnvVer && xlcnvVer =~ "^12.*")
  {
    offpath = path + "\Microsoft Office\Office12";
    sysVer = fetch_file_version(sysPath:offpath, file_name:"excelcnv.exe");
    if(sysVer)
    {
      if(version_in_range(version:sysVer, test_version:"12.0", test_version2:"12.0.6780.4999"))
      {
        report = report_fixed_ver( file_checked:offpath + "\excelcnv.exe",
                                   file_version:sysVer, vulnerable_range:"12.0 - 12.0.6780.4999" );
        security_message(data:report);
        exit(0);
      }
    }
  }
}
exit(0);
