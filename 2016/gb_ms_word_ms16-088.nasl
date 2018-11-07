###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_word_ms16-088.nasl 11961 2018-10-18 10:49:40Z asteins $
#
# Microsoft Office Word Multiple Vulnerabilities (3170008)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.807861");
  script_version("$Revision: 11961 $");
  script_cve_id("CVE-2016-3280", "CVE-2016-3282", "CVE-2016-3279", "CVE-2016-3281");
  script_bugtraq_id(91587, 91582, 91588, 91589);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-18 12:49:40 +0200 (Thu, 18 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-07-13 12:06:55 +0530 (Wed, 13 Jul 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Word Multiple Vulnerabilities (3170008)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-088");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple errors are due to,

  - Office software improperly handles the parsing of file formats.

  - Office software fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to run arbitrary code in the context of the current user and bypass
  certain security restrictions.");

  script_tag(name:"affected", value:"Microsoft Word 2007 Service Pack 3 and prior,
  Microsoft Word 2010 Service Pack 2 and prior,
  Microsoft Word 2013 Service Pack 1 and prior,
  Microsoft Word 2016 Service Pack 1 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3115292");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3115301");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3115311");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3115317");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-088");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Word/Version");
  exit(0);
}


include("version_func.inc");

##word 2007, 2010, 2013, 2016
exeVer = get_kb_item("SMB/Office/Word/Version");
exePath = get_kb_item("SMB/Office/Word/Install/Path");
if(!exePath){
  exePath = "Unable to fetch the install path";
}

if(exeVer && exeVer =~ "^(12|14|15|16).*")
{
  if(exeVer =~ "^12"){
    Vulnerable_range  =  "12 - 12.0.6752.4999";
  }
  else if(exeVer =~ "^14"){
    Vulnerable_range  =  "14 - 14.0.7171.5001";
  }
  else if(exeVer =~ "^15"){
    Vulnerable_range  =  "15 - 15.0.4841.0999";
  }
  else if(exeVer =~ "^16"){
    Vulnerable_range  =  "16 - 16.0.4405.0999";
  }

  if(version_in_range(version:exeVer, test_version:"12.0", test_version2:"12.0.6752.4999") ||
     version_in_range(version:exeVer, test_version:"14.0", test_version2:"14.0.7171.5001") ||
     version_in_range(version:exeVer, test_version:"15.0", test_version2:"15.0.4841.0999") ||
     version_in_range(version:exeVer, test_version:"16.0", test_version2:"16.0.4405.0999"))
  {
     report = 'File checked:     ' + exePath + "winword.exe"  + '\n' +
              'File version:     ' + exeVer  + '\n' +
              'Vulnerable range: ' + Vulnerable_range + '\n' ;
     security_message(data:report);
     exit(0);
  }
}
