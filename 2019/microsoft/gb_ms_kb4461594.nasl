###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4461594.nasl 13147 2019-01-18 11:35:50Z mmartin $
#
# Microsoft Word 2013 Service Pack 1 Multiple Vulnerabilities (KB4461594)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2019 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.814584");
  script_version("$Revision: 13147 $");
  script_cve_id("CVE-2019-0561", "CVE-2019-0585");
  script_bugtraq_id(106399, 106392);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2019-01-18 12:35:50 +0100 (Fri, 18 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-09 12:32:30 +0530 (Wed, 09 Jan 2019)");
  script_name("Microsoft Word 2013 Service Pack 1 Multiple Vulnerabilities (KB4461594)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4461594");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist

  - when Microsoft Word macro buttons are used improperly.

  - in Microsoft Word software when it fails to properly handle
    objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to read arbitrary files from a targeted system.");

  script_tag(name:"affected", value:"Microsoft Word 2013 Service Pack 1");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4461594");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
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

if(exeVer =~ "^15\." && version_is_less(version:exeVer, test_version:"15.0.5101.1001"))
{
  report = report_fixed_ver(file_checked:exePath + "winword.exe",
                            file_version:exeVer, vulnerable_range:"15.0 - 15.0.5101.1000");
  security_message(data:report);
  exit(0);
}
exit(99);
