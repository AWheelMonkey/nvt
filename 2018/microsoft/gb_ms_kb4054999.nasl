###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4054999.nasl 10918 2018-08-10 17:32:46Z cfischer $
#
# Microsoft .NET Framework DoS And Security Feature Bypass Vulnerability (KB4054999)
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
  script_oid("1.3.6.1.4.1.25623.1.0.812725");
  script_version("$Revision: 10918 $");
  script_cve_id("CVE-2018-0764", "CVE-2018-0786");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 19:32:46 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-01-10 10:03:51 +0530 (Wed, 10 Jan 2018)");
  script_name("Microsoft .NET Framework DoS And Security Feature Bypass Vulnerability (KB4054999)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Security Updates KB4054999.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - .NET Framework (and .NET Core) components do not completely validate
    certificates.

  - .NET, and .NET core, improperly process XML documents.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause a denial of service against a .NET application and also
  to bypass cetain security restrictions.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft .NET Framework 3.5");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4054999.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4054999");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

key = "";
item = "";
path = "";
dllVer = "";

if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) <= 0){
  exit(0);
}

key = "SOFTWARE\Microsoft\ASP.NET\";
if(!registry_key_exists(key:key)){
  exit(0);
}

key = "SOFTWARE\Microsoft\.NETFramework\AssemblyFolders\v3.0";
if(!registry_key_exists(key:key)){
  exit(0);
}

path = registry_get_sz(key:key , item:"All Assemblies In");
if(path){
  dllVer = fetch_file_version(sysPath:path, file_name:"system.servicemodel.resources.dll");
}

if(dllVer)
{
  if(version_in_range(version:dllVer, test_version:"3.0", test_version2:"3.0.4506.7902"))
  {
    report = report_fixed_ver(file_checked:path + "system.servicemodel.resources.dll", file_version:dllVer,
                              vulnerable_range:"3.0 - 3.0.4506.7902");
    security_message(data:report);
    exit(0);
  }
}
exit(0);
