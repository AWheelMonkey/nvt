###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_acrobat_dc_classic_apsb19-02_win.nasl 13316 2019-01-28 07:41:51Z asteins $
#
# Adobe Acrobat DC (Classic Track) Security Updates(apsb19-02)-Windows
#
# Authors:
# Vidita V Koushik <vidita@secpod.com>
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

CPE = "cpe:/a:adobe:acrobat_dc_classic";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814809");
  script_version("$Revision: 13316 $");
  script_cve_id("CVE-2018-16011", "CVE-2018-16018");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2019-01-28 08:41:51 +0100 (Mon, 28 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-04 11:43:03 +0530 (Fri, 04 Jan 2019)");
  script_name("Adobe Acrobat DC (Classic Track) Security Updates(apsb19-02)-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Acrobat DC
  Classic 2015 and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to,

  - Use after free error.

  - Security bypass error.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to conduct arbitrary code execution in the context of the current
  user and escalate privileges.");

  script_tag(name:"affected", value:"Adobe Acrobat DC Classic 2015 version 2015.x
  before 2015.006.30461 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Adobe Acrobat DC Classic 2015 version
  2015.006.30464 or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/acrobat/apsb19-02.html");
  script_xref(name:"URL", value:"https://helpx.adobe.com");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_acrobat_dc_classic_detect_win.nasl");
  script_mandatory_keys("Adobe/AcrobatDC/Classic/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
readerVer = infos['version'];
InstallPath = infos['location'];

## 2015.006.30461 => 15.006.30461
if(version_in_range(version:readerVer, test_version:"15.0", test_version2:"15.006.30461"))
{
  report = report_fixed_ver(installed_version:readerVer, fixed_version:"2015.006.30464", install_path:InstallPath);
  security_message(data:report);
  exit(0);
}
exit(99);
