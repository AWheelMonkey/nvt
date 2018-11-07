###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_excel_viewer_ms16-042.nasl 12096 2018-10-25 12:26:02Z asteins $
#
# Microsoft Windows Excel Viewer Remote Code Execution Vulnerabilities (3148775)
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
  script_oid("1.3.6.1.4.1.25623.1.0.807316");
  script_version("$Revision: 12096 $");
  script_cve_id("CVE-2016-0122", "CVE-2016-0139");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-25 14:26:02 +0200 (Thu, 25 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-04-13 10:46:16 +0530 (Wed, 13 Apr 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Windows Excel Viewer Remote Code Execution Vulnerabilities (3148775)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-042.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to Microsoft Excel improperly
  handles the loading of dynamic link library (DLL) files.");

  script_tag(name:"impact", value:"Successful exploitation will allow a
  context-dependent attacker to execute remote code.");

  script_tag(name:"affected", value:"Microsoft Excel Viewer 2007 Service Pack 3 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-in/kb/3114898");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/library/security/MS16-042");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/XLView/Version");
  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");

## Microsoft Office Excel Viewer 2007
excelviewVer = get_kb_item("SMB/Office/XLView/Version");
if(excelviewVer =~ "^12\..*")
{
  if(version_in_range(version:excelviewVer, test_version:"12.0", test_version2:"12.0.6747.4999"))
  {
    report = 'File checked:     Xlview.exe' + '\n' +
             'File version:     ' + excelviewVer  + '\n' +
             'Vulnerable range: 12 - 12.0.6747.4999' +  '\n' ;
    security_message(data:report);
    exit(0);
  }
}
