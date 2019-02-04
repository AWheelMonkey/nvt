###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_icloud_HT209346.nasl 12688 2018-12-06 13:59:18Z santu $
#
# Apple iCloud Security Updates(HT209346)-Windows
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

CPE = "cpe:/a:apple:icloud";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814603");
  script_version("$Revision: 12688 $");
  script_cve_id("CVE-2018-4440", "CVE-2018-4439", "CVE-2018-4437", "CVE-2018-4464",
                "CVE-2018-4441", "CVE-2018-4442", "CVE-2018-4443", "CVE-2018-4438");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-12-06 14:59:18 +0100 (Thu, 06 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-06 11:23:39 +0530 (Thu, 06 Dec 2018)");
  script_name("Apple iCloud Security Updates(HT209346)-Windows");

  script_tag(name:"summary", value:"This host is installed with Apple iCloud
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is
  present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - A logic issue was addressed with improved state management.

  - A logic issue was addressed with improved validation.

  - Multiple memory corruption issues were addressed with improved memory handling.

  - A logic issue existed resulting in memory corruption.");

  script_tag(name:"impact", value:"Successful exploitation allow attackers to
  conduct spoofing attacks and run arbitrary code execution.");

  script_tag(name:"affected", value:"Apple iCloud versions before 7.9 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Apple iCloud 7.9 or later.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://support.apple.com/en-us/HT209346");
  script_xref(name:"URL", value:"http://www.apple.com/support");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_apple_icloud_detect_win.nasl");
  script_mandatory_keys("apple/icloud/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
icVer = infos['version'];
icPath = infos['location'];

if(version_is_less(version:icVer, test_version:"7.9"))
{
  report = report_fixed_ver(installed_version:icVer, fixed_version:"7.9", install_path:icPath);
  security_message(data:report);
  exit(0);
}
exit(99);
