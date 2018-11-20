###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_icloud_HT208697.nasl 12391 2018-11-16 16:12:15Z cfischer $
#
# Apple iCloud Security Updates(HT208697)-Windows
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
  script_oid("1.3.6.1.4.1.25623.1.0.813109");
  script_version("$Revision: 12391 $");
  script_cve_id("CVE-2018-4144", "CVE-2018-4101", "CVE-2018-4114", "CVE-2018-4118",
                "CVE-2018-4119", "CVE-2018-4120", "CVE-2018-4121", "CVE-2018-4122",
                "CVE-2018-4125", "CVE-2018-4127", "CVE-2018-4128", "CVE-2018-4129",
                "CVE-2018-4130", "CVE-2018-4161", "CVE-2018-4162", "CVE-2018-4163",
                "CVE-2018-4165", "CVE-2018-4113", "CVE-2018-4146", "CVE-2018-4117");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 17:12:15 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-04-02 10:23:49 +0530 (Mon, 02 Apr 2018)");
  script_name("Apple iCloud Security Updates(HT208697)-Windows");

  script_tag(name:"summary", value:"This host is installed with Apple iCloud
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - A buffer overflow error due to improper size validation..

  - Multiple memory corruption issues due to improper memory handling.

  - An array indexing issue in the handling of a function in javascript core.

  - A cross-origin issue existed with the fetch API.");

  script_tag(name:"impact", value:"Successful exploitation of this vulnerability
  will allow remote attackers to elevate privileges, exfiltrate data cross-origin,
  execute arbitrary code and lead to a denial of service condition.");

  script_tag(name:"affected", value:"Apple iCloud versions before 7.4 on Windows");

  script_tag(name:"solution", value:"Upgrade to Apple iCloud 7.4 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://support.apple.com/en-us/HT208697");
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

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE);
icVer = infos['version'];
icPath = infos['location'];

##7.4 == 7.4.0.111
if(version_is_less(version:icVer, test_version:"7.4.0.111"))
{
  report = report_fixed_ver(installed_version:icVer, fixed_version:"7.4", install_path:icPath);
  security_message(data:report);
  exit(0);
}
exit(0);
