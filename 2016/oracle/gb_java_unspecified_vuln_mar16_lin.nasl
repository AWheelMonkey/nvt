###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_java_unspecified_vuln_mar16_lin.nasl 12448 2018-11-21 06:40:12Z cfischer $
#
# Oracle Java SE JRE Unspecified Vulnerability March 2016 (Linux)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.108392");
  script_version("$Revision: 12448 $");
  script_cve_id("CVE-2016-0636");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-21 07:40:12 +0100 (Wed, 21 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-03-28 14:58:10 +0530 (Mon, 28 Mar 2016)");
  script_name("Oracle Java SE JRE Unspecified Vulnerability March 2016 (Linux)");

  script_tag(name:"summary", value:"The host is installed with Oracle Java SE
  and is prone to unspecified vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to some unspecified
  error.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to have an impact on confidentiality, integrity and availability via unknown vectors.");

  script_tag(name:"affected", value:"Oracle Java SE 7 update 97, 8 update 73,
  8 update 74 and prior on Linux.");

  script_tag(name:"solution", value:"Apply the patch from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/alert-cve-2016-0636-2949497.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_lin.nasl");
  script_mandatory_keys("Sun/Java/JRE/Linux/Ver");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);

jreVer = infos['version'];
jrePath = infos['location'];

if(jreVer =~ "^(1\.(7|8))")
{
  if(version_in_range(version:jreVer, test_version:"1.7.0", test_version2:"1.7.0.97")||
     version_in_range(version:jreVer, test_version:"1.8.0", test_version2:"1.8.0.74"))
  {
    report = report_fixed_ver(installed_version:jreVer, fixed_version:"Apply the patch", install_path:jrePath);
    security_message(data:report);
    exit(0);
  }
}

exit(99);