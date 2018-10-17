###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_excel_viewer_kb4092444.nasl 11822 2018-10-10 13:34:32Z santu $
#
# Microsoft Excel Viewer 2007 Multiple Vulnerabilities (KB4092444)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.814254");
  script_version("$Revision: 11822 $");
  script_cve_id("CVE-2018-8427", "CVE-2018-8432");
  script_bugtraq_id(105453, 105458);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-10 15:34:32 +0200 (Wed, 10 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-10 08:59:02 +0530 (Wed, 10 Oct 2018)");
  script_name("Microsoft Excel Viewer 2007 Multiple Vulnerabilities (KB4092444)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4092444");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaw exists due to an error in the
  way that Microsoft Graphics Components handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  who successfully exploited the vulnerability to execute arbitrary code and obtain
  information that could be useful for further exploitation.");

  script_tag(name:"affected", value:"Microsoft Excel Viewer 2007");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4092444");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/XLView/Version");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

excelviewVer = get_kb_item("SMB/Office/XLView/Version");
if(!excelviewVer){
  exit(0);
}

if(excelviewVer =~ "^12")
{
  if(!os_arch = get_kb_item("SMB/Windows/Arch")){
    exit(0);
  }

  if("x86" >< os_arch){
    key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion");
  }
    else if("x64" >< os_arch){
    key_list =  make_list("SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion",
                          "SOFTWARE\Microsoft\Windows\CurrentVersion");
  }

  foreach key(key_list)
  {
    commonpath = registry_get_sz(key:key, item:"CommonFilesDir");
    if(!commonpath){
      continue;
    }

    offPath = commonpath + "\Microsoft Shared\OFFICE12" ;
    msdllVer = fetch_file_version(sysPath:offPath, file_name:"Ogl.dll");
    if(msdllVer =~ "^(12\.)" && version_is_less(version:msdllVer, test_version:"12.0.6803.5000"))
    {
      report = report_fixed_ver(file_checked:offPath + "\Ogl.dll",
                                file_version:msdllVer, vulnerable_range:"12.0 - 12.0.6803.4999");
      security_message(data:report);
      exit(0);
    }
  }
}
exit(99);
