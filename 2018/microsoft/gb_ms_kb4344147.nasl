###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4344147.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# Microsoft .NET Framework Multiple Vulnerabilities (KB4344147)
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
  script_oid("1.3.6.1.4.1.25623.1.0.813759");
  script_version("$Revision: 12120 $");
  script_cve_id("CVE-2018-8360", "CVE-2018-8202");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-08-15 09:11:10 +0530 (Wed, 15 Aug 2018)");
  script_name("Microsoft .NET Framework Multiple Vulnerabilities (KB4344147)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4344147");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists

  - When .NET Framework is used in high-load/high-density network connections
    where content from one stream can blend into another stream.

  - An error in how .NET Framework activates COM objects.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to access information in multi-tenant environments and elevate their privilege
  level.");

  script_tag(name:"affected", value:"Microsoft .NET Framework 4.5.2 for Windows
  8.1 and Windows Server 2012 R2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4344147");

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
    if(!sysdllVer|| !(sysdllVer =~ "^4\.")){
      continue;
    }

    if(version_in_range(version:sysdllVer, test_version:"4.0.30319.30000", test_version2:"4.0.30319.36459"))
    {
      report = report_fixed_ver(file_checked:dotPath + "mscorlib.dll",
                                file_version:sysdllVer, vulnerable_range:"4.0.30319.30000 - 4.0.30319.36459");
      security_message(data:report);
      exit(0);
    }
  }
}
exit(99);
