###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb3203477.nasl 6757 2017-07-19 05:57:31Z cfischer $
#
# Microsoft Excel 2016 Multiple Vulnerabilities (KB3203477)
#
# Authors:
# Rinu <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.811507");
  script_version("$Revision: 6757 $");
  script_cve_id("CVE-2017-8501", "CVE-2017-8502");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-19 07:57:31 +0200 (Wed, 19 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-07-12 09:00:18 +0530 (Wed, 12 Jul 2017)");
  script_name("Microsoft Excel 2016 Multiple Vulnerabilities (KB3203477)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB3203477");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to error in
  Microsoft Office software when the software fails to properly handle objects
  in memory. ");

  script_tag(name:"impact", value:"Successful exploitation will allow
  an attacker who successfully exploited the vulnerability to run arbitrary
  code in the context of the current user. 

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Excel 2016");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/3203477");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/3203477");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Excel/Version");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## variable Initialization
excelVer = "";

## Fetch Microsoft Excel Version
excelVer = get_kb_item("SMB/Office/Excel/Version");
if(!excelVer){
  exit(0);
}

##Get install Path of Microsoft Excel
excelPath = get_kb_item("SMB/Office/Excel/Install/Path");
if(!excelPath){
  excelPath = "Unable to fetch the install path";
}

##Check for vulnerable Office Excel 2016 versions
if(excelVer =~ "^(16\.)" && version_is_less(version:excelVer, test_version:"16.0.4561.1000"))
{
  report = 'File checked:     ' + excelPath + "Excel.exe" + '\n' +
           'File version:     ' + excelVer  + '\n' +
           'Vulnerable range: ' + "16.0 - 16.0.4561.0999" + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
