###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_mfsa_2018-11_2018-12_win.nasl 11044 2018-08-18 15:12:40Z cfischer $
#
# Mozilla Firefox ESR Security Updates(mfsa_2018-11_2018-12)-Windows
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
  script_oid("1.3.6.1.4.1.25623.1.0.813359");
  script_version("$Revision: 11044 $");
  script_cve_id("CVE-2018-5183", "CVE-2018-5154", "CVE-2018-5155", "CVE-2018-5157",
                "CVE-2018-5158", "CVE-2018-5159", "CVE-2018-5168", "CVE-2018-5174",
                "CVE-2018-5178", "CVE-2018-5150");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-08-18 17:12:40 +0200 (Sat, 18 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-05-11 12:34:59 +0530 (Fri, 11 May 2018)");
  script_name("Mozilla Firefox ESR Security Updates(mfsa_2018-11_2018-12)-Windows");

  script_tag(name: "summary" , value:"This host is installed with
  Mozilla Firefox ESR and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,

  - Backport critical security fixes in Skia.

  - Use-after-free error with SVG animations and clip paths.

  - Use-after-free error with SVG animations and text paths.

  - Same-origin bypass of PDF Viewer to view protected PDF files.

  - Malicious PDF can inject JavaScript into PDF Viewer.

  - Integer overflow and out-of-bounds write errors in Skia.

  - Lightweight themes can be installed without user interaction.

  - Windows Defender SmartScreen UI runs with less secure behavior for downloaded files.

  - Buffer overflow error during UTF-8 to Unicode string conversion through legacy extension.

  - Memory safety bugs.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to execute arbitrary code, bypass security restrictions corrupt memory
  and cause denial of service condition.

  Impact Level: Application.");

  script_tag(name: "affected" , value:"Mozilla Firefox ESR version before 52.8 on Windows.");

  script_tag(name: "solution" , value:"Upgrade to Mozilla Firefox ESR version 52.8
  or later, For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2018-12");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/firefox");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_portable_win.nasl");
  script_mandatory_keys("Firefox-ESR/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE)) exit(0);
ffVer = infos['version'];
ffPath = infos['location'];

if(version_is_less(version:ffVer, test_version:"52.8"))
{
  report = report_fixed_ver(installed_version:ffVer, fixed_version:"52.8", install_path:ffPath);
  security_message(data:report);
  exit(0);
}

exit(99);
