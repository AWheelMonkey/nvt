###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011091.nasl 7118 2017-09-13 15:08:32Z santu $
#
# Microsoft Outlook 2016 Defense in Depth Update (KB4011091)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.811815");
  script_version("$Revision: 7118 $");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-09-13 17:08:32 +0200 (Wed, 13 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-09-13 09:22:50 +0530 (Wed, 13 Sep 2017)");
  script_name("Microsoft Outlook 2016 Defense in Depth Update (KB4011091)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011091");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Microsoft has released an update for 
  Microsoft Office that provides enhanced security as a defense-in-depth 
  measure.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers to
  affect on integrity, availability and confidentiality of the system.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Outlook 2016");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4011091");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/4011091");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Outlook/Version");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");


## Variable Initialization
outlookVer = "";
outlookFile = "";

## Check for Office outlook Version
outlookVer = get_kb_item("SMB/Office/Outlook/Version");

## Check for Microsoft Outlook 2016
if(!outlookVer || !(outlookVer =~ "^16\.")){
  exit(0);
}

## Get Office outlook Path
outlookFile = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion" +
                              "\App Paths\OUTLOOK.EXE", item:"Path");
if(!outlookFile){
  exit(0);
}

## Get Office outlook Version
outlookVer = fetch_file_version(sysPath:outlookFile, file_name:"outlook.exe");
if(!outlookVer){
  exit(0);
}

## Check for vulnerable versions
if(version_in_range(version:outlookVer, test_version:"16.0", test_version2:"16.0.4588.0999"))
{
  report = 'File checked:     ' +  outlookFile + "\outlook.exe" + '\n' +
           'File version:     ' +  outlookVer  + '\n' +
           'Vulnerable range:  16.0 - 16.0.4588.0999'+ '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
