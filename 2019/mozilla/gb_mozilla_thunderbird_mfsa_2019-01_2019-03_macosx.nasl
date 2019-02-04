###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_thunderbird_mfsa_2019-01_2019-03_macosx.nasl 13368 2019-01-30 14:30:18Z santu $
#
# Mozilla Thunderbird Security Updates(mfsa_2019-01_2019-03)-MAC OS X
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:mozilla:thunderbird";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814668");
  script_version("$Revision: 13368 $");
  script_cve_id("CVE-2018-18500", "CVE-2018-18505", "CVE-2018-18501", "CVE-2016-5824");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-30 15:30:18 +0100 (Wed, 30 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-30 13:07:43 +0530 (Wed, 30 Jan 2019)");
  script_name("Mozilla Thunderbird Security Updates(mfsa_2019-01_2019-03)-MAC OS X");

  script_tag(name:"summary", value:"This host is installed with Mozilla
  Thunderbird and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to,

  - Memory safety bugs.

  - An use after free error via a crafted ics file.

  - Lack of message validation in the listener process for an Inter-process
    Communication.

  - An use after free error while parsing an HTML5 stream.");

  script_tag(name:"impact", value:"Successful exploitation allow attackers
  to cause denial of service condition, run arbitrary code and escalate privileges.");

  script_tag(name:"affected", value:"Mozilla Thunderbird version before 60.5 on MAC OS X.");

  script_tag(name:"solution", value:"Upgrade to Mozilla Thunderbird version 60.5
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2019-03/");
  script_xref(name:"URL", value:"https://www.mozilla.org");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("ThunderBird/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
tbVer = infos['version'];
tbPath = infos['location'];

if(version_is_less(version:tbVer, test_version:"60.5"))
{
  report = report_fixed_ver(installed_version:tbVer, fixed_version:"60.5", install_path:tbPath);
  security_message(data:report);
  exit(0);
}
exit(99);
