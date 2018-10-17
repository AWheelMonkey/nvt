###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_word_ms16-133.nasl 11837 2018-10-11 09:17:05Z asteins $
#
# Microsoft Office Word Multiple Vulnerabilities (3199168)
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
  script_oid("1.3.6.1.4.1.25623.1.0.809717");
  script_version("$Revision: 11837 $");
  script_cve_id("CVE-2016-7232", "CVE-2016-7233", "CVE-2016-7234", "CVE-2016-7235");
  script_bugtraq_id(94005, 94031, 94020, 94022);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 11:17:05 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-11-09 19:47:52 +0530 (Wed, 09 Nov 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Word Multiple Vulnerabilities (3199168)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-133");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists as,

  - Office software fails to properly handle objects in memory.

  - Office or Word reads out of bound memory due to an uninitialized variable.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to run arbitrary code in the context of the current user and also
  view out of bounds memory.");

  script_tag(name:"affected", value:"Microsoft Word 2007,
  Microsoft Word 2010 Service Pack 2,
  Microsoft Word 2013 Service Pack 1.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3127932");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3127953");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3127949");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-133");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Word/Version");
  exit(0);
}


include("version_func.inc");

##word 2007, 2010, 2013
exeVer = get_kb_item("SMB/Office/Word/Version");
exePath = get_kb_item("SMB/Office/Word/Install/Path");
if(!exePath){
  exePath = "Unable to fetch the install path";
}

if(exeVer && exeVer =~ "^(12|14|15).*")
{
  if(exeVer =~ "^12"){
    Vulnerable_range  =  "12 - 12.0.6759.4999";
  }
  else if(exeVer =~ "^14"){
    Vulnerable_range  =  "14 - 14.0.7176.4999";
  }
  else if(exeVer =~ "^15"){
    Vulnerable_range  =  "15 - 15.0.4875.0999";
  }

  if(version_in_range(version:exeVer, test_version:"12.0", test_version2:"12.0.6759.4999") ||
     version_in_range(version:exeVer, test_version:"14.0", test_version2:"14.0.7176.4999") ||
     version_in_range(version:exeVer, test_version:"15.0", test_version2:"15.0.4875.0999"))
  {
     report = 'File checked:     ' + exePath + "winword.exe"  + '\n' +
              'File version:     ' + exeVer  + '\n' +
              'Vulnerable range: ' + Vulnerable_range + '\n' ;
     security_message(data:report);
     exit(0);
  }
}
