###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_java_mult_unspecified_vuln01_jan16_lin.nasl 12448 2018-11-21 06:40:12Z cfischer $
#
# Oracle Java SE JRE Multiple Unspecified Vulnerabilities-01 Jan 2016 (Linux)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.108393");
  script_version("$Revision: 12448 $");
  script_cve_id("CVE-2016-0494", "CVE-2015-8126", "CVE-2016-0483", "CVE-2016-0402",
                "CVE-2016-0466", "CVE-2016-0448", "CVE-2015-7575");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-21 07:40:12 +0100 (Wed, 21 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-01-22 16:01:36 +0530 (Fri, 22 Jan 2016)");
  script_name("Oracle Java SE JRE Multiple Unspecified Vulnerabilities-01 Jan 2016 (Linux)");

  script_tag(name:"summary", value:"The host is installed with Oracle Java SE
  JRE and is prone to multiple unspecified vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to multiple
  unspecified errors.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to have an impact on confidentiality, integrity, and availability via unknown
  vectors.");

  script_tag(name:"affected", value:"Oracle Java SE 6 update 105, 7 update 91,
  8 update 66 and prior on Linux.");

  script_tag(name:"solution", value:"Apply the patch from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/cpujan2016-2367955.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_lin.nasl");
  script_mandatory_keys("Sun/Java/JRE/Linux/Ver");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE);
if(!infos)
{
  CPE = "cpe:/a:sun:jre";
  infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
}

jreVer = infos['version'];
jrePath = infos['location'];

if(jreVer =~ "^(1\.(6|7|8))")
{
  if(version_in_range(version:jreVer, test_version:"1.6.0", test_version2:"1.6.0.105")||
     version_in_range(version:jreVer, test_version:"1.7.0", test_version2:"1.7.0.91")||
     version_in_range(version:jreVer, test_version:"1.8.0", test_version2:"1.8.0.66"))
  {
    report = report_fixed_ver(installed_version:jreVer, fixed_version:"Apply the patch", install_path:jrePath);
    security_message(data:report);
    exit(0);
  }
}

exit(99);