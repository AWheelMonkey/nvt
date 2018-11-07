###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011703.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# Microsoft Office Word Viewer Remote Code Execution Vulnerability (KB4011703)
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
  script_oid("1.3.6.1.4.1.25623.1.0.812916");
  script_version("$Revision: 12120 $");
  script_cve_id("CVE-2018-0851");
  script_bugtraq_id(102870);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-02-14 13:30:47 +0530 (Wed, 14 Feb 2018)");
  script_name("Microsoft Office Word Viewer Remote Code Execution Vulnerability (KB4011703)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011703");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error in Microsoft
  Office software when the Office software fails to properly handle objects in
  memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  who successfully exploited the vulnerability to run arbitrary code in the context
  of the current user.");

  script_tag(name:"affected", value:"Microsoft Office Word Viewer");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4011703");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/WordView/Version");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

wordviewVer = "";
offPath = "";
dllVer = "";
exeVer = "";

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
  propath = registry_get_sz(key:key, item:"CommonFilesDir");
  if(propath)
  {

    offPath = propath + "\Microsoft Shared\OFFICE11";
    exeVer = fetch_file_version(sysPath:offPath, file_name:"Mso.dll");
    if(exeVer && exeVer =~ "^(11\.)")
    {
      if(version_is_less(version:exeVer, test_version:"11.0.8447.0"))
      {
        report = report_fixed_ver(file_checked:offPath + "\Mso.dll",
                                  file_version:exeVer, vulnerable_range:"11.0 - 11.0.8446");
        security_message(data:report);
        exit(0);
      }
    }
  }
}
exit(0);
