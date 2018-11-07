###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dotnet_framework_kb4019113.nasl 12069 2018-10-25 07:30:30Z cfischer $
#
# Microsoft .NET Framework Security Bypass Vulnerability (4019113)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.811038");
  script_version("$Revision: 12069 $");
  script_cve_id("CVE-2017-0248");
  script_bugtraq_id(98117);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-25 09:30:30 +0200 (Thu, 25 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-05-11 12:37:20 +0530 (Thu, 11 May 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft .NET Framework Security Bypass Vulnerability (4019113)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4019113");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Flaw exists when Microsoft .NET Framework
  (and .NET Core) components do not completely validate certificates.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to bypass certain security restrictions and perform unauthorized
  actions.");

  script_tag(name:"affected", value:"Microsoft .NET Framework 3.5

  Microsoft .NET Framework 4.5.2

  Microsoft .NET Framework 4.6.2

  Microsoft .NET Framework 4.6/4.6.1");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4019113");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(hotfix_check_sp(win2012:1) <= 0){
  exit(0);
}

key = "SOFTWARE\Microsoft\ASP.NET\";
if(!registry_key_exists(key:key)){
  exit(0);
}

foreach item (registry_enum_keys(key:key))
{
  dotpath = registry_get_sz(key:key + item, item:"Path");
  if(dotpath && "\Microsoft.NET\Framework" >< dotpath)
  {
    dllVer = fetch_file_version(sysPath:dotpath, file_name:"System.dll");
    if(dllVer)
    {
      ## .NET Framework 3.5 Service Pack 1 for Windows Server 2012
      ## https://support.microsoft.com/en-us/help/4014503
      if(version_in_range(version:dllVer, test_version:"2.0.50727.5700", test_version2:"2.0.50727.8758"))
      {
        Vulnerable_range = "2.0.50727.5700 - 2.0.50727.8758";
        VULN = TRUE ;
      }

      ## .NET Framework 4.5.2 for Windows Server 2012
      ## https://support.microsoft.com/en-us/help/4014513
      else if(version_in_range(version:dllVer, test_version:"4.0.30319.30000", test_version2:"4.0.30319.36388"))
      {
        Vulnerable_range = "4.0.30319.30000 - 4.0.30319.36388";
        VULN = TRUE ;
      }

      ## .NET Framework 4.6 and 4.6.1 for Windows Server 2012
      ## https://support.microsoft.com/en-us/help/4014509
      else if(version_in_range(version:dllVer, test_version:"4.6", test_version2:"4.6.1098"))
      {
        Vulnerable_range = "4.6 - 4.6.1098";
        VULN = TRUE ;
      }

      ##.NET Framework 4.6.2 for Windows Server 2012
      ##https://support.microsoft.com/en-us/help/4014506
      key1 = "SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Client\";
      brkVer = registry_get_sz(key:key1, item:"Version");
      if((brkVer == "4.6.01590" || brkVer == "4.6.01586" ) && dllVer =~ "(^4\.6)")
      {
        if(version_in_range(version:dllVer, test_version:"4.6", test_version2:"4.6.1646"))
        {
          Vulnerable_range = "4.6 - 4.6.1646";
          VULN = TRUE ;
        }
      }

      if(VULN)
      {
        report = 'File checked:     ' + dotpath + "\system.dll" + '\n' +
                 'File version:     ' + dllVer  + '\n' +
                 'Vulnerable range: ' + Vulnerable_range + '\n' ;
        security_message(data:report);
        exit(0);
      }
    }
  }
}
