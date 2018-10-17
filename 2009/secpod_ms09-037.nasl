###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms09-037.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Vulnerabilities in Microsoft ATL Could Allow Remote Code Execution (973908)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Updated By: Madhuri D <dmadhuri@secpod.com> on 2010-11-30
#  - To detect required file versions on vista and win 2008
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.org
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

tag_impact = "Successful exploitation could allow remote attacker execute arbitrary code on
  the vulnerable system.
  Impact Level: System";
tag_affected = "Windows Media Player 9/10/11
  Microsoft Outlook Express 6 Service Pack 1
  Microsoft Outlook Express 5.5 Service Pack 2
  Microsoft Windows 2K Service Pack 4 and prior
  Microsoft Windows XP Service Pack 3 and prior
  Microsoft Windows 2003 Service Pack 2 and prior
  Microsoft Windows Vista Service Pack 1/2 and prior
  Microsoft Windows Server 2008 Service Pack 1/2 and prior";
tag_insight = "The multiple flaws are due to:
  - Bug in the ATL header that could allow reading a variant from a stream and
    leaving the variant type read with an invalid variant. When deleting the
    variant, it is possible to free unintended areas in memory that could be
    controlled by an attacker.
  - Error in 'CComVariant::ReadFromStream()' function used in the ATL header.
    This function does not properly restrict untrusted data read from a stream.
  - An bug in the ATL headers that could allow an attacker to force VariantClear
    to be called on a VARIANT that has not been correctly initialized.
  - Bugs in the ATL headers that handle instantiation of an object from data
    streams.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://technet.microsoft.com/en-us/security/bulletin/MS09-037";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS09-037.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.101100");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-08-14 07:53:52 +0200 (Fri, 14 Aug 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2008-0015", "CVE-2008-0020", "CVE-2009-0901",
                "CVE-2009-2493", "CVE-2009-2494");
  script_bugtraq_id(35558, 35585, 35832, 35828, 35982);
  script_name("Vulnerabilities in Microsoft ATL Could Allow Remote Code Execution (973908)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/36187");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/973908");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2009/2232");
  script_xref(name : "URL" , value : "http://technet.microsoft.com/en-us/security/bulletin/MS09-037");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");


## Variables Initialization
sysPath = "";
sysVer = "";
SP = "";
mpVer = "";
ocxVer = "";
msVer = "";

