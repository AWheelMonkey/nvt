###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_icloud_HT209198.nasl 12176 2018-10-31 07:39:16Z santu $
#
# Apple iCloud Security Updates(HT209198)-Windows
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

CPE = "cpe:/a:apple:icloud";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814149");
  script_version("$Revision: 12176 $");
  script_cve_id("CVE-2018-4374", "CVE-2018-4377", "CVE-2018-4372", "CVE-2018-4373",
                "CVE-2018-4375", "CVE-2018-4376", "CVE-2018-4382", "CVE-2018-4386",
                "CVE-2018-4392", "CVE-2018-4416", "CVE-2018-4409", "CVE-2018-4378");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-31 08:39:16 +0100 (Wed, 31 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-31 10:29:04 +0530 (Wed, 31 Oct 2018)");
  script_name("Apple iCloud Security Updates(HT209198)-Windows");

  script_tag(name:"summary", value:"This host is installed with Apple iCloud
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is
  present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - An issue exiss in the method for determining prime numbers.

  - A cross-site scripting issue exists in Safari.

  - Multiple memory corruption, resource exhaustion, issues in memory
    handling.");

  script_tag(name:"impact", value:"Successful exploitation allow remote attackers
  to execute arbitrary code, bypass security restrictions and conduct
  cross-site scripting.");

  script_tag(name:"affected", value:"Apple iCloud versions before 7.8 on Windows");

  script_tag(name:"solution", value:"Upgrade to Apple iCloud 7.7 or later.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://support.apple.com/en-us/HT209198");
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

if(version_is_less(version:icVer, test_version:"7.8"))
{
  report = report_fixed_ver(installed_version:icVer, fixed_version:"7.8", install_path:icPath);
  security_message(data:report);
  exit(0);
}
exit(99);
