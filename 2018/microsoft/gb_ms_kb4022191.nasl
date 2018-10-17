###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4022191.nasl 10868 2018-08-10 05:36:57Z ckuersteiner $
#
# Microsoft Excel 2013 Information Disclosure Vulnerability (KB4022191)
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
  script_oid("1.3.6.1.4.1.25623.1.0.813435");
  script_version("$Revision: 10868 $");
  script_cve_id("CVE-2018-8246");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 07:36:57 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-06-13 12:29:36 +0530 (Wed, 13 Jun 2018)");
  script_name("Microsoft Excel 2013 Information Disclosure Vulnerability (KB4022191)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4022191");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists due to Microsoft Excel
  failing to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to run arbitrary code in the context of the current user.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Excel 2013");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory.
  For details refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4022191");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Excel/Version");

  exit(0);
}

include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

excelVer = get_kb_item("SMB/Office/Excel/Version");
if(!excelVer){
  exit(0);
}

excelPath = get_kb_item("SMB/Office/Excel/Install/Path");
if(!excelPath){
  excelPath = "Unable to fetch the install path";
}

if(excelVer =~ "^(15\.)" && version_is_less(version:excelVer, test_version:"15.0.5041.0999"))
{
  report = report_fixed_ver(file_checked:excelPath + "Excel.exe",
                            file_version:excelVer, vulnerable_range:"15.0 - 15.0.5041.0999");
  security_message(data:report);
  exit(0);
}
exit(99);
