###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_reader_2017_apsb18-34_macosx.nasl 11505 2018-09-20 13:03:00Z santu $
#
# Adobe Reader 2017 Security Updates(apsb18-34)-MAC OS X
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:adobe:acrobat_reader";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814026");
  script_version("$Revision: 11505 $");
  script_cve_id("CVE-2018-12848", "CVE-2018-12849", "CVE-2018-12850", "CVE-2018-12801",
                "CVE-2018-12840", "CVE-2018-12778", "CVE-2018-12775");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-20 15:03:00 +0200 (Thu, 20 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-20 10:19:20 +0530 (Thu, 20 Sep 2018)");
  script_name("Adobe Reader 2017 Security Updates(apsb18-34)-MAC OS X");

  script_tag(name:"summary", value:"This host is installed with Adobe Reader 2017
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to,

  - Multiple out-of-bounds read errors.

  - An out-of-bounds write error.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to conduct arbitrary code execution in the context of the current
  user and also disclose sensitive information.");

  script_tag(name:"affected", value:"Adobe Reader 2017 version 2017.011.30099
  and earlier versions on MAC OS X.");

  script_tag(name:"solution", value:"Upgrade to Adobe Reader 2017 version
  2017.011.30102 or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/acrobat/apsb18-34.html");
  script_xref(name:"URL", value:"https://helpx.adobe.com");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_macosx.nasl");
  script_mandatory_keys("Adobe/Reader/MacOSX/Version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
readerVer = infos['version'];
InstallPath = infos['location'];

if(version_in_range(version:readerVer, test_version:"17.0", test_version2:"17.011.30099"))
{
  report = report_fixed_ver(installed_version:readerVer, fixed_version:"2017.011.30102", install_path:InstallPath);
  security_message(data:report);
  exit(0);
}
exit(0);
