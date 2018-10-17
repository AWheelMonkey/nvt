###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4344146.nasl 10988 2018-08-15 14:37:17Z santu $
#
# Microsoft .NET Framework Information Disclosure Vulnerability (KB4344146)
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
  script_oid("1.3.6.1.4.1.25623.1.0.813760");
  script_version("$Revision: 10988 $");
  script_cve_id("CVE-2018-8360");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-08-15 16:37:17 +0200 (Wed, 15 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-15 09:31:10 +0530 (Wed, 15 Aug 2018)");
  script_name("Microsoft .NET Framework Information Disclosure Vulnerability (KB4344146)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4344146");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists when .NET Framework is used
  in high-load/high-density network connections where content from one stream
  can blend into another stream.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to access information in multi-tenant environments.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft .NET Framework 4.6, 4.6.1, 4.6.2, 4.7,
  4.7.1, and 4.7.2 for Windows 7 SP1 and Server 2008 R2 SP1 and for .NET Framework
  4.6 for Server 2008 SP2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4344146");

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

if(hotfix_check_sp(win2008:3, win2008x64:3, win7:2, win7x64:2, win2008r2:2) <= 0){
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
    dllVer = fetch_file_version(sysPath:dotPath, file_name:"mscorlib.dll");
    if(!dllVer || !(dllVer =~ "^(4\.(6|7))" )){
      continue;
    }

    if(version_is_less(version:dllVer, test_version:"4.7.3133.0"))
    {
      report = report_fixed_ver(file_checked:dotPath + "mscorlib.dll",
                                file_version:dllVer, vulnerable_range:"4.6 - 4.7.3132");
      security_message(data:report);
      exit(0);
    }
  }
}
exit(99);
