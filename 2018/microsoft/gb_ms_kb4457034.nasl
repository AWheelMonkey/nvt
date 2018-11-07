###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4457034.nasl 12069 2018-10-25 07:30:30Z cfischer $
#
# Microsoft .NET Framework RCE Vulnerability (KB4457034)
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
  script_oid("1.3.6.1.4.1.25623.1.0.814201");
  script_version("$Revision: 12069 $");
  script_cve_id("CVE-2018-8421");
  script_bugtraq_id(105222);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-25 09:30:30 +0200 (Thu, 25 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-09-12 10:20:22 +0530 (Wed, 12 Sep 2018)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft .NET Framework RCE Vulnerability (KB4457034)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4457034");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error within the
  application when Microsoft .NET Framework processes untrusted input.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to take control of an affected system. An attacker could then install
  programs, view, change, delete data or create new accounts with full user rights.");

  script_tag(name:"affected", value:"Microsoft .NET Framework 4.6, 4.6.1, 4.6.2,
  4.7, 4.7.1, and 4.7.2 for Windows 8.1 and Server 2012 R2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and install the mentioned hotfixes from the
  referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4457034");

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

key = "SOFTWARE\Microsoft\.NETFramework";
if(!registry_key_exists(key:key)){
  exit(0);
}

NetPath = registry_get_sz(key:key + item, item:"InstallRoot");
if(NetPath && "\Microsoft.NET\Framework" >< NetPath)
{
  foreach item (registry_enum_keys(key:key))
  {
    dotPath = NetPath + item;
    dllVer = fetch_file_version(sysPath:dotPath, file_name:"system.workflow.runtime.dll");

    if(!dllVer || !(dllVer =~ "^(4\.(6|7))" )){
      continue;
    }

    if(version_is_less(version:dllVer, test_version:"4.7.3180.0"))
    {
      report = report_fixed_ver(file_checked:dotPath + "\system.workflow.runtime.dll",
                                file_version:dllVer, vulnerable_range:"4.6 - 4.7.3180.0");
      security_message(data:report);
      exit(0);
    }
  }
}
