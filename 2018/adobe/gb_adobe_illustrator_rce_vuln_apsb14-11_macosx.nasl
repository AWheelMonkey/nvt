###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_illustrator_rce_vuln_apsb14-11_macosx.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# Adobe Illustrator Remote Code Execution Vulnerability-Mac OS X (apsb14-11)
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

CPE = "cpe:/a:adobe:illustrator";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813261");
  script_version("$Revision: 12120 $");
  script_cve_id("CVE-2014-0513");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-07-12 14:41:49 +0530 (Thu, 12 Jul 2018)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Adobe Illustrator Remote Code Execution Vulnerability-Mac OS X (apsb14-11)");

  script_tag(name:"summary", value:"The host is installed with Adobe Illustrator
  and is prone to a remote code execution vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to some unspecified
  error in the Adobe Illustrator.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary code on the affected system.");

  script_tag(name:"affected", value:"Adobe Illustrator CS6 before 16.0.5 and
  16.2.x before 16.2.2 on Mac OS X.");

  script_tag(name:"solution", value:"Upgrade to Adobe Illustrator CS6 version
  16.0.5 or 16.2.2 or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/illustrator/apsb14-11.html");
  script_xref(name:"URL", value:"https://www.adobe.com");

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_adobe_illustrator_detect_macosx.nasl");
  script_mandatory_keys("Adobe/Illustrator/MacOSX/Version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
adobeVer = infos['version'];
adobePath = infos['location'];

if(adobeVer =~ "^16\.")
{
  if(version_is_less(version:adobeVer, test_version:"16.0.5")){
    fix = "16.0.5";
  }

  else if(version_in_range(version:adobeVer, test_version:"16.2", test_version2:"16.2.1")){
    fix = "16.2.2";
  }

  if(fix)
  {
    report = report_fixed_ver(installed_version:adobeVer, fixed_version:fix, install_path:adobePath);
    security_message(data: report);
    exit(0);
  }
}
exit(0);
