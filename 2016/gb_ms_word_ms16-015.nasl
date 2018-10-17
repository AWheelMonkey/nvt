###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_word_ms16-015.nasl 11640 2018-09-27 07:15:20Z asteins $
#
# Microsoft Office Word Remote Code Execution Vulnerabilities (3134226)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.807300");
  script_version("$Revision: 11640 $");
  script_cve_id("CVE-2016-0022", "CVE-2016-0052", "CVE-2016-0053", "CVE-2016-0056");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-27 09:15:20 +0200 (Thu, 27 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-02-10 09:01:09 +0530 (Wed, 10 Feb 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Word Remote Code Execution Vulnerabilities (3134226)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-015");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist as Office software fails
  to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to run arbitrary code in the context of the current user.");

  script_tag(name:"affected", value:"Microsoft Word 2007 Service Pack 3 and prior,
  Microsoft Word 2010 Service Pack 2 and prior,
  Microsoft Word 2013 Service Pack 1 and prior,
  Microsoft Word 2016 Service Pack 1 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  below link, https://technet.microsoft.com/en-us/security/bulletin/ms16-015");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3114724");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3114755");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3114748");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/library/security/MS16-015");
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
if(!exeVer){
  exit(0);
}

exePath = get_kb_item("SMB/Office/Word/Install/Path");
if(!exePath){
  exePath = "Unable to fetch the install path";
}

if(exeVer && exeVer =~ "^(12|14|15|16).*")
{
  if(exeVer =~ "^12"){
    Vulnerable_range  =  "12 - 12.0.6743.4999";
  }
  else if(exeVer =~ "^14"){
    Vulnerable_range  =  "14 - 14.0.7166.4999";
  }
  else if(exeVer =~ "^15"){
    Vulnerable_range  =  "15 - 15.0.4797.0999";
  }
  else if(exeVer =~ "^16"){
    Vulnerable_range  =  "16 - 16.0.4339.0999";
  }

  if(version_in_range(version:exeVer, test_version:"12.0", test_version2:"12.0.6743.4999") ||
     version_in_range(version:exeVer, test_version:"14.0", test_version2:"14.0.7166.4999") ||
     version_in_range(version:exeVer, test_version:"15.0", test_version2:"15.0.4797.0999") ||
     version_in_range(version:exeVer, test_version:"16.0", test_version2:"16.0.4339.0999"))
  {
     report = 'File checked:     ' + exePath + "winword.exe"  + '\n' +
              'File version:     ' + exeVer  + '\n' +
              'Vulnerable range: ' + Vulnerable_range + '\n' ;
     security_message(data:report);
     exit(0);
  }
}
