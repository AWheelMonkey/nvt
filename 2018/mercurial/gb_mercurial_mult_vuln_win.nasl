##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mercurial_mult_vuln_win.nasl 11698 2018-09-29 03:57:28Z santu $
#
# Mercurial Multiple Vulnerabilities (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
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

CPE = "cpe:/a:mercurial:mercurial";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814059");
  script_version("$Revision: 11698 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-29 05:57:28 +0200 (Sat, 29 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-28 15:46:56 +0530 (Fri, 28 Sep 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_cve_id("CVE-2018-13346", "CVE-2018-13347", "CVE-2018-13348");

  script_tag(name:"qod_type", value:"registry");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Mercurial Multiple Vulnerabilities (Windows)");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mercurial_detect_win.nasl");
  script_mandatory_keys("Mercurial/Win/Installed");

  script_tag(name:"summary", value:"This host is installed with Mercurial
  and is prone to multiple vulnerabilities.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - The mpatch_decode function in mpatch.c mishandles certain situations
    where there should be at least 12 bytes remaining after the current position
    in the patch data, but actually are not.

  - The mpatch_apply function in mpatch.c incorrectly proceeds in cases where the
    fragment start is past the end of the original data.

  - The mpatch.c mishandles integer addition and subtraction.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is
  present on the target host.");

  script_tag(name:"affected", value:"Mercurial before version 4.6.1");

  script_tag(name:"solution", value:"Upgrade to Mercurial 4.6.1 or later.
  For updates refer to Reference links.");

  script_xref(name:"URL", value:"https://www.mercurial-scm.org/wiki/WhatsNew#Mercurial_4.6.1_.282018-06-06.29");
  script_xref(name:"URL", value:"https://www.mercurial-scm.org");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
mrVer = infos['version'];
mrPath = infos['location'];

if(version_is_less(version:mrVer, test_version:"4.6.1"))
{
  report = report_fixed_ver(installed_version:mrVer, fixed_version:"4.6.1", install_path:mrPath);
  security_message(data: report);
  exit(0);
}
exit(99);
