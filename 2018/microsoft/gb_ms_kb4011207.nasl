###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011207.nasl 12963 2019-01-08 07:50:52Z ckuersteiner $
#
# Microsoft Office Compatibility Pack Service Pack 3 Remote Code Execution Vulnerability (KB4011207)
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
  script_oid("1.3.6.1.4.1.25623.1.0.814709");
  script_version("$Revision: 12963 $");
  script_cve_id("CVE-2018-8628");
  script_bugtraq_id(106104);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2019-01-08 08:50:52 +0100 (Tue, 08 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-12-12 13:17:54 +0530 (Wed, 12 Dec 2018)");
  script_name("Microsoft Office Compatibility Pack Service Pack 3 Remote Code Execution Vulnerability (KB4011207)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011207");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error in Microsoft
  PowerPoint software when the software fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  who successfully exploited the vulnerability to run arbitrary code in the context
  of the current user.");

  script_tag(name:"affected", value:"Microsoft Office Compatibility Pack Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4011207");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

cmpVer = get_kb_item("SMB/Office/ComptPack/Version");
if(!cmpVer|| cmpVer !~ "^12\." ) exit( 0 );

os_arch = get_kb_item("SMB/Windows/Arch");
if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion");
} else if("x64" >< os_arch){
  key_list =  make_list("SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion", "SOFTWARE\Microsoft\Windows\CurrentVersion");
}

foreach key(key_list){

  msPath = registry_get_sz(key:key, item:"ProgramFilesDir");
  if(msPath) {
    xlcnvVer = get_kb_item("SMB/Office/XLCnv/Version");

    if(xlcnvVer && xlcnvVer =~ "^12.*"){
      offpath = msPath + "\Microsoft Office\Office12";
      sysVer = fetch_file_version(sysPath:offpath, file_name:"Ppcnv.dll");
      if(sysVer && version_in_range(version:sysVer, test_version:"12.0", test_version2:"12.0.6805.4999")) {
        report = report_fixed_ver(file_checked:offpath + "\Ppcnv.dll",
                                  file_version:sysVer, vulnerable_range:"12.0 - 12.0.6805.4999");
        security_message(data:report);
        exit(0);
      }
    }
  }
}