if(hotfix_check_sp(win2k:5, xp:4, win2003:3, winVista:3, win2008:3) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(sysPath)
{
  # For Windows ATL Component
  sysVer = fetch_file_version(sysPath, file_name:"system32\atl.dll");
  if(sysVer != NULL)
  {
    # Windows 2K
    if(hotfix_check_sp(win2k:5) > 0)
    {
      # Grep for atl.dll version < 3.0.9794.0
      if(version_is_less(version:sysVer, test_version:"3.0.9794.0"))
      {
        security_message(0);
        exit(0);
      }
    }

    # Windows XP
    if(hotfix_check_sp(xp:4) > 0)
    {
      SP = get_kb_item("SMB/WinXP/ServicePack");
      if(("Service Pack 2" >< SP) || ("Service Pack 3" >< SP))
      {
        # Grep for atl.dll < 3.5.2284.2
        if(version_is_less(version:sysVer, test_version:"3.5.2284.2"))
        {
          security_message(0);
          exit(0);
        }
      }
    }

    # Windows 2003
    if(hotfix_check_sp(win2003:3) > 0)
    {
      SP = get_kb_item("SMB/Win2003/ServicePack");
      if("Service Pack 2" >< SP)
      {
        # Grep for atl.dll version < 3.5.2284.2
        if(version_is_less(version:sysVer, test_version:"3.5.2284.2"))
        {
          security_message(0);
          exit(0);
        }
      }
    }

    # Windows Vista and Windows 2008
    if(hotfix_check_sp(winVista:3, win2008:3) > 0)
    {
      # Grep for atl.dll version < 3.5.2284.2
      if(version_is_less(version:sysVer, test_version:"3.5.2284.2"))
      {
        security_message(0);
        exit(0);
      }
    }
  }

  # Check Hotfix Missing Media player
  mpVer = fetch_file_version(sysPath, file_name:"system32\wmp.dll");
  if(mpVer != NULL)
  {
    # Windows 2K
    if(hotfix_check_sp(win2k:5) > 0)
    {
      # Grep for wmp.dll version < 9.0.0.3364
      if(version_is_less(version:mpVer, test_version:"9.0.0.3364"))
      {
        security_message(0);
        exit(0);
      }
    }

    # Windows XP
    if(hotfix_check_sp(xp:4) > 0)
    {
      SP = get_kb_item("SMB/WinXP/ServicePack");
      if("Service Pack 2" >< SP)
      {
        # Grep for wmp.dll 9.0 < 9.0.0.3364, 10.0 < 10.0.0.4074 and 11 < 11.0.5721.5268
        if(version_in_range(version:mpVer, test_version:"9.0", test_version2:"9.0.0.3363")||
           version_in_range(version:mpVer, test_version:"10.0", test_version2:"10.0.0.4073")||
           version_in_range(version:mpVer, test_version:"11.0", test_version2:"11.0.5721.5267"))
        {
          security_message(0);
          exit(0);
        }
      }

      if("Service Pack 3" >< SP)
      {
        # Grep for wmp.dll < 9.0.0.4507
        if(version_in_range(version:mpVer, test_version:"9.0", test_version2:"9.0.0.4506")||
           version_in_range(version:mpVer, test_version:"10.0", test_version2:"10.0.0.4073")||
           version_in_range(version:mpVer, test_version:"11.0", test_version2:"11.0.5721.5267"))
        {
          security_message(0);
          exit(0);
        }
      }
    }

    # Windows 2003
    if(hotfix_check_sp(win2003:3) > 0)
    {
      SP = get_kb_item("SMB/Win2003/ServicePack");
      if("Service Pack 2" >< SP)
      {
        # Grep for wmp.dll version 10 < 10.0.0.4006
        if(version_in_range(version:mpVer, test_version:"10.0", test_version2:"10.0.0.4005"))
        {
          security_message(0);
          exit(0);
        }
      }
    }
  }

  # Windows Vista and Windows 2008
  if(hotfix_check_sp(winVista:3, win2008:3) > 0)
  {
    if(version_in_range(version:mpVer, test_version:"11.0", test_version2:"11.0.6000.6351") ||
       version_in_range(version:mpVer, test_version:"11.0.6000.6500", test_version2:"11.0.6000.6510"))
    {
      security_message(0);
      exit(0);
    }

    SP = get_kb_item("SMB/WinVista/ServicePack");

    if(!SP) {
      SP = get_kb_item("SMB/Win2008/ServicePack");
    }

    if("Service Pack 1" >< SP)
    {
      # Grep for wmp.dll version
      if(version_in_range(version:mpVer, test_version:"11.0.6001.7000", test_version2:"11.0.6001.7006") ||
         version_in_range(version:mpVer, test_version:"11.0.6001.7100", test_version2:"11.0.6001.7113"))
      {
        security_message(0);
        exit(0);
      }
    }

    if("Service Pack 2" >< SP)
    {
      # Grep for wmp.dll version
      if(version_in_range(version:mpVer, test_version:"11.0.6002.18000", test_version2:"11.0.6002.18064") ||
         version_in_range(version:mpVer, test_version:"11.0.6002.22000", test_version2:"11.0.6002.22171"))
      {
        security_message(0);
        exit(0);
      }
    }
  }

  # For Microsoft MSWebDVD ActiveX Control
  msVer = fetch_file_version(sysPath, file_name:"system32\Mswebdvd.dll");
  if(msVer)
  {
    # Windows XP
    if(hotfix_check_sp(xp:4) > 0)
    {
      SP = get_kb_item("SMB/WinXP/ServicePack");
      if("Service Pack 2" >< SP)
      {
        # Grep for Mswebdvd.dll < 6.5.2600.3610
        if(version_is_less(version:msVer, test_version:"6.5.2600.3610"))
        {
          security_message(0);
          exit(0);
        }
      }

      if("Service Pack 3" >< SP)
      {
        # Grep for Mswebdvd.dll < 6.5.2600.5857
        if(version_is_less(version:msVer, test_version:"6.5.2600.5857"))
        {
          security_message(0);
          exit(0);
        }
      }
    }

    # Windows 2003
    if(hotfix_check_sp(win2003:3) > 0)
    {
      SP = get_kb_item("SMB/Win2003/ServicePack");
      if("Service Pack 2" >< SP)
      {
        #Grep for Mswebdvd.dll < 6.5.3790.4565
        if(version_is_less(version:msVer, test_version:"6.5.3790.4565"))
        {
          security_message(0);
          exit(0);
        }
      }
    }
  }

  # For Microsoft HtmlInput Object ActiveX Control
  webVer = fetch_file_version(sysPath, file_name:"ehome\Ehkeyctl.dll");
  if(webVer)
  {
    # Windows Vista
    if(hotfix_check_sp(winVista:3) > 0)
    {
      SP = get_kb_item("SMB/WinVista/ServicePack");

      if(!SP) {
         SP = get_kb_item("SMB/Win2008/ServicePack");
      }

      if("Service Pack 1" >< SP)
      {
        # Grep for Ehkeyctl.dll version < 6.0.6001.18295
        if(version_in_range(version:webVer, test_version:"6.0.6001.18000", test_version2:"6.0.6001.18294")||
           version_in_range(version:webVer, test_version:"6.0.6001.22000", test_version2:"6.0.6001.22475"))
        {
          security_message(0);
          exit(0);
        }
      }

      if("Service Pack 2" >< SP)
      {
        # Grep for Ehkeyctl.dll version < 6.0.6002.18072
        if(version_in_range(version:webVer, test_version:"6.0.6002.18000", test_version2:"6.0.6002.18071") ||
           version_in_range(version:webVer, test_version:"6.0.6002.22000", test_version2:"6.0.6002.22180"))
        {
          security_message(0);
          exit(0);
        }
      }
    }
  }
}

# Microsoft Outlook Express 5.5 Service Pack 2 or 6 Service Pack 1
sysPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                         item:"ProgramFilesDir");
if(sysPath != NULL)
{
  dllVer = fetch_file_version(sysPath, file_name:"Outlook Express\msoe.dll");

  if(dllVer != NULL)
  {
    # Windows 2K
    if(hotfix_check_sp(win2k:5) > 0)
    {
      # Grep for msoe.ll version < 5.50.5003.1000 and 6.0.2800.1983
      if(version_in_range(version:dllVer, test_version:"5.5", test_version2:"5.50.5003.999")||
         version_in_range(version:dllVer, test_version:"6.0", test_version2:"6.0.2800.1982"))
      {
        security_message(0);
        exit(0);
      }
    }

    # Windows XP
    if(hotfix_check_sp(xp:4) > 0)
    {
      SP = get_kb_item("SMB/WinXP/ServicePack");
      if("Service Pack 2" >< SP)
      {
        # Grep for msoe.dll < 6.0.2900.3598
        if(version_in_range(version:dllVer, test_version:"6.0", test_version2:"6.0.2900.3597"))
        {
          security_message(0);
          exit(0);
        }
      }

      if("Service Pack 3" >< SP)
      {
        # Grep for msoe.dll < 6.0.2900.5843
        if(version_in_range(version:dllVer, test_version:"6.0", test_version2:"6.0.2900.5842"))
        {
          security_message(0);
          exit(0);
        }
      }
    }

    # Windows 2003
    if(hotfix_check_sp(win2003:3) > 0)
    {
      SP = get_kb_item("SMB/Win2003/ServicePack");
      if("Service Pack 2" >< SP)
      {
        # Grep for msoe.dll version < 6.0.3790.4548
        if(version_in_range(version:dllVer, test_version:"6.0", test_version2:"6.0.3790.4547"))
        {
          security_message(0);
          exit(0);
        }
      }
    }
  }
}

