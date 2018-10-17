###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_suite_kb3191895.nasl 7174 2017-09-18 11:48:08Z asteins $
#
# Microsoft Office Suite Remote Code Execution Vulnerability (KB3191895)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.810783");
  script_version("$Revision: 7174 $");
  script_cve_id("CVE-2017-0281");
  script_bugtraq_id(98101);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-09-18 13:48:08 +0200 (Mon, 18 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-05-10 12:08:09 +0530 (Wed, 10 May 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Suite Remote Code Execution Vulnerability (KB3191895)");

  script_tag(name:"summary", value:"This host is missing a critical update for
  Microsoft Office Suite according to Microsoft KB3191895.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists in Microsoft Office software
  when the software fails to properly handle objects in memory."); 

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to run arbitrary code in the context of the current user on an
  affected system.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Office 2007 Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  below link,
  https://support.microsoft.com/en-us/help/3191895");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/3191895");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("MS/Office/Ver");
  script_require_ports(139, 445);
  exit(0);
}




include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variable initialization
officeVer = "";
offPath = "";
offexeVer = "";

## MS Office
officeVer = get_kb_item("MS/Office/Ver");
if(!officeVer){
  exit(0);
}

## Get Office File Path
commonpath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                            item:"CommonFilesDir");
if(!commonpath){
  exit(0);
}

##For office 2007
if(officeVer =~ "^12\.")
{
  ## Get Version from Mso.dll
  offPath = commonpath + "\Microsoft Shared\Office12";
  offexeVer = fetch_file_version(sysPath:offPath, file_name:"Mso.dll");

  if(offexeVer && version_in_range(version:offexeVer, test_version:"12.0", test_version2:"12.0.6768.4999"))
  {
    report = 'File checked:     ' + offPath + "\Mso.dll" + '\n' +
             'File version:     ' + offexeVer  + '\n' +
             'Vulnerable range: ' + "12.0 - 12.0.6768.4999" + '\n' ;
    security_message(data:report);
    exit(0);
  }
}
