###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_suite_rce_kb3141529.nasl 11816 2018-10-10 10:42:56Z mmartin $
#
# Microsoft Office Suite Remote Code Execution Vulnerability (KB3141529)
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
  script_oid("1.3.6.1.4.1.25623.1.0.810686");
  script_version("$Revision: 11816 $");
  script_cve_id("CVE-2017-0199");
  script_bugtraq_id(97498);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-10 12:42:56 +0200 (Wed, 10 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-04-12 10:22:37 +0530 (Wed, 12 Apr 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Suite Remote Code Execution Vulnerability (KB3141529)");

  script_tag(name:"summary", value:"This host is missing a critical update for
  Microsoft Office Suite according to Microsoft KB3141529.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to error in the way
  Microsoft Office and WordPad parse specially crafted files.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to run arbitrary code in the context of the current user on an
  affected system.");

  script_tag(name:"affected", value:"Microsoft Office 2007 Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory ");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3141529");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("MS/Office/Ver");
  script_require_ports(139, 445);
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3141529");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## MS Office
officeVer = get_kb_item("MS/Office/Ver");
if(!officeVer){
  exit(0);
}

commonpath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                            item:"CommonFilesDir");
if(!commonpath){
  exit(0);
}

##For office 2007
if(officeVer =~ "^12\.")
{
  offPath = commonpath + "\Microsoft Shared\Office12";
  offexeVer = fetch_file_version(sysPath:offPath, file_name:"Mso.dll");
  if(offexeVer && version_in_range(version:offexeVer, test_version:"12.0", test_version2:"12.0.6766.4999"))
  {
    report = 'File checked:     ' + offPath + "\Mso.dll" + '\n' +
             'File version:     ' + offexeVer  + '\n' +
             'Vulnerable range: ' + "12.0 - 12.0.6766.4999" + '\n' ;
    security_message(data:report);
    exit(0);
  }
}
