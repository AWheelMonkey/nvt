###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_libreoffice_swctbwrapper_fun_mem_corru_vuln_macosx.nasl 12116 2018-10-26 10:01:35Z mmartin $
#
# LibreOffice 'SwCTBWrapper::Read' Function Memory Corruption Vulnerability (Mac OS X)
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

CPE = "cpe:/a:libreoffice:libreoffice";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813091");
  script_version("$Revision: 12116 $");
  script_cve_id("CVE-2018-10120");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:01:35 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-04-17 14:19:38 +0530 (Tue, 17 Apr 2018)");
  script_name("LibreOffice 'SwCTBWrapper::Read' Function Memory Corruption Vulnerability (Mac OS X)");

  script_tag(name:"summary", value:"This host is installed with LibreOffice and
  is prone to a memory corruption vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists as 'SwCTBWrapper::Read'
  function in sw/source/filter/ww8/ww8toolbar.cxx in LibreOffice does not
  validate a customizations index.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause a denial of service (heap-based buffer overflow with write
  access) or possibly have unspecified other impact.");

  script_tag(name:"affected", value:"LibreOffice before 5.4.6.1 and 6.x before
  6.0.2.1 on Mac OS X.");

  script_tag(name:"solution", value:"Upgrade to LibreOffice version 5.4.6.1 or
  6.0.2.1 or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=6173");
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_libreoffice_detect_macosx.nasl");
  script_mandatory_keys("LibreOffice/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE);
vers = infos['version'];
path = infos['location'];

if(version_is_less(version:vers, test_version:"5.4.6.1")){
  fix = "5.4.6.1";
}

else if(vers =~ "^6\." && version_is_less(version:vers, test_version:"6.0.2.1")){
  fix = "6.0.2.1";
}

if(fix)
{
  report = report_fixed_ver(installed_version:vers, fixed_version:fix, install_path:path);
  security_message(data:report);
  exit(0);
}
exit(0);
