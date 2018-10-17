###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb3213642.nasl 7336 2017-10-04 05:42:02Z asteins $
#
# Microsoft PowerPoint 2007 Service Pack 3 Remote Code Execution Vulnerability (KB3213642)
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
  script_oid("1.3.6.1.4.1.25623.1.0.811744");
  script_version("$Revision: 7336 $");
  script_cve_id("CVE-2017-8742");
  script_bugtraq_id(100741);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-10-04 07:42:02 +0200 (Wed, 04 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-09-13 09:12:03 +0530 (Wed, 13 Sep 2017)");
  script_name("Microsoft PowerPoint 2007 Service Pack 3 Remote Code Execution Vulnerability (KB3213642)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB3213642");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists due to an error in Microsoft
  Office software when the software fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  who successfully exploited the vulnerability to run arbitrary code in the context
  of the current user. 

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft PowerPoint 2007 Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/3213642");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/3213642");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/PowerPnt/Version", "MS/Office/Ver");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variable Initialization
offPath = "";
exeVer = "";
path = "";
pptVer = "";

## Get Powerpoint Version
pptVer = get_kb_item("SMB/Office/PowerPnt/Version");
if(!pptVer){
  exit(0);
}

# Get Program Files path
path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                          item:"ProgramFilesDir");
if(!path){
  exit(0);
}

## Office Path
offPath = path + "\Microsoft Office\OFFICE12" ;

## Fetch 'ppcore.dll' file version
exeVer  = fetch_file_version(sysPath:offPath, file_name:"ppcore.dll");
if(!exeVer){
  exit(0);
}

## Check for vulnerable versions
if(exeVer =~ "^(12)\." && version_is_less(version:exeVer, test_version:"12.0.6776.5000"))
{
  report = 'File checked:     ' + offPath + "\ppcore.dll"  + '\n' +
           'File version:     ' + exeVer  + '\n' +
           'Vulnerable range: ' + "12.0 - 12.0.6776.4999" + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
