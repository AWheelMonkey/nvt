###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011622.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# Microsoft Office 2016 Defense in Depth Update (KB4011622)
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
  script_oid("1.3.6.1.4.1.25623.1.0.812610");
  script_version("$Revision: 12120 $");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-01-10 09:38:17 +0530 (Wed, 10 Jan 2018)");
  script_name("Microsoft Office 2016 Defense in Depth Update (KB4011622)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011622");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Microsoft has released an update for Microsoft
  Office that provides enhanced security as a defense-in-depth measure.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers to
  affect on integrity, availability and confidentiality of the system.");

  script_tag(name:"affected", value:"Microsoft Office 2016");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4011622/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

if(get_kb_item("MS/Office/Ver") =~ "^16.*")
{
  os_arch = get_kb_item("SMB/Windows/Arch");
  if("x86" >< os_arch){
    key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion");
  }
  else if("x64" >< os_arch){
    key_list =  make_list("SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion",
                          "SOFTWARE\Microsoft\Windows\CurrentVersion");
  }

  foreach key(key_list)
  {
    propath = registry_get_sz(key:key, item:"ProgramFilesDir");
    if(propath)
    {
      offPath = propath + "\Microsoft Office\root\VFS\ProgramFilesCommonX86\Microsoft Shared\Office16";
      offexeVer = fetch_file_version(sysPath:offPath, file_name:"mso99lres.dll");

      if(offexeVer && version_in_range(version:offexeVer, test_version:"16.0", test_version2:"16.0.4519.0999"))
      {
        report = report_fixed_ver(file_checked:offPath + "\mso99lres.dll",
                 file_version:offexeVer, vulnerable_range:"16.0 - 16.0.4519.0999");
        security_message(data:report);
        exit(0);
      }
    }
  }
}
exit(0);