# For DHTML Editing Component ActiveX Control
sysPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                          item:"ProgramFilesDir");
if(sysPath != NULL)
{
  ocxVer = fetch_file_version(sysPath, file_name:"Common Files\Microsoft Shared\Triedit\Dhtmled.ocx");

  if(ocxVer != NULL)
  {
    # Windows 2K
    if(hotfix_check_sp(win2k:5) > 0)
    {
      # Grep for Dhtmled.ocx version < 6.1.0.9234
      if(version_is_less(version:ocxVer, test_version:"6.1.0.9234"))
      {
        security_message(0);
        exit(0);
      }
    }

    # Windows XP
    if(hotfix_check_sp(xp:4) > 0)
    {
      SP = get_kb_item("SMB/WinXP/ServicePack");
      if(("Service Pack 2" >< SP) || ("Service Pack 3" >< SP))
      {
        # Grep for Dhtmled.ocx < 6.1.0.9247
        if(version_is_less(version:ocxVer, test_version:"6.1.0.9247"))
        {
         security_message(0);
         exit(0);
        }
      }
    }

    # Windows 2003
    if(hotfix_check_sp(win2003:3) > 0)
    {
      SP = get_kb_item("SMB/Win2003/ServicePack");
      if("Service Pack 2" >< SP)
      {
        # Grep for Localspl.dll version < 6.1.0.9247
        if(version_is_less(version:ocxVer, test_version:"6.1.0.9247"))
        {
          security_message(0);
          exit(0);
        }
      }
    }
  }
}
