###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_java_jan2017-2881727_03_win.nasl 11989 2018-10-19 11:25:26Z cfischer $
#
# Oracle Java SE Security Updates (jan2017-2881727) 03 - Windows
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:oracle:jre";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809784");
  script_version("$Revision: 11989 $");
  script_cve_id("CVE-2016-5547", "CVE-2016-5549", "CVE-2017-3289", "CVE-2017-3260");
  script_bugtraq_id(95521, 95530, 95525, 95576);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 13:25:26 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-01-18 18:42:46 +0530 (Wed, 18 Jan 2017)");
  script_name("Oracle Java SE Security Updates (jan2017-2881727) 03 - Windows");

  script_tag(name:"summary", value:"The host is installed with Oracle Java SE
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to multiple
  unspecified errors in 'Hotspot', 'Libraries' and 'AWT' sub-components.");

  script_tag(name:"impact", value:"Successful exploitation of this
  vulnerability will allow attackers to have some unspecified impacts
  on affected system.");

  script_tag(name:"affected", value:"Oracle Java SE version 1.7.0.121 and
  earlier, 1.8.0.112 and earlier on Windows");

  script_tag(name:"solution", value:"Apply the patch from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/security-advisory/cpujan2017-2881727.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_portable_win.nasl");
  script_mandatory_keys("Sun/Java/JRE/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

if(vers =~ "^(1\.(7|8))")
{
  if(version_in_range(version:vers, test_version:"1.7.0", test_version2:"1.7.0.121") ||
     version_in_range(version:vers, test_version:"1.8.0", test_version2:"1.8.0.112"))
  {
    report = report_fixed_ver(installed_version:vers, fixed_version: "Apply the patch", install_path:path);
    security_message(data:report);
    exit(0);
  }
}
