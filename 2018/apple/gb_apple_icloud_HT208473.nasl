###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_icloud_HT208473.nasl 12410 2018-11-19 10:06:05Z cfischer $
#
# Apple iCloud Security Updates( HT208473 )
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.812667");
  script_version("$Revision: 12410 $");
  script_cve_id("CVE-2018-4088", "CVE-2018-4096");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-11-19 11:06:05 +0100 (Mon, 19 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-01-24 12:10:39 +0530 (Wed, 24 Jan 2018)");
  script_name("Apple iCloud Security Updates( HT208473 )");

  script_tag(name:"summary", value:"This host is installed with Apple iCloud
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to multiple
  memory corruption issues addressed with improved memory handling.");

  script_tag(name:"impact", value:"Successful exploitation of these
  vulnerabilities will allow remote attackers to execute arbitrary code on the
  affected system.");

  script_tag(name:"affected", value:"Apple iCloud versions before 7.3");

  script_tag(name:"solution", value:"Upgrade to Apple iCloud 7.3 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://support.apple.com/en-us/HT208473");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_apple_icloud_detect_win.nasl");
  script_mandatory_keys("apple/icloud/Win/Ver");
  script_xref(name:"URL", value:"http://www.apple.com/support");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
icVer = infos['version'];
icPath = infos['location'];

if(version_is_less(version:icVer, test_version:"7.3"))
{
  report = report_fixed_ver(installed_version:icVer, fixed_version:"7.3", install_path:icPath);
  security_message(data:report);
  exit(0);
}
exit(0);
