###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011636.nasl 10918 2018-08-10 17:32:46Z cfischer $
#
# Microsoft Office Defense in Depth Update And Remote Code Execution Vulnerability (KB4011636)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.812712");
  script_version("$Revision: 10918 $");
  script_cve_id("CVE-2018-0795");
  script_bugtraq_id(102356);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 19:32:46 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-01-10 13:00:32 +0530 (Wed, 10 Jan 2018)");
  script_name("Microsoft Office Defense in Depth Update And Remote Code Execution Vulnerability (KB4011636)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011636");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - A missing update for Microsoft Office that provides enhanced security as a
    defense-in-depth measure.

  - Microsoft Office software fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to run arbitrary code in the context of the current user and also to bypass
  security.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Office 2013 Service Pack 1");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4011636");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4011636");
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

path = "";
dllVer = "";
offPath = "";
offVer = "";

offVer = get_kb_item("MS/Office/Ver");
if(!offVer || !(offVer =~ "^15\.")){
  exit(0);
}

path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                           item:"ProgramFilesDir");
if(!path){
  exit(0);
}

offPath = path + "\Microsoft Office\OFFICE15\DCF";

dllVer = fetch_file_version(sysPath:offPath, file_name:"Office.dll");
if(!dllVer){
  exit(0);
}

if(dllVer=~ "^15\.0" && version_is_less(version:dllVer, test_version:"15.0.4997.1000"))
{
  report = report_fixed_ver(file_checked:offPath + "\Office.dll",
           file_version:dllVer, vulnerable_range:"15.0 - 15.0.4997.999");
  security_message(data:report);
  exit(0);
}
exit(0);
