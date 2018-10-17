###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_outlook_ms16-029.nasl 9122 2018-03-17 14:01:04Z cfischer $
#
# Microsoft Office Outlook Remote Code Execution Vulnerability (3141806)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.807517");
  script_version("$Revision: 9122 $");
  script_cve_id("CVE-2016-0134");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-03-17 15:01:04 +0100 (Sat, 17 Mar 2018) $");
  script_tag(name:"creation_date", value:"2016-03-09 09:58:26 +0530 (Wed, 09 Mar 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Outlook Remote Code Execution Vulnerability (3141806)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-029.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Flaw exists due to the the Office software
  fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow a to execute
  arbitrary code in the context of the current user and to take control of the
  affected system.

  Impact Level: Application");

  script_tag(name:"affected", value:"Microsoft Outlook 2007 Service Pack 3 and prior,

  Microsoft Outlook 2010 Service Pack 2 and prior,

  Microsoft Outlook 2013 Service Pack 1 and prior,

  Microsoft Outlook 2016.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the

  https://technet.microsoft.com/library/security/MS16-029");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/2880510");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/(3114883");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS16-029");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Outlook/Version");
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

# Variable Initialization
outlookVer = "";
outlookFile = "";

## Check for Office outlook 2007,2010,2013 and 2016
outlookVer = get_kb_item("SMB/Office/Outlook/Version");

if(!outlookVer || !(outlookVer =~ "^(12|14|15|16)")){
  exit(0);
}

## Office outlook
outlookFile = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion" +
                              "\App Paths\OUTLOOK.EXE", item:"Path");
if(outlookFile)
{
  outlookVer = fetch_file_version(sysPath:outlookFile, file_name:"outlook.exe");
  if(outlookVer)
  {
    if(version_in_range(version:outlookVer, test_version:"12.0", test_version2:"12.0.6744.4999"))
    {
      Vulnerable_range = "12.0 - 12.0.6744.4999";
      VULN = TRUE ;
    }
    else if(version_in_range(version:outlookVer, test_version:"14.0", test_version2:"14.0.7167.4999"))
    {
      Vulnerable_range = "14.0 - 14.0.7167.4999";
      VULN = TRUE ;
    }
    else if(version_in_range(version:outlookVer, test_version:"15.0", test_version2:"15.0.4805.0999"))
    {
      Vulnerable_range = "15.0 - 15.0.4805.0999";
      VULN = TRUE ;
    }
    else if(version_in_range(version:outlookVer, test_version:"16.0", test_version2:"16.0.4351.0999"))
    {
      Vulnerable_range = "16.0 - 16.0.4351.0999";
      VULN = TRUE ;
    }
  }
}

if(VULN)
{
  report = 'File checked:     ' +  outlookFile + "\outlook.exe" + '\n' +
           'File version:     ' +  outlookVer  + '\n' +
           'Vulnerable range: ' +  Vulnerable_range + '\n' ;

  security_message(data:report);
  exit(0);
}
