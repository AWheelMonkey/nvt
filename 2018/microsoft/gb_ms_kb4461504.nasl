###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4461504.nasl 12352 2018-11-14 15:03:21Z santu $
#
# Microsoft Word 2016 Remote Code Execution Vulnerability (KB4461504)
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
  script_oid("1.3.6.1.4.1.25623.1.0.814162");
  script_version("$Revision: 12352 $");
  script_cve_id("CVE-2018-8573");
  script_bugtraq_id(105836);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-14 16:03:21 +0100 (Wed, 14 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-14 12:49:09 +0530 (Wed, 14 Nov 2018)");
  script_name("Microsoft Word 2016 Remote Code Execution Vulnerability (KB4461504)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4461504");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error in Microsoft
  Word when it fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to use a specially crafted file to perform actions in the security context of
  the current user.");

  script_tag(name:"affected", value:"Microsoft Word 2016");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL" , value:"https://support.microsoft.com/en-us/help/4461504");
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

if(version_in_range(version:exeVer, test_version:"16.0", test_version2:"16.0.4771.0999"))
{
  report = report_fixed_ver(file_checked:exePath + "winword.exe",
                            file_version:exeVer, vulnerable_range:"16.0 - 16.0.4771.0999");
  security_message(data:report);
  exit(0);
}
