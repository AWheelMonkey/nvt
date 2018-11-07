###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_acrobat_reader_2017_apsb17-24_macosx.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# Adobe Acrobat Reader 2017 Security Updates(apsb17-24)-MAC OS X
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

CPE = "cpe:/a:adobe:acrobat_reader";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812549");
  script_version("$Revision: 12120 $");
  script_cve_id("CVE-2017-3016", "CVE-2017-3038", "CVE-2017-3113", "CVE-2017-3115",
                "CVE-2017-3116", "CVE-2017-3117", "CVE-2017-3118", "CVE-2017-3119",
                "CVE-2017-3120", "CVE-2017-3121", "CVE-2017-3122", "CVE-2017-3123",
                "CVE-2017-3124", "CVE-2017-11209", "CVE-2017-11210", "CVE-2017-11211",
                "CVE-2017-11212", "CVE-2017-11214", "CVE-2017-11216", "CVE-2017-11217",
                "CVE-2017-11218", "CVE-2017-11219", "CVE-2017-11220", "CVE-2017-11221",
                "CVE-2017-11222", "CVE-2017-11223", "CVE-2017-11224", "CVE-2017-11226",
                "CVE-2017-11227", "CVE-2017-11228", "CVE-2017-11229", "CVE-2017-11230",
                "CVE-2017-11231", "CVE-2017-11232", "CVE-2017-11233", "CVE-2017-11234",
                "CVE-2017-11235", "CVE-2017-11236", "CVE-2017-11237", "CVE-2017-11238",
                "CVE-2017-11239", "CVE-2017-11241", "CVE-2017-11242", "CVE-2017-11243",
                "CVE-2017-11244", "CVE-2017-11245", "CVE-2017-11246", "CVE-2017-11248",
                "CVE-2017-11249", "CVE-2017-11251", "CVE-2017-11252", "CVE-2017-11254",
                "CVE-2017-11255", "CVE-2017-11256", "CVE-2017-11257", "CVE-2017-11258",
                "CVE-2017-11259", "CVE-2017-11260", "CVE-2017-11261", "CVE-2017-11262",
                "CVE-2017-11263", "CVE-2017-11265", "CVE-2017-11267", "CVE-2017-11268",
                "CVE-2017-11269", "CVE-2017-11270", "CVE-2017-11271");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-03-09 13:25:15 +0530 (Fri, 09 Mar 2018)");
  script_name("Adobe Acrobat Reader 2017 Security Updates(apsb17-24)-MAC OS X");

  script_tag(name:"summary", value:"This host is installed with Adobe Acrobat
  Reader 2017 and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaws exists due to,

  - Multiple memory corruption vulnerabilities.

  - Multiple use after free vulnerabilities.

  - Multiple heap overflow vulnerabilities.

  - Multiple security bypass vulnerabilities.

  - Multiple type confusion errors.

  - An insufficient verification of data authenticity.");

  script_tag(name:"impact", value:"Successful exploitation of these
  vulnerabilities will allow remote attackers to execute arbitrary code
  and disclose sensitive information.");

  script_tag(name:"affected", value:"Adobe Acrobat Reader 2017.008.30051 and earlier on macosx.");

  script_tag(name:"solution", value:"Upgrade to Adobe Reader 2017 version
  2017.011.30066 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/acrobat/apsb17-24.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_macosx.nasl");
  script_mandatory_keys("Adobe/Reader/MacOSX/Version");
  script_xref(name:"URL", value:"http://www.adobe.com/in/products/acrobat.html");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
readerVer = infos['version'];
InstallPath = infos['location'];

##2017.011.30065 == 17.011.30065
if(version_in_range(version:readerVer, test_version:"17.0", test_version2:"17.011.30065"))
{
  report = report_fixed_ver(installed_version:readerVer, fixed_version:"2017.011.30066", install_path:InstallPath);
  security_message(data:report);
  exit(0);
}
