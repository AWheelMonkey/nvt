###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_java_jul2017-3236622_01_win.nasl 11900 2018-10-15 07:44:31Z mmartin $
#
# Oracle Java SE Security Updates (jul2017-3236622) 01 - Windows
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
  script_oid("1.3.6.1.4.1.25623.1.0.811241");
  script_version("$Revision: 11900 $");
  script_cve_id("CVE-2017-10198", "CVE-2017-10096", "CVE-2017-10135", "CVE-2017-10110",
                "CVE-2017-10115", "CVE-2017-10116", "CVE-2017-10074", "CVE-2017-10053",
                "CVE-2017-10087", "CVE-2017-10089", "CVE-2017-10243", "CVE-2017-10102",
                "CVE-2017-10101", "CVE-2017-10107", "CVE-2017-10109", "CVE-2017-10105",
                "CVE-2017-10081", "CVE-2017-10193", "CVE-2017-10067", "CVE-2017-10108");
  script_bugtraq_id(99818, 99670, 99839, 99643, 99774, 99734, 99731, 99842, 99703, 99659,
                    99827, 99712, 99674, 99719, 99847, 99851, 99853, 99854, 99756, 99846);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-15 09:44:31 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-07-19 11:49:40 +0530 (Wed, 19 Jul 2017)");
  script_name("Oracle Java SE Security Updates (jul2017-3236622) 01 - Windows");

  script_tag(name:"summary", value:"The host is installed with Oracle Java SE
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to multiple
  unspecifide errors in 'Security', 'AWT', 'ImageIO', 'JAXP', 'Libraries',
  'RMI', 'Hotspot', 'JCE', 'JAX-WS', '2D', 'Serialization', 'Deployment'
  component of the application.");

  script_tag(name:"impact", value:"Successful exploitation of this
  vulnerability will allow remote attackers to have an impact on
  confidentiality, integrity and availablility.");

  script_tag(name:"affected", value:"Oracle Java SE version 1.6.0.151 and
  earlier, 1.7.0.141 and earlier, 1.8.0.131 and earlier on Windows");

  script_tag(name:"solution", value:"Apply the patch");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/security-advisory/cpujul2017-3236622.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_portable_win.nasl");
  script_mandatory_keys("Sun/Java/JRE/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE );
vers = infos['version'];
if( ! vers ) {
  CPE = "cpe:/a:sun:jre";
  infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
  vers = infos['version'];
}

path = infos['location'];

if(version_in_range(version:vers, test_version:"1.6.0", test_version2:"1.6.0.151") ||
   version_in_range(version:vers, test_version:"1.7.0", test_version2:"1.7.0.141") ||
   version_in_range(version:vers, test_version:"1.8.0", test_version2:"1.8.0.131"))
{
  report = report_fixed_ver(installed_version:vers, fixed_version: "Apply the patch", install_path:path);
  security_message(data:report);
  exit(0);
}
