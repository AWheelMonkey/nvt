###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4095875.nasl 10918 2018-08-10 17:32:46Z cfischer $
#
# Microsoft .NET Framework Security Feature Bypass And DoS Vulnerabilities (KB4095875)
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
  script_oid("1.3.6.1.4.1.25623.1.0.812881");
  script_version("$Revision: 10918 $");
  script_cve_id("CVE-2018-0765", "CVE-2018-1039");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 19:32:46 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-05-09 14:53:54 +0530 (Wed, 09 May 2018)");
  script_name("Microsoft .NET Framework Security Feature Bypass And DoS Vulnerabilities (KB4095875)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4095875");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaws exist due to,

  - .NET, and .NET core, improperly process XML documents.

  - An error .Net Framework which could allow an attacker to bypass Device Guard");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker who successfully exploited this vulnerability to cause a denial
  of service against a .NET application and also to bypass security.

  Impact Level: System/Application");

  script_tag(name:"affected", value:".NET Framework 3.5 SP1 for Windows 8.1 and Server 2012 R2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4095875");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) <= 0){
  exit(0);
}

key = "SOFTWARE\Microsoft\ASP.NET\";
if(!registry_key_exists(key:key)){
  exit(0);
}

foreach item (registry_enum_keys(key:key))
{
  dotPath = registry_get_sz(key:key + item, item:"Path");
  if(dotPath && "\Microsoft.NET\Framework" >< dotPath)
  {
    sysdllVer = fetch_file_version(sysPath:dotPath, file_name:"mscorlib.dll");
    if(!sysdllVer){
      continue;
    }

    if(version_in_range(version:sysdllVer, test_version:"2.0.50727.5700", test_version2:"2.0.50727.8783"))
    {
      report = report_fixed_ver(file_checked:dotPath + "\mscorlib.dll",
                                file_version:sysdllVer, vulnerable_range:"2.0.50727.5700 - 2.0.50727.8783");
      security_message(data:report);
      exit(0);
    }
  }
}
exit(99);
