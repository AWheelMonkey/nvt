###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_mfsa_2018-18_2018-21_macosx.nasl 12767 2018-12-12 08:39:09Z asteins $
#
# Mozilla Firefox ESR Security Updates(mfsa_2018-18_2018-21)-MAC OS X
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

CPE = "cpe:/a:mozilla:firefox_esr";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813890");
  script_version("$Revision: 12767 $");
  script_cve_id("CVE-2018-12377", "CVE-2018-12378", "CVE-2018-12379", "CVE-2017-16541",
                "CVE-2018-12376");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-12-12 09:39:09 +0100 (Wed, 12 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-09-06 13:21:06 +0530 (Thu, 06 Sep 2018)");
  script_name("Mozilla Firefox ESR Security Updates(mfsa_2018-18_2018-21)-MAC OS X");

  script_tag(name:"summary", value:"This host is installed with Mozilla Firefox ESR
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - Browser proxy settings can be bypassed by using the automount feature with
    autofs to create a mount point on the local file system.

  - An out-of-bounds write error with malicious MAR file.

  - An use-after-free error in IndexedDB.

  - An use-after-free error in refresh driver timers.

  - Memory safety bugs.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to cause denial of service condition, bypass security restrictions and also
  arbitrary code execution.");

  script_tag(name:"affected", value:"Mozilla Firefox ESR version before 60.2 on MAC OS X.");

  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox ESR version 60.2 or later,
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2018-21");
  script_xref(name:"URL", value:"http://www.mozilla.com/en-US/firefox/all.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("Mozilla/Firefox-ESR/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
ffVer = infos['version'];
ffPath = infos['location'];

if(version_is_less(version:ffVer, test_version:"60.2"))
{
  report = report_fixed_ver(installed_version:ffVer, fixed_version:"60.2", install_path:ffPath);
  security_message(data:report);
  exit(0);
}
exit(0);
