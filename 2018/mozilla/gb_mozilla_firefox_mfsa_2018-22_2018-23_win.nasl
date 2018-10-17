###############################################################################
# OpenVAS Vulnerability Test
# Id$
#
# Mozilla Firefox Security Updates(mfsa_2018-22_2018-23)-Windows
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

CPE = "cpe:/a:mozilla:firefox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814046");
  script_version("$Revision: 11601 $");
  script_cve_id("CVE-2018-12385");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-25 13:44:21 +0200 (Tue, 25 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-25 11:40:16 +0530 (Tue, 25 Sep 2018)");
  script_name("Mozilla Firefox Security Updates(mfsa_2018-22_2018-23)-Windows");

  script_tag(name:"summary", value:"This host is installed with Mozilla Firefox
  and is prone to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is
  present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to data stored in the
  local cache in the user profile directory.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to write data into the local cache or from locally installed malware. This issue
  also triggers a non-exploitable startup crash for users.");

  script_tag(name:"affected", value:"Mozilla Firefox version before 62.0.2 on
  Windows.");

  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox version 62.0.2
  or later, For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2018-22");
  script_xref(name:"URL", value:"http://www.mozilla.com/en-US/firefox/all.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl");
  script_mandatory_keys("Firefox/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
ffVer = infos['version'];
ffPath = infos['location'];

if(version_is_less(version:ffVer, test_version:"62.0.2"))
{
  report = report_fixed_ver(installed_version:ffVer, fixed_version:"62.0.2", install_path:ffPath);
  security_message(data:report);
  exit(0);
}
