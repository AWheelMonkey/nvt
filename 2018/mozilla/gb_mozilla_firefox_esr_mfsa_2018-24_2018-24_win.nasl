###############################################################################
# OpenVAS Vulnerability Test
# Id$
#
# Mozilla Firefox ESR Security Updates(mfsa_2018-24_2018-24)-Windows
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
  script_oid("1.3.6.1.4.1.25623.1.0.814063");
  script_version("$Revision: 11734 $");
  script_cve_id("CVE-2018-12386", "CVE-2018-12387");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-03 13:48:15 +0200 (Wed, 03 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-03 17:02:19 +0530 (Wed, 03 Oct 2018)");
  script_name("Mozilla Firefox ESR Security Updates(mfsa_2018-24_2018-24)-Windows");

  script_tag(name:"summary", value:"This host is installed with Mozilla Firefox ESR
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is
  present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - A type confusion error in JavaScript.

  - The JavaScript JIT compiler improperly inlines Array.prototype.push with
    multiple arguments.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to conduct code execution and disclose sensitive information.");

  script_tag(name:"affected", value:"Mozilla Firefox ESR version before 60.2.2
  on Windows.");

  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox ESR version 60.2.2
  or later, For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2018-24");
  script_xref(name:"URL", value:"http://www.mozilla.com/en-US/firefox/all.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl");
  script_mandatory_keys("Firefox-ESR/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
ffVer = infos['version'];
ffPath = infos['location'];

if(version_is_less(version:ffVer, test_version:"60.2.2"))
{
  report = report_fixed_ver(installed_version:ffVer, fixed_version:"60.2.2", install_path:ffPath);
  security_message(data:report);
  exit(0);
}
exit(0);
