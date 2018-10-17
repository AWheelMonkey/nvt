###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011095.nasl 10967 2018-08-15 05:53:29Z cfischer $
#
# Microsoft Office 2016 Information Disclosure Vulnerability (KB4011095)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.812248");
  script_version("$Revision: 10967 $");
  script_cve_id("CVE-2017-11934");
  script_bugtraq_id(102064);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-15 07:53:29 +0200 (Wed, 15 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-12-13 11:05:10 +0530 (Wed, 13 Dec 2017)");
  script_name("Microsoft Office 2016 Information Disclosure Vulnerability (KB4011095)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011095");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists when Microsoft Office
  improperly discloses the contents of its memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to gain access to potentially sensitive information and use the information to
  compromise the user's computer or data.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Office 2016");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4011095");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4011095");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("MS/Office/Ver", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

msPath = "";
msdllVer = "";
offPath = "";


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
    msPath = registry_get_sz(key:key, item:"ProgramFilesDir");
    if(msPath)
    {
      offPath = msPath + "\Microsoft Office\" + "root\Office16";
      exeVer = fetch_file_version(sysPath:offPath, file_name:"chart.dll");

      if(exeVer && exeVer =~ "^16")
      {
        if(version_in_range(version:exeVer, test_version:"16.0", test_version2:"16.0.4627.999"))
        {
          report = report_fixed_ver( file_checked:msPath + "\Microsoft Office\Root\Office16\chart.dll",
                                     file_version:exeVer, vulnerable_range:"16.0 - 16.0.4627.999" );
          security_message(data:report);
          exit(0);
        }
      }
    }
  }
}
exit(0);
