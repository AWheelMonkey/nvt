###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4092447.nasl 11362 2018-09-12 13:37:01Z santu $
#
# Microsoft Word 2016 Remote Code Execution Vulnerability (KB4092447)
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
  script_oid("1.3.6.1.4.1.25623.1.0.813298");
  script_version("$Revision: 11362 $");
  script_cve_id("CVE-2018-8430");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-12 15:37:01 +0200 (Wed, 12 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-12 10:03:58 +0530 (Wed, 12 Sep 2018)");
  script_name("Microsoft Word 2016 Remote Code Execution Vulnerability (KB4092447)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4092447");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists in Microsoft Word if a user
  opens a specially crafted PDF file.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to cause arbitrary code execution in the context of the current user.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Word 2016");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4092447");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Word/Version");
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

exeVer = get_kb_item("SMB/Office/Word/Version");
if(!exeVer){
  exit(0);
}

exePath = get_kb_item("SMB/Office/Word/Install/Path");
if(!exePath){
  exePath = "Unable to fetch the install path";
}

if(exeVer =~ "^(16\.)" && version_is_less(version:exeVer, test_version:"16.0.4744.1000"))
{
  report = report_fixed_ver(file_checked:exePath + "winword.exe",
                            file_version:exeVer, vulnerable_range:"16.0 - 16.0.4744.0999");
  security_message(data:report);
  exit(0);
}
