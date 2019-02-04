###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4461614.nasl 13072 2019-01-15 08:12:06Z asteins $
#
# Microsoft Office 2010 Service Pack 2 Information Disclosure Vulnerability (KB4461614)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2019 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.814590");
  script_version("$Revision: 13072 $");
  script_cve_id("CVE-2019-0560");
  script_bugtraq_id(106398);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-01-15 09:12:06 +0100 (Tue, 15 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-09 14:46:55 +0530 (Wed, 09 Jan 2019)");
  script_name("Microsoft Office 2010 Service Pack 2 Information Disclosure Vulnerability (KB4461614)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4461614");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists when Microsoft Office
  improperly discloses the contents of its memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to use the information to compromise the user's computer or data.");

  script_tag(name:"affected", value:"Microsoft Office 2010 Service Pack 2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4461614");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
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
if(!offVer || offVer !~ "^14\."){
  exit(0);
}

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

  offPath = commonpath + "\Microsoft Shared\Office14";

  offexeVer = fetch_file_version(sysPath:offPath, file_name:"Mso.dll");

  if(offexeVer && version_in_range(version:offexeVer, test_version:"14.0", test_version2:"14.0.7227.4999"))
  {
    report = report_fixed_ver(file_checked:offPath + "\Mso.dll",
                              file_version:offexeVer, vulnerable_range:"14.0 - 14.0.7227.4999");
    security_message(data:report);
    exit(0);
  }
}
exit(99);
