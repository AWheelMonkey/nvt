###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_mfsa_2018-10_2018-10_macosx.nasl 12068 2018-10-25 07:21:15Z mmartin $
#
# Mozilla Firefox ESR Security Updates(mfsa_2018-10_2018-10)-MAC OS X
#
# Authors:
# Rinu Kuriaksoe <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.813055");
  script_version("$Revision: 12068 $");
  script_cve_id("CVE-2018-5148");
  script_bugtraq_id(103506);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-25 09:21:15 +0200 (Thu, 25 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-03-27 16:44:48 +0530 (Tue, 27 Mar 2018)");
  script_name("Mozilla Firefox ESR Security Updates(mfsa_2018-10_2018-10)-MAC OS X");

  script_tag(name:"summary", value:"This host is installed with
  Mozilla Firefox ESR and is prone to an use after free vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to a use after free
  error in the compositor during certain graphics operations when a raw pointer
  is used instead of a reference counted one.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to crash the affected application and denying service to
  legitimate users.");

  script_tag(name:"affected", value:"Mozilla Firefox ESR version before 52.7.3 on MAC OS X.");

  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox ESR version 52.7.3
  or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2018-10/");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("Mozilla/Firefox-ESR/MacOSX/Version");
  script_xref(name:"URL", value:"http://www.mozilla.com/en-US/firefox/all.html");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE)) exit(0);
ffVer = infos['version'];
ffPath = infos['location'];

if(version_is_less(version:ffVer, test_version:"52.7.3"))
{
  report = report_fixed_ver(installed_version:ffVer, fixed_version:"52.7.3", install_path:ffPath);
  security_message(data:report);
  exit(0);
}

exit(99);
