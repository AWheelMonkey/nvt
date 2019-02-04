###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4480063.nasl 13004 2019-01-09 16:32:29Z santu $
#
# Microsoft .NET Framework Information Disclosure Vulnerability (KB4480063)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.814722");
  script_version("$Revision: 13004 $");
  script_cve_id("CVE-2019-0545");
  script_bugtraq_id(106405);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-01-09 17:32:29 +0100 (Wed, 09 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-09 11:24:16 +0530 (Wed, 09 Jan 2019)");
  script_name("Microsoft .NET Framework Information Disclosure Vulnerability (KB4480063)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4480063");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error which allows
  to bypass CORS configuration.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  who successfully exploited the vulnerability to retrieve content, that is normally
  restricted, from a web application.");

  script_tag(name:"affected", value:"Microsoft .NET Framework 3.5.1 on

  Windows 7 for 32-bit/x64 Systems Service Pack 1

  Windows Server 2008 R2 for x64-based Systems Service Pack 1");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4480063");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
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

if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) <= 0){
  exit(0);
}

if(!registry_key_exists(key:"SOFTWARE\Microsoft\.NETFramework")){
  if(!registry_key_exists(key:"SOFTWARE\Microsoft\ASP.NET")){
    exit(0);
  }
}

key_list = make_list("SOFTWARE\Microsoft\.NETFramework\", "SOFTWARE\Microsoft\ASP.NET\");

foreach key(key_list)
{
  if(".NETFramework" >< key)
  {
    foreach item (registry_enum_keys(key:key))
    {
      NetPath = registry_get_sz(key:key + item, item:"InstallRoot");
      if(NetPath && "\Microsoft.NET\Framework" >< NetPath)
      {
        foreach item (registry_enum_keys(key:key))
        {
          dotPath = NetPath + item;
          dllVer = fetch_file_version(sysPath:dotPath, file_name:"system.dll");
          if(dllVer)
          {
            if(version_in_range(version:dllVer, test_version:"2.0.50727.5700", test_version2:"2.0.50727.8800")){
              VULN = TRUE ;
              break;
            }
          }
        }
      }
    }
  }
  if((!VULN) && "ASP.NET" >< key)
  {
    foreach item (registry_enum_keys(key:key))
    {
      dotPath = registry_get_sz(key:key + item, item:"Path");
      if(dotPath && "\Microsoft.NET\Framework" >< dotPath)
      {
        dllVer = fetch_file_version(sysPath:dotPath, file_name:"system.dll");
        if(dllVer)
        {
          if(version_in_range(version:dllVer, test_version:"2.0.50727.5700", test_version2:"2.0.50727.8800")){
            VULN = TRUE ;
            break;
          }
        }
      }
    }
  }
  if(VULN)
  {
    report = report_fixed_ver(file_checked:dotPath + "\system.dll",
                              file_version:dllVer, vulnerable_range:"2.0.50727.5700 - 2.0.50727.8800");
    security_message(data:report);
    exit(0);
  }
}
exit(99);
