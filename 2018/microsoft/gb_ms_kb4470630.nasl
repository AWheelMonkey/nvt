###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4470630.nasl 12963 2019-01-08 07:50:52Z ckuersteiner $
#
# Microsoft .NET Framework 3.5 Multiple Vulnerabilities (KB4470630)
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
  script_oid("1.3.6.1.4.1.25623.1.0.814701");
  script_version("$Revision: 12963 $");
  script_cve_id("CVE-2018-8517", "CVE-2018-8540");
  script_bugtraq_id(106075, 106073);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2019-01-08 08:50:52 +0100 (Tue, 08 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-12-12 10:55:09 +0530 (Wed, 12 Dec 2018)");
  script_name("Microsoft .NET Framework 3.5 Multiple Vulnerabilities (KB4470630)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4470630");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,

  - An error when .NET Framework improperly handles special web requests.

  - An error when the Microsoft .NET Framework fails to validate input properly.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to cause a denial of service condition and take control of an affected system.");

  script_tag(name:"affected", value:"Microsoft .NET Framework 3.5 for
  Microsoft Windows 8.1 for 32-bit/x64

  Microsoft Windows Server 2012 R2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4470630");
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
          sysdllVer = fetch_file_version(sysPath:dotPath, file_name:"system.web.extensions.dll");
          if(sysdllVer)
          {
            if(version_in_range(version:sysdllVer, test_version:"3.5.30729.0", test_version2:"3.5.30729.8813")){
              VULN = TRUE;
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
        sysdllVer = fetch_file_version(sysPath:dotPath, file_name:"system.web.extensions.dll");
        if(sysdllVer)
        {
          if(version_in_range(version:sysdllVer, test_version:"3.5.30729.0", test_version2:"3.5.30729.8813")){
            VULN = TRUE ;
          }
        }
      }
    }
  }
  if(VULN)
  {
    report = report_fixed_ver(file_checked:dotPath + "system.web.extensions.dll",
                              file_version:sysdllVer, vulnerable_range:"3.5.30729.0 - 3.5.30729.8813");
    security_message(data:report);
    exit(0);
  }
}
exit(99);
