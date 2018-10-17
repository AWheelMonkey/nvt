###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011628.nasl 10918 2018-08-10 17:32:46Z cfischer $
#
# Microsoft Office 2016 Information Disclosure Vulnerability (KB4011628)
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
  script_oid("1.3.6.1.4.1.25623.1.0.813123");
  script_version("$Revision: 10918 $");
  script_cve_id("CVE-2018-1007");
  script_bugtraq_id(103640);
  script_tag(name:"cvss_base", value:"2.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 19:32:46 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-04-11 09:07:39 +0530 (Wed, 11 Apr 2018)");
  script_name("Microsoft Office 2016 Information Disclosure Vulnerability (KB4011628)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011628");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists as Microsoft Office improperly
  discloses the contents of its memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to gain access to potentially sensitive information and use the information to
  compromise the user's computer or data.

  Impact Level: Application");

  script_tag(name:"affected", value:"Microsoft Office 2016");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory.
  For details refer to reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4011628");
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

officeVer = get_kb_item("MS/Office/Ver");
if(!officeVer || !(officeVer =~ "^(16\.)")){
  exit(0);
}

os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(0);
}

if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot");
}
else if("x64" >< os_arch){
  key_list =  make_list("SOFTWARE\Wow6432Node\Microsoft\Office\16.0\Access\InstallRoot",
                        "SOFTWARE\Microsoft\Office\16.0\Access\InstallRoot");
}

foreach key (key_list)
{
  comPath = registry_get_sz(key:key, item:"Path");
  if(comPath)
  {
    ortVer = fetch_file_version(sysPath:comPath, file_name:"Oart.dll");
    if(ortVer && ortVer =~ "^16\.")
    {
      if(version_is_less(version:ortVer, test_version:"16.0.4672.1000"))
      {
        report = report_fixed_ver( file_checked:comPath + "Oart.dll",
                                   file_version:ortVer, vulnerable_range:"16.0 - 16.0.4672.0999");
        security_message(data:report);
        exit(0);
      }
    }
  }
}
exit(0);
