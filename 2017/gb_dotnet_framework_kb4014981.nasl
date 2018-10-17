###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dotnet_framework_kb4014981.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# Microsoft .NET Framework Remote Code Execution Vulnerability (KB4014981)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.810861");
  script_version("$Revision: 11863 $");
  script_cve_id("CVE-2017-0160");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-04-13 11:30:09 +0530 (Thu, 13 Apr 2017)");
  script_name("Microsoft .NET Framework Remote Code Execution Vulnerability (KB4014981)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Security Updates KB4014981");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Flaw exists as .NET Framework fails to properly
  validate input before loading libraries.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to take control of an affected system.");

  script_tag(name:"affected", value:"Microsoft .NET Framework 3.5.1
  Microsoft .NET Framework 4.5.2
  Microsoft .NET Framework 4.6/4.6.1
  Microsoft .NET Framework 4.6.2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4014981");
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

if(hotfix_check_sp(winVista:3, winVistax64:3, win2008:3, win2008x64:3,
                   win7:2, win7x64:2, win2008r2:2) <= 0){
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
    sysdllVer = fetch_file_version(sysPath:dotPath, file_name:"system.management.dll");
    if(!sysdllVer){
      exit(0);
    }
    ## https://support.microsoft.com/en-us/kb/4014565
    if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
    {
      if(version_in_range(version:sysdllVer, test_version:"2.0.50727.5700", test_version2:"2.0.50727.8757"))
      {
        report = 'File checked:     ' + dotPath + "\system.management.dll" + '\n' +
                 'File version:     ' + sysdllVer  + '\n' +
                 'Vulnerable range:  2.0.50727.5700 - 2.0.50727.8757\n' ;
        security_message(data:report);
        exit(0);
      }
    }

    ## .NET Framework 4.5.2 on Windows Vista Service Pack 2, Windows Server 2008 Service Pack 2,
    ## https://support.microsoft.com/en-us/help/4014559
    ## Extracted and checked version
    if(hotfix_check_sp(winVista:3, winVistax64:3, win2008:3, win2008x64:3,
                       win7:2, win7x64:2, win2008r2:2) > 0)
    {
      if(version_in_range(version:sysdllVer, test_version:"4.0.30319.30000", test_version2:"4.0.30319.36387"))
      {
          VULN = TRUE ;
          vulnerable_range = "4.0.30319.30000 - 4.0.30319.36387";
      }

      ## .NET Framework 4.6 for Windows Vista SP2, Windows Server 2008 SP2, Windows 7 SP1,
      ## and Windows Server 2008 R2 SP1 and the .NET Framework 4.6.1 for Windows 7 SP1 and
      else if(version_in_range(version:sysdllVer, test_version:"4.6", test_version2:"4.6.1097"))
      {
        VULN = TRUE ;
        vulnerable_range = "4.6 - 4.6.1097";
      }
    }

    ##.NET Framework 4.6.2 for Windows 7 Service Pack 1 and Windows Server 2008 R2 Service Pack 1
    ## https://support.microsoft.com/en-us/help/4014547
    if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
    {
      ## brkVer == "4.6.01590" is to confirm .net version 4.6.2
      ## brkver == "4.6.01586" is standalone .net version 4.6.2
      key1 = "SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Client\";
      brkVer = registry_get_sz(key:key1, item:"Version");
      if((brkVer == "4.6.01590" || brkVer == "4.6.01586" ) && sysdllVer =~ "(^4\.6)")
      {
        if(version_in_range(version:sysdllVer, test_version:"4.6", test_version2:"4.6.1645.0"))
        {
          VULN = TRUE ;
          vulnerable_range = "4.6 - 4.6.1645.0";
        }
      }
    }

    if(VULN)
    {
      report = 'File checked:     ' + dotPath + "\system.management.dll" + '\n' +
               'File version:     ' + sysdllVer  + '\n' +
               'Vulnerable range: ' + vulnerable_range + '\n' ;
      security_message(data:report);
      exit(0);
    }
  }
}
