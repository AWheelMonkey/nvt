###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4461506.nasl 12352 2018-11-14 15:03:21Z santu $
#
# Microsoft Outlook 2016 Multiple Vulnerabilities (KB4461506)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.814165");
  script_version("$Revision: 12352 $");
  script_cve_id("CVE-2018-8522", "CVE-2018-8524", "CVE-2018-8576", "CVE-2018-8582");
  script_bugtraq_id(105820, 105823, 105822, 105825);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-14 16:03:21 +0100 (Wed, 14 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-14 13:16:29 +0530 (Wed, 14 Nov 2018)");
  script_name("Microsoft Outlook 2016 Multiple Vulnerabilities (KB4461506)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4461506");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaw exists due to in,

  - The way that Microsoft Outlook parses specially modified rule export files.

  - Microsoft Outlook software when it fails to properly handle objects in
    memory. ");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to take control of an affected system and use a specially crafted
  file to perform actions in the security context of the current user.");

  script_tag(name:"affected", value:"Microsoft Outlook 2016");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL" , value:"https://support.microsoft.com/en-us/help/4461506");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

outlookVer = get_kb_item("SMB/Office/Outlook/Version");
if(!outlookVer|| !(outlookVer =~ "^16\.")){
  exit(0);
}

outlookFile = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion" +
                              "\App Paths\OUTLOOK.EXE", item:"Path");
if(!outlookFile){
  exit(0);
}

outlookVer = fetch_file_version(sysPath:outlookFile, file_name:"outlook.exe");
if(!outlookVer){
  exit(0);
}

if(version_in_range(version:outlookVer, test_version:"16.0", test_version2:"16.0.4771.1000"))
{
  report = report_fixed_ver(file_checked: outlookFile + "\outlook.exe",
                            file_version:outlookVer, vulnerable_range:"16.0 - 16.0.4771.1000");
  security_message(data:report);
  exit(0);
}
