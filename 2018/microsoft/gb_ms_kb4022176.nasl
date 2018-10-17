###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4022176.nasl 10671 2018-07-30 06:31:58Z cfischer $
#
# Microsoft Office 2016 Defense in Depth Update (KB4022176)
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
  script_oid("1.3.6.1.4.1.25623.1.0.813720");
  script_version("$Revision: 10671 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-07-30 08:31:58 +0200 (Mon, 30 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-20 16:25:35 +0530 (Fri, 20 Jul 2018)");
  script_name("Microsoft Office 2016 Defense in Depth Update (KB4022176)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4022176");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Microsoft has released an update for Microsoft
  Office that provides enhanced security as a defense-in-depth measure.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to compromise on availability, confidentiality and integrity of the system.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Office 2016");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-gb/help/4022176");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("MS/Office/Ver");
  script_require_ports(139, 445);
  exit(0);
}

include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

offVer = get_kb_item("MS/Office/Ver");
if(!offVer || !(offVer =~ "^16\.")){
  exit(0);
}

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
  commonpath = registry_get_sz(key:key, item:"CommonFilesDir");

  if(!commonpath){
    continue;
  }

  offPath = commonpath + "\Microsoft Shared\Source Engine" ;
  msdllVer = fetch_file_version(sysPath:offPath, file_name:"ose.exe");
  if(!msdllVer){
    continue;
  }

  if(version_in_range(version:msdllVer, test_version:"16.0", test_version2:"16.0.4717.999"))
  {
    report = report_fixed_ver(file_checked:offPath + "\ose.exe",
                              file_version:msdllVer, vulnerable_range:"16.0 - 16.0.4717.999");
    security_message(data:report);
    exit(0);
  }
}
exit(0);
